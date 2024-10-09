import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tuihub_protos/librarian/v1/common.pb.dart';

import '../../../bloc/gebura/gebura_bloc.dart';
import '../../components/toast.dart';
import '../../specialized/right_panel_form.dart';
import '../frame_page.dart';

class GeburaAssignAppPanel extends StatefulWidget {
  const GeburaAssignAppPanel({super.key});

  @override
  State<StatefulWidget> createState() => _GeburaAssignAppPanelState();
}

class _GeburaAssignAppPanelState extends State<GeburaAssignAppPanel> {
  void close(BuildContext context) {
    FramePage.of(context)?.closeDrawer();
  }

  int _index = 0;
  List<AppInfo>? searchResults;
  String? searchMsg;
  AppInfo? selectedAppInfo;
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GeburaBloc, GeburaState>(
      listener: (context, state) {
        if (state is GeburaSearchNewAppInfoState) {
          setState(() {
            if (state.success) {
              searchResults = state.infos;
              if (searchResults?.isNotEmpty ?? false) {
                searchMsg = null;
              } else {
                searchMsg = '无结果';
              }
            } else if (state.processing) {
              searchMsg = '加载中';
            } else if (state.failed) {
              searchMsg = '加载失败，${state.msg}';
            } else {
              searchMsg = '无结果';
            }
          });
        }
        if (state is GeburaAssignAppInfoState && state.success) {
          const Toast(title: '', message: '设置成功').show(context);
          close(context);
        }
      },
      builder: (context, state) {
        // final app =
        //     state.selectedLibraryItem != null && state.libraryItems != null
        //         ? state.libraryItems!.firstWhere((element) =>
        //             element.id.id.toInt() == state.selectedLibraryItem!)
        //         : null;
        // TODO: Implement this
        final app = AppInfoMixed();
        return RightPanelForm(
          title: const Text('设置应用信息'),
          formFields: [
            Stepper(
              currentStep: _index,
              onStepCancel: () {
                if (_index > 0) {
                  setState(() {
                    _index -= 1;
                  });
                }
              },
              onStepContinue: () {
                if (_index <= 1) {
                  setState(() {
                    _index += 1;
                  });
                }
              },
              onStepTapped: (int index) {
                setState(() {
                  _index = index;
                });
              },
              steps: <Step>[
                Step(
                  title: const Text('应用'),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const SizedBox(
                        height: 8,
                      ),
                      TextFormField(
                        initialValue: app.name,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          label: Text('名称'),
                        ),
                      ),
                    ],
                  ),
                ),
                Step(
                  title: const Text('查找应用信息'),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(
                        height: 8,
                      ),
                      TextFormField(
                        controller: _searchController,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          label: const Text('搜索'),
                          suffixIcon: IconButton(
                            icon: const Icon(Icons.search),
                            onPressed: () {
                              context
                                  .read<GeburaBloc>()
                                  .add(GeburaSearchNewAppInfoEvent(
                                    _searchController.text,
                                  ));
                            },
                          ),
                        ),
                        onEditingComplete: () {
                          context
                              .read<GeburaBloc>()
                              .add(GeburaSearchNewAppInfoEvent(
                                _searchController.text,
                              ));
                        },
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      ListView(shrinkWrap: true, children: [
                        if (searchMsg != null)
                          Padding(
                            padding: const EdgeInsets.all(8),
                            child: Text(searchMsg!),
                          )
                        else if (searchResults != null)
                          for (final info in searchResults!)
                            ListTile(
                              title: Text(info.name),
                              subtitle: Text(info.source),
                              onTap: () {
                                setState(() {
                                  selectedAppInfo = info;
                                  _index += 1;
                                });
                              },
                            ),
                      ]),
                    ],
                  ),
                ),
                Step(
                  title: const Text('确认'),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(
                        height: 8,
                      ),
                      ListTile(
                        title: const Text('受影响的应用'),
                        subtitle: Text(app.name),
                      ),
                      ListTile(
                        title: const Text('新应用信息'),
                        subtitle: Text('${selectedAppInfo?.name}'),
                      ),
                      ListTile(
                        title: const Text('应用信息来源'),
                        subtitle: Text('${selectedAppInfo?.source}'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
          errorMsg: state is GeburaAssignAppInfoState && state.failed
              ? state.msg
              : null,
          onSubmit: app == null
              ? null
              : () {
                  if (selectedAppInfo == null) {
                    const Toast(title: '', message: '未选择应用信息').show(context);
                  } else {
                    context
                        .read<GeburaBloc>()
                        .add(GeburaAssignAppWithNewInfoEvent(
                          app.id,
                          selectedAppInfo!.source,
                          selectedAppInfo!.sourceAppId,
                        ));
                  }
                },
          submitting: state is GeburaAssignAppInfoState && state.processing,
          close: () => close(context),
        );
      },
    );
  }
}
