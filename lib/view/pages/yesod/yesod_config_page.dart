import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tuihub_protos/librarian/sephirah/v1/yesod.pb.dart';

import '../../../bloc/yesod/yesod_bloc.dart';
import '../../../l10n/l10n.dart';
import '../../../repo/grpc/l10n.dart';
import '../../../route.dart';
import '../../helper/duration_format.dart';
import '../../layout/card_list_page.dart';
import '../frame_page.dart';

class YesodConfigPage extends StatelessWidget {
  const YesodConfigPage({super.key});

  @override
  Widget build(BuildContext context) {
    var firstBuild = true;
    return BlocBuilder<YesodBloc, YesodState>(builder: (context, state) {
      if (firstBuild) {
        firstBuild = false;
        context.read<YesodBloc>().add(YesodInitEvent());
      }
      final listData = state.feedConfigs ?? [];
      return ListManagePage(
        title: S.of(context).feedConfigManage,
        processing: state is YesodConfigLoadState && state.processing,
        msg: state is YesodConfigLoadState ? state.msg : '',
        onRefresh: () {
          context.read<YesodBloc>().add(YesodConfigLoadEvent());
        },
        onAdd: () {
          const YesodConfigRoute(action: YesodConfigActions.add).go(context);
          FramePage.of(context)?.openDrawer();
        },
        children: [
          for (var i = 0; i < listData.length; i++)
            ListTile(
              leading: listData[i].feed.image.url.isNotEmpty
                  ? CircleAvatar(
                      backgroundImage: ExtendedNetworkImageProvider(
                        listData[i].feed.image.url,
                      ),
                    )
                  : null,
              trailing: const Icon(Icons.edit),
              onTap: () {
                YesodConfigRoute(action: YesodConfigActions.edit, id: i)
                    .go(context);
                FramePage.of(context)?.openDrawer();
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
