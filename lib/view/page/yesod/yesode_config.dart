import 'package:fixnum/fixnum.dart' as $fixnum;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tuihub_protos/google/protobuf/duration.pb.dart';
import 'package:tuihub_protos/librarian/sephirah/v1/yesod.pb.dart';
import 'package:tuihub_protos/librarian/v1/common.pb.dart';
import 'package:waitress/bloc/api_request/api_request_bloc.dart';

class YesodConfigPage extends StatefulWidget {
  const YesodConfigPage({super.key});

  @override
  State<YesodConfigPage> createState() => _YesodConfigPageState();
}

class _YesodConfigPageState extends State<YesodConfigPage> {
  int page = 0;
  int totalPage = 0;

  void _loadConfig(BuildContext context, {bool refresh = false}) {
    if (refresh) {
      page = 0;
    }
    context.read<ApiRequestBloc>().add(
          LoadFeedConfig(
            ListFeedConfigsRequest(
              paging: PagingRequest(
                pageNum: page,
              ),
            ),
          ),
        );
  }

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
    return BlocConsumer<ApiRequestBloc, ApiRequestState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is! YesodState) {
          _loadConfig(context);
        }

        return Scaffold(
          body: Column(children: [
            Row(
              children: [
                SizedBox(width: 8),
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
                SizedBox(width: 8),
              ],
            ),
            SizedBox(height: 8),
            Expanded(
              child: state is YesodLoadDone
                  ? ListView.builder(
                      padding: EdgeInsets.only(right: 8),
                      itemBuilder: (context, index) {
                        if (state.resp is ListFeedConfigsResponse) {
                          final item = (state.resp as ListFeedConfigsResponse)
                              .feedsWithConfig
                              .elementAt(index)
                              .config;
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Ink(
                              decoration: BoxDecoration(
                                color: Theme.of(context)
                                    .colorScheme
                                    .surfaceVariant,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(8),
                                    child: Image.network(
                                      "https://docs.rsshub.app/logo.png",
                                      width: 64,
                                      height: 64,
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      Text(item.feedUrl),
                                    ],
                                  ),
                                  Expanded(child: SizedBox()),
                                  Padding(
                                    padding: EdgeInsets.all(8),
                                    child: SizedBox(
                                      width: 64,
                                      height: 64,
                                      child: IconButton(
                                        onPressed: () {},
                                        icon: Icon(Icons.edit),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }
                      },
                      itemCount: state.resp is ListFeedConfigsResponse
                          ? state.resp.feedsWithConfig.length
                          : 0,
                    )
                  : _buildStatePage(state),
            ),
            SizedBox(
              height: 8,
            ),
          ]),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              _loadConfig(context);
            },
            child: const Icon(Icons.refresh),
          ),
        );
      },
    );
  }
}
