import 'dart:async';
import 'dart:convert';

import 'package:extended_image/extended_image.dart';
import 'package:file_picker/file_picker.dart';
import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_jsonschema_builder/flutter_jsonschema_builder.dart';
import 'package:multi_select_flutter/bottom_sheet/multi_select_bottom_sheet_field.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:multi_select_flutter/util/multi_select_list_type.dart';
import 'package:tuihub_protos/google/protobuf/duration.pb.dart' as $duration;
import 'package:tuihub_protos/librarian/sephirah/v1/sephirah/yesod.pb.dart';
import 'package:tuihub_protos/librarian/v1/wellknown.pb.dart';
import 'package:universal_ui/universal_ui.dart';

import '../../../bloc/main_bloc.dart';
import '../../../bloc/yesod/yesod_bloc.dart';
import '../../../common/opml/opml.dart';
import '../../../l10n/l10n.dart';
import '../../../l10n/librarian.dart';
import '../../../route.dart';
import '../../components/input_formatters.dart';

import '../../helper/duration_format.dart';
import '../../layout/card_list_page.dart';
import '../../specialized/right_panel_form.dart';
import '../frame_page.dart';

class YesodFeedManagePage extends StatelessWidget {
  const YesodFeedManagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<YesodBloc, YesodState>(builder: (context, state) {
      final listData = state.feedConfigs ?? [];
      return ListManagePage(
        title: S.of(context).feedConfigManage,
        processing: state is YesodFeedConfigLoadState && state.processing,
        msg: state is YesodFeedConfigLoadState ? state.msg : '',
        onRefresh: () {
          context.read<YesodBloc>().add(YesodFeedConfigLoadEvent(null));
        },
        onAdd: () {
          const YesodFunctionRoute(YesodFunctions.feedManage,
                  action: YesodActions.feedAdd)
              .go(context);
          ModuleFramePage.of(context)?.openDrawer();
        },
        popupMenuItems: [
          UniversalToolBarItem(
            onPressed: () {
              unawaited(showDialog<void>(
                context: context,
                builder: (_) {
                  return BlocProvider.value(
                    value: context.read<YesodBloc>(),
                    child: const _ExportOPMLDialog(),
                  );
                },
              ));
            },
            label: const Text('导出OPML'),
          ),
        ],
        children: [
          for (var i = 0; i < listData.length; i++)
            UniversalListTile(
              leading: listData[i].feed.image.url.isNotEmpty
                  ? CircleAvatar(
                      backgroundImage: ExtendedNetworkImageProvider(
                        listData[i].feed.image.url,
                      ),
                    )
                  : null,
              trailing: const Icon(Icons.edit),
              onTap: () {
                YesodFunctionRoute(YesodFunctions.feedManage,
                        action: YesodActions.feedEdit, $extra: i)
                    .go(context);
                ModuleFramePage.of(context)?.openDrawer();
              },
              title: Text(listData[i].config.name.isNotEmpty
                  ? listData[i].config.name
                  : listData[i].feed.title),
              subtitle: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                      '${S.current.FEED_CONFIG_STATUS}: ${feedConfigStatusString(listData[i].config.status)}'),
                  if (listData[i].config.latestPullStatus ==
                      FeedConfigPullStatus.FEED_CONFIG_PULL_STATUS_SUCCESS)
                    Text(
                        '上次更新：${DurationHelper.recentString(listData[i].config.latestPullTime.toDateTime())}')
                  else if (listData[i].config.latestPullStatus ==
                      FeedConfigPullStatus.FEED_CONFIG_PULL_STATUS_FAILED)
                    Text('更新失败：${listData[i].config.latestPullMessage}')
                  else
                    const Text('更新中...'),
                ],
              ),
            ),
        ],
      );
    });
  }
}

class YesodFeedManageAddPanel extends StatelessWidget {
  const YesodFeedManageAddPanel({super.key});

  void close(BuildContext context) {
    ModuleFramePage.of(context)?.closeDrawer();
  }

