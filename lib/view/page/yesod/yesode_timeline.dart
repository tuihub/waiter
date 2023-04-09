import 'dart:math';

import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:random_x/random_x.dart';
import 'package:tuihub_protos/librarian/sephirah/v1/yesod.pb.dart';
import 'package:waitress/bloc/api_request/api_request_bloc.dart';

import '../../widget/extentions/grid_delegated.dart';

class TimeLine extends StatelessWidget {
  const TimeLine({super.key});

  Widget _buildStatePage(ApiRequestState state) {
    if (state is YesodLoading) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    if (state is YesodFailed) {
      return Center(
        child: Text("加载失败: ${state.message}"),
      );
    }
    return SizedBox();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            child: BlocConsumer<ApiRequestBloc, ApiRequestState>(
              listener: (context, state) {},
              builder: (context, state) {
                if (state is YesodLoadDone) {
                  if (state.resp is GroupFeedItemsResponse) {
                    if (state.resp.groups.isEmpty) {
                      return Center(
                        child: Text("空空如也"),
                      );
                    }
                    return FeedItemList(data: state.resp);
                  }
                }
                return _buildStatePage(state);
              },
            ),
          ),
          // SizedBox(
          //   width: 100,
          //   child: TimelineSlider(),
          // ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<ApiRequestBloc>().add(
                PullFeedItem(
                  GroupFeedItemsRequest(
                    groupBy: GroupFeedItemsRequest_GroupBy.GROUP_BY_MONTH,
                    groupSize: 10,
                  ),
                ),
              );
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}

class FeedItemList extends StatelessWidget {
  const FeedItemList({
    super.key,
    required this.data,
  });

  final cardWith = 384.0;
  final cardHeight = 144.0;

  final GroupFeedItemsResponse data;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              final group = data.groups.elementAt(index);
              return Padding(
                padding: EdgeInsets.only(right: 8),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          DateUtil.formatDate(
                              group.timeRange.startTime.toDateTime(),
                              format: DateFormats.zh_y_mo_d),
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                    GridView(
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithMinCrossAxisExtent(
                        mainAxisExtent: cardHeight,
                        minCrossAxisExtent: cardWith,
                      ),
                      children: [
                        for (int i = 0; i < 10 + index; i++)
                          SizedBox(
                            height: cardHeight,
                            width: cardWith,
                            child: Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: Material(
                                borderRadius: BorderRadius.circular(8),
                                child: Ink(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Theme.of(context)
                                        .colorScheme
                                        .surfaceVariant,
                                  ),
                                  child: InkWell(
                                    borderRadius: BorderRadius.circular(8),
                                    onTap: () {},
                                    child: Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Row(children: [
                                        SizedBox(
                                          width: 100,
                                          height: 100,
                                          child: Placeholder(),
                                        ),
                                        SizedBox(
                                          width: 16,
                                        ),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                RndX.randomString(
                                                  type: RandomCharStringType
                                                      .alphaNumerical,
                                                  length:
                                                      (Random().nextInt(30) +
                                                              10)
                                                          .floor(),
                                                ),
                                                style: TextStyle(
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                maxLines: 4,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ]),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              );
            },
            childCount: data.groups.length,
          ),
        ),
      ],
    );
  }
}
