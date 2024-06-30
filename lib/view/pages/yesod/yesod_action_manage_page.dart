import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tuihub_protos/librarian/sephirah/v1/yesod.pb.dart';

import '../../../bloc/yesod/yesod_bloc.dart';
import '../../../l10n/l10n.dart';
import '../../../route.dart';
import '../../components/toast.dart';
import '../../layout/card_list_page.dart';
import '../../specialized/right_panel_form.dart';
import '../frame_page.dart';

class YesodActionManagePage extends StatelessWidget {
  const YesodActionManagePage({super.key});

  @override
  Widget build(BuildContext context) {
    var firstBuild = true;
    return BlocBuilder<YesodBloc, YesodState>(builder: (context, state) {
      if (firstBuild) {
        firstBuild = false;
        context.read<YesodBloc>().add(YesodInitEvent());
      }
      final listData = state.feedActionSets ?? [];
      return ListManagePage(
        title: S.of(context).feedActionSetManage,
        processing: state is YesodFeedActionSetLoadState && state.processing,
        msg: state is YesodFeedActionSetLoadState ? state.msg : '',
        onRefresh: () {
          context.read<YesodBloc>().add(YesodFeedActionSetLoadEvent());
        },
        onAdd: () {
          const YesodActionManageRoute(action: YesodActionManageActions.add)
              .go(context);
          FramePage.of(context)?.openDrawer();
        },
        children: [
          for (var i = 0; i < listData.length; i++)
            ListTile(
              trailing: const Icon(Icons.edit),
              onTap: () {
                YesodFeedManageRoute(action: YesodFeedManageActions.edit, id: i)
                    .go(context);
                FramePage.of(context)?.openDrawer();
              },
              title: Text(listData[i].name.isNotEmpty
                  ? listData[i].name
                  : listData[i].id.id.toHexString()),
              subtitle: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(listData[i].description),
                  Text('包含${listData[i].actions.length}个操作')
                ],
              ),
            ),
        ],
      );
    });
  }
}

class YesodActionManageAddPanel extends StatelessWidget {
  const YesodActionManageAddPanel({super.key});

  void close(BuildContext context) {
    FramePage.of(context)?.closeDrawer();
  }

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    var name = '';
    var description = '';

    return BlocConsumer<YesodBloc, YesodState>(
      listener: (context, state) {
        if (state is YesodFeedActionSetAddState && state.success) {
          const Toast(title: '', message: '添加成功').show(context);
          close(context);
        }
      },
      builder: (context, state) {
        return RightPanelForm(
          formKey: formKey,
          title: Text(S.of(context).feedActionSetAdd),
          formFields: [
            TextFormField(
              onChanged: (newValue) => name = newValue,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                label: Text('名称'),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            TextFormField(
              onChanged: (newValue) => description = newValue,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                label: Text('描述'),
              ),
            ),
          ],
          errorMsg: state is YesodFeedActionSetAddState && state.failed
              ? state.msg
              : null,
          onSubmit: () {
            context
                .read<YesodBloc>()
                .add(YesodFeedActionSetAddEvent(FeedActionSet(
                  name: name,
                  description: description,
                )));
          },
          submitting: state is YesodFeedActionSetAddState && state.processing,
          close: () => close(context),
        );
      },
    );
  }
}

class YesodActionManageEditPanel extends StatelessWidget {
  const YesodActionManageEditPanel({super.key, required this.index});

  final int? index;

  void close(BuildContext context) {
    FramePage.of(context)?.closeDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<YesodBloc, YesodState>(
      listener: (context, state) {
        if (state is YesodFeedActionSetEditState && state.success) {
          const Toast(title: '', message: '已应用更改').show(context);
          close(context);
        }
      },
      builder: (context, state) {
        final actionSet = index != null && state.feedActionSets != null
            ? state.feedActionSets![index!]
            : FeedActionSet();
        var name = actionSet.name;
        var description = actionSet.description;

        return RightPanelForm(
          title: Text(S.of(context).feedConfigEdit),
          formFields: [
            TextFormField(
              initialValue: actionSet.id.id.toString(),
              readOnly: true,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'ID',
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            TextFormField(
              initialValue: name,
              onSaved: (newValue) => name = newValue!,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: '名称',
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            TextFormField(
              initialValue: description,
              onSaved: (newValue) => description = newValue!,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: '描述',
              ),
            ),
          ],
          errorMsg: state is YesodFeedActionSetEditState && state.failed
              ? state.msg
              : null,
          onSubmit: () {
            context
                .read<YesodBloc>()
                .add(YesodFeedActionSetEditEvent(FeedActionSet(
                  id: actionSet.id,
                  name: name,
                  description: description,
                )));
          },
          submitting: state is YesodFeedActionSetEditState && state.processing,
          close: () => close(context),
        );
      },
    );
  }
}