  @override
  Widget build(BuildContext context) {
    final feedSources =
        context.read<MainBloc>().state.serverFeatureSummary?.feedSources ?? [];
    var source = feedSources.isNotEmpty ? feedSources.first : null;
    var config = '';
    var name = '';
    var category = '';
    var refreshInterval = 60;
    var enabled = true;
    var hideItems = false;
    var actions = <InternalID?>[];
    final jsonFormController = JsonFormController();
    var buildCounter = 0;

    return BlocConsumer<YesodBloc, YesodState>(
      listener: (context, state) {
        if (state is YesodFeedConfigAddState && state.success) {
          UniversalToast.show(context, message: '添加成功');
          close(context);
        }
      },
      builder: (context, state) {
        final actionSets = state.feedActionSets ?? [];
        return RightPanelForm(
          title: Text(S.of(context).feedConfigAdd),
          formFields: [
            UniversalTextFormField(
              onChanged: (newValue) => name = newValue,
              labelText: '名称',
              validator: (value) {
                if (value?.isEmpty ?? false) {
                  return S.of(context).requiredField;
                }
                return null;
              },
            ),
            if (feedSources.isEmpty)
              const TextFormErrorMessage(message: '当前服务器无可用订阅源'),
            UniversalDropdownButtonFormField(
              labelText: '订阅源类型',
              value: source,
              items: [
                for (final s in feedSources)
                  UniversalDropdownMenuItem(
                    value: s,
                    child: Text(s.id),
                  ),
              ],
              onChanged: (newValue) => source = newValue,
              validator: (value) {
                if (value == null) {
                  return '请选择订阅源类型';
                }
                return null;
              },
            ),
            if (source != null)
              JsonForm(
                key: ValueKey(buildCounter++),
                controller: jsonFormController,
                jsonSchema: feedSources
                    .firstWhere((e) => e.id == source!.id)
                    .configJsonSchema,
                jsonData: config,
                onFormDataSaved: (data) {
                  config = jsonEncode(data);
                },
                jsonFormSchemaUiConfig: JsonFormSchemaUiConfig(
                  expandGenesis: true,
                  headerTitleBuilder: (_, __) => Container(),
                  submitButtonBuilder: (_) => Container(),
                ),
              ),
            UniversalTextFormField(
              onChanged: (newValue) => refreshInterval = int.parse(newValue),
              initialValue: refreshInterval.toString(),
              labelText: '刷新间隔(分钟)',
              inputFormatters: [IntInputFormatter()],
              // The validator receives the text that the user has entered.
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return '请输入刷新间隔';
                }
                return null;
              },
            ),
            UniversalTextFormField(
              onChanged: (newValue) => category = newValue,
              labelText: '分组',
            ),
            MultiSelectBottomSheetField<InternalID?>(
              title: const Text('规则集'),
              buttonText: const Text('自动化规则'),
              items:
                  actionSets.map((e) => MultiSelectItem(e.id, e.name)).toList(),
              listType: MultiSelectListType.LIST,
              onConfirm: (values) {
                actions = values;
              },
              decoration: BoxDecoration(
                borderRadius: UniversalUI.of(context).defaultBorderRadius,
              ),
            ),
            UniversalSwitchFormField(
              onSaved: (newValue) => enabled = newValue ?? false,
              title: const Text('立即启用'),
              initialValue: enabled,
            ),
            UniversalSwitchFormField(
              onSaved: (newValue) => hideItems = newValue ?? false,
              title: const Text('隐藏内容'),
              initialValue: hideItems,
            ),
          ],
          errorMsg: state is YesodFeedConfigAddState && state.failed
              ? state.msg
              : null,
          onSubmit: () {
            if (jsonFormController.submit()) {
              context.read<YesodBloc>().add(YesodFeedConfigAddEvent(
                  null,
                  FeedConfig(
                    name: name,
                    description: '',
                    source: FeatureRequest(
                      id: source!.id,
                      configJson: config,
                    ),
                    status: enabled
                        ? FeedConfigStatus.FEED_CONFIG_STATUS_ACTIVE
                        : FeedConfigStatus.FEED_CONFIG_STATUS_SUSPEND,
                    pullInterval: $duration.Duration(
                      seconds: $fixnum.Int64(refreshInterval * 60),
                    ),
                    category: category,
                    hideItems: hideItems,
                    actionSets: actions.map((e) => e!).toList(),
                  )));
            }
          },
          submitting: state is YesodFeedConfigAddState && state.processing,
          close: () => close(context),
        );
      },
    );
  }
}

