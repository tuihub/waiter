import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:tuihub_protos/librarian/sephirah/v1/yesod.pb.dart';
import 'package:tuihub_protos/librarian/v1/common.pb.dart';

import '../../../bloc/yesod/yesod_bloc.dart';
import '../../../route.dart';
import '../../helper/spacing.dart';

class YesodRecentFilterPage extends StatelessWidget {
  const YesodRecentFilterPage({super.key});

  void close(BuildContext context) {
    AppRoutes.yesodRecentFilter().pop(context);
  }

  @override
  Widget build(BuildContext context) {
    List<InternalID> feedIDFilter = [];

    return BlocBuilder<YesodBloc, YesodState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            title: const Text('筛选规则'),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  MultiSelectDialogField(
                    title: const Text('按订阅筛选'),
                    buttonText: const Text('订阅'),
                    buttonIcon: const Icon(Icons.filter_alt_outlined),
                    items: [
                      for (final ListFeedConfigsResponse_FeedWithConfig config
                          in state.feedConfigs ?? [])
                        MultiSelectItem(
                            config.config.id,
                            config.feed.title.isNotEmpty
                                ? config.feed.title
                                : config.config.feedUrl),
                    ],
                    initialValue:
                        state.feedItemFilter?.feedIdFilter?.toList() ??
                            feedIDFilter,
                    onConfirm: (values) {
                      feedIDFilter = values;
                    },
                    decoration: BoxDecoration(
                      borderRadius: SpacingHelper.defaultBorderRadius,
                    ),
                  ),
                ],
              ),
            ),
          ),
          floatingActionButton: Padding(
            padding: const EdgeInsets.only(left: 32),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    context.read<YesodBloc>().add(
                        YesodFeedItemDigestsSetFilterEvent(
                            YesodFeedItemFilter(feedIdFilter: feedIDFilter)));
                    close(context);
                  },
                  child: const Text('确定'),
                ),
                ElevatedButton(
                  onPressed: () => close(context),
                  child: const Text('取消'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
