import 'package:fixnum/fixnum.dart' as $fixnum;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tuihub_protos/google/protobuf/duration.pb.dart';
import 'package:tuihub_protos/librarian/sephirah/v1/yesod.pb.dart';
import 'package:tuihub_protos/librarian/v1/common.pb.dart';
import 'package:waitress/bloc/api_request/api_request_bloc.dart';

class YesodConfig extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ApiRequestBloc, ApiRequestState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        if (state is! YesodState) {
          context.read<ApiRequestBloc>().add(
                LoadFeedConfig(
                  ListFeedsRequest(
                    paging: PagingRequest.getDefault(),
                  ),
                ),
              );
        }

        return Scaffold(
          body: Column(children: [
            Row(
              children: [
                FilledButton.tonalIcon(
                  onPressed: () {
                    context.read<ApiRequestBloc>().add(
                          CreateFeedConfig(
                            CreateFeedConfigRequest(
                              config: FeedConfig(
                                feedUrl: " https://rsshub.app/agefans/update",
                                source:
                                    FeedConfigSource.FEED_CONFIG_SOURCE_COMMON,
                                status:
                                    FeedConfigStatus.FEED_CONFIG_STATUS_ACTIVE,
                                pullInterval: Duration(
                                  seconds: $fixnum.Int64(60),
                                ),
                              ),
                            ),
                          ),
                        );
                  },
                  icon: const Icon(Icons.add),
                  label: const Text("添加RSS订阅"),
                ),
                FilledButton.tonalIcon(
                  onPressed: () {
                    context.read<ApiRequestBloc>().add(
                          LoadFeedConfig(
                            ListFeedsRequest(
                              paging: PagingRequest.getDefault(),
                            ),
                          ),
                        );
                  },
                  icon: const Icon(Icons.refresh),
                  label: const Text("刷新"),
                ),
              ],
            ),
            Expanded(
              child: state is YesodLoadDone
                  ? ListView.builder(
                      itemBuilder: (context, index) {
                        if (state.resp is ListFeedsResponse) {
                          final item = (state.resp as ListFeedsResponse)
                              .feedsWithConfig
                              .elementAt(index)
                              .config;
                          return Card(
                            child: Column(
                              children: [
                                Text(item.source.name),
                                Text(item.feedUrl),
                                Text("${item.id}"),
                              ],
                            ),
                          );
                        }
                      },
                      itemCount: state.resp.feedsWithConfig.length,
                    )
                  : const SizedBox(),
            ),
          ]),
        );
      },
    );
  }
}