class YesodFeedManageEditPanel extends StatelessWidget {
  const YesodFeedManageEditPanel({super.key, required this.index});

  final int? index;

  void close(BuildContext context) {
    ModuleFramePage.of(context)?.closeDrawer();
  }

  @override
  Widget build(BuildContext context) {
    final feedSources =
        context.read<MainBloc>().state.serverFeatureSummary?.feedSources ?? [];
    return BlocConsumer<YesodBloc, YesodState>(
      listener: (context, state) {
        if (state is YesodFeedConfigEditState && state.success) {
          UniversalToast.show(context, message: '已应用更改');
          close(context);
        }
      },
      builder: (context, state) {
        final actionSets = state.feedActionSets ?? [];
        final config = index != null && state.feedConfigs != null
            ? state.feedConfigs![index!].config
            : FeedConfig();
        var name = config.name;
        var configJson = config.source.configJson;
        var feedEnabled =
            config.status == FeedConfigStatus.FEED_CONFIG_STATUS_ACTIVE;
        var pullInterval = config.pullInterval.seconds.toInt() ~/ 60;
        var category = config.category;
        var hideItems = config.hideItems;
        List<InternalID?> actions = config.actionSets;
        final jsonFormController = JsonFormController();

        return RightPanelForm(
          title: Text(S.of(context).feedConfigEdit),
          formFields: [
            TextReadOnlyFormField(
              label: S.of(context).id,
              value: config.id.id.toString(),
            ),
            UniversalTextFormField(
              initialValue: name,
              onSaved: (newValue) => name = newValue!,
              labelText: '名称',
              validator: (value) {
                if (value?.isEmpty ?? false) {
                  return S.of(context).requiredField;
                }
                return null;
              },
            ),
            TextReadOnlyFormField(
              label: '订阅源类型',
              value: config.source.id,
            ),
            if (feedSources.isEmpty ||
                !feedSources.any((e) => e.id == config.source.id))
              const TextFormErrorMessage(message: '服务器未启用当前订阅源')
            else
              JsonForm(
                controller: jsonFormController,
                jsonSchema: feedSources
                    .firstWhere((e) => e.id == config.source.id)
                    .configJsonSchema,
                jsonData: configJson,
                onFormDataSaved: (data) {
                  configJson = jsonEncode(data);
                },
                jsonFormSchemaUiConfig: JsonFormSchemaUiConfig(
                  expandGenesis: true,
                  headerTitleBuilder: (_, __) => Container(),
                  submitButtonBuilder: (_) => Container(),
                ),
              ),
            UniversalTextFormField(
              initialValue: pullInterval.toString(),
              onSaved: (newValue) => pullInterval = int.parse(newValue!),
              labelText: '刷新间隔(分钟)',
              inputFormatters: [IntInputFormatter()],
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return '请输入刷新间隔';
                }
                return null;
              },
            ),
            UniversalTextFormField(
              initialValue: category,
              onSaved: (newValue) => category = newValue!,
              labelText: '分组',
            ),
            MultiSelectDialogField<InternalID?>(
              title: const Text('规则集'),
              buttonText: const Text('自动化规则'),
              initialValue: actions,
              searchable: true,
              items: [
                for (final e in actionSets)
                  if (e.id.id != 0) MultiSelectItem(e.id, e.name),
              ],
              itemsTextStyle: TextStyle(
                fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize,
                color: Theme.of(context).colorScheme.onSurface,
              ),
              selectedItemsTextStyle: TextStyle(
                fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize,
                color: Theme.of(context).colorScheme.onSurface,
              ),
              listType: MultiSelectListType.LIST,
              onConfirm: (values) {
                actions = values;
              },
              decoration: BoxDecoration(
                borderRadius: UniversalUI.of(context).defaultBorderRadius,
              ),
            ),
            UniversalSwitchFormField(
              initialValue: feedEnabled,
              onSaved: (newValue) => feedEnabled = newValue!,
              title: const Text('启用'),
            ),
            UniversalSwitchFormField(
              initialValue: hideItems,
              onSaved: (newValue) => hideItems = newValue!,
              title: const Text('隐藏内容'),
            ),
          ],
          errorMsg: state is YesodFeedConfigEditState && state.failed
              ? state.msg
              : null,
          onSubmit: () {
            if (jsonFormController.submit()) {
              context.read<YesodBloc>().add(YesodFeedConfigEditEvent(
                    null,
                    FeedConfig(
                      id: config.id,
                      name: name,
                      source: config.source,
                      status: feedEnabled
                          ? FeedConfigStatus.FEED_CONFIG_STATUS_ACTIVE
                          : FeedConfigStatus.FEED_CONFIG_STATUS_SUSPEND,
                      pullInterval: $duration.Duration(
                        seconds: $fixnum.Int64(pullInterval * 60),
                      ),
                      category: category,
                      latestPullTime: config.latestPullTime,
                      hideItems: hideItems,
                      actionSets: actions.map((e) => e!).toList(),
                    ),
                  ));
            }
          },
          submitting: state is YesodFeedConfigEditState && state.processing,
          close: () => close(context),
        );
      },
    );
  }
}

