import 'package:flutter/material.dart';

import 'package:tuihub_protos/librarian/sephirah/v1/yesod.pb.dart';
import 'package:tuihub_protos/librarian/v1/common.pb.dart';
import 'package:waitress/common/base/base_rest_mixins.dart';

import 'yesod_add/yesod_add.dart';

class YesodConfigPage extends StatefulWidget {
  const YesodConfigPage({super.key});

  @override
  State<YesodConfigPage> createState() => _YesodConfigPageState();
}

class _YesodConfigPageState extends State<YesodConfigPage>
    with SingleRequestMixin<YesodConfigPage, ListFeedConfigsResponse> {
  int page = 0;
  int totalPage = 0;

  late ListFeedConfigsResponse data;

  @override
  void initState() {
    super.initState();
    _loadConfig();
  }

  @override
  Future<ListFeedConfigsResponse> request(client, option) async {
    return await client.listFeedConfigs(
      ListFeedConfigsRequest(
        paging: PagingRequest(
          pageNum: page,
        ),
      ),
      options: option,
    );
  }

  void _loadConfig({bool refresh = false}) {
    if (refresh) {
      page = 0;
    }
    doRequest();
  }

  Widget _buildStatePage() {
    if (loading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    if (isSuccess) {
      final listData = response.getData().feedsWithConfig;
      final bgColor = Theme.of(context).colorScheme.surfaceVariant;
      return ListView.builder(
        padding: const EdgeInsets.only(right: 8),
        itemBuilder: (context, index) {
          final item = listData.elementAt(index).config;
          return SelectionArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Ink(
                decoration: BoxDecoration(
                  color: bgColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8),
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
                    const Expanded(child: SizedBox()),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: SizedBox(
                        width: 64,
                        height: 64,
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.edit),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        itemCount: listData.length,
      );
    }
    if (isError) {
      return Center(
        child: Text("加载失败: ${response.error}"),
      );
    }
    return const SizedBox();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Column(
          children: [
            Row(
              children: [
                const SizedBox(width: 8),
                FilledButton.tonalIcon(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return const YesodeAdd();
                      },
                    ).then((value) {
                      if (value == null || value == false) {
                        return;
                      }
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: const Text('添加成功'),
                          action: SnackBarAction(
                              label: "关闭",
                              onPressed: () {
                                ScaffoldMessenger.of(context)
                                    .hideCurrentSnackBar();
                              }),
                        ),
                      );
                      _loadConfig(refresh: true);
                    });
                  },
                  icon: const Icon(Icons.add),
                  label: const Text("添加RSS订阅"),
                ),
                const SizedBox(width: 8),
              ],
            ),
            Expanded(
              child: _buildStatePage(),
            ),
            const SizedBox(
              height: 8,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _loadConfig();
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