class _ExportOPMLDialog extends StatefulWidget {
  const _ExportOPMLDialog();

  @override
  _ExportOPMLDialogState createState() => _ExportOPMLDialogState();
}

class _ExportOPMLDialogState extends State<_ExportOPMLDialog> {
  @override
  void initState() {
    super.initState();
    unawaited(genOPML(context.read<YesodBloc>().state.feedConfigs ?? []));
  }

  OPML? _opml;

  Future<void> genOPML(
      List<ListFeedConfigsResponse_FeedWithConfig> feedConfigs) async {
    final items = <OPMLItem>[];
    for (final e in feedConfigs) {
      if (e.config.source.id != 'rss' || e.config.source.configJson.isEmpty) {
        continue;
      }
      try {
        final config = jsonDecode(e.config.source.configJson);
        items.add(OPMLItem(
          title: e.config.name,
          xmlUrl: config['url'] as String? ?? '',
        ));
      } catch (e) {
        continue;
      }
      setState(() {
        _opml = OPML(title: 'TuiHub export', items: items);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return UniversalDialog(
      title: const Text('导出OPML'),
      content: SizedBox(
        width: 600,
        child: _opml == null
            ? const Center(child: CircularProgressIndicator())
            : Text('导出${_opml!.items.length}个订阅'),
      ),
      actions: [
        UniversalDialogAction(
          onPressed: _opml != null
              ? () async {
                  final data = _opml!.toOPMLString();
                  await Clipboard.setData(ClipboardData(text: data));
                  UniversalToast.show(context, message: '已复制到剪贴板');
                  Navigator.of(context).pop();
                }
              : null,
          child: const Text('复制到剪贴板'),
        ),
        UniversalDialogAction(
          onPressed: _opml != null
              ? () async {
                  final data = _opml!.toOPMLString();
                  final file = await FilePicker.platform.saveFile(
                    fileName: 'tuihub_export.opml',
                    bytes: utf8.encode(data),
                  );
                  if (file != null) {
                    UniversalToast.show(context, message: '已保存到 $file');
                    Navigator.of(context).pop();
                  }
                }
              : null,
          child: const Text('保存到文件'),
        ),
        UniversalDialogAction(
          onPressed: () {
            Navigator.of(context).pop();
          },
          isPrimary: true,
          child: const Text('关闭'),
        ),
      ],
    );
  }
}
