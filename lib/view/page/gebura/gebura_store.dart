import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:tuihub_protos/librarian/sephirah/v1/gebura.pb.dart';
import 'package:waitress/common/base/base_rest_mixins.dart';
import 'package:waitress/view/page/gebura/gebura_store_detail.dart';

class GeburaStorePage extends StatefulWidget {
  const GeburaStorePage({super.key});

  @override
  State<GeburaStorePage> createState() => _GeburaStorePageState();
}

class _GeburaStorePageState extends State<GeburaStorePage>
    with SingleRequestMixin<GeburaStorePage, SearchAppsResponse> {
  @override
  void initState() {
    super.initState();
    loadStore();
  }

  Widget _buildStatePage() {
    if (loading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    if (isSuccess) {
      print(response.getData().apps.length);
      return response.getData().apps.isEmpty
          ? const Center(
              child: Text("空空如也"),
            )
          : StoreList(data: response.getData());
    }
    if (isError) {
      return Center(
        child: Text("加载失败: ${response.error}"),
      );
    }
    return const SizedBox();
  }

  void loadStore() {
    doRequest(request: (client, option) {
      return client.searchApps(
        SearchAppsRequest(),
        options: option,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return _buildStatePage();
  }
}

class StoreList extends StatelessWidget {
  const StoreList({
    super.key,
    required this.data,
  });
  final SearchAppsResponse data;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        Expanded(
          child: CustomScrollView(
            slivers: [
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final app = data.apps.elementAt(index);
                    return OpenContainer(
                      openBuilder: (context, closedContainer) {
                        return Container(
                          color: Theme.of(context).scaffoldBackgroundColor,
                          child: GeburaStoreDetail(appID: app.id),
                        );
                      },
                      openColor: theme.colorScheme.primary,
                      closedShape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                      closedElevation: 0,
                      closedColor: theme.cardColor,
                      closedBuilder: (context, openContainer) {
                        return SizedBox(
                          width: 384,
                          height: 128,
                          child: Material(
                            borderRadius: BorderRadius.circular(8),
                            child: Ink(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: InkWell(
                                borderRadius: BorderRadius.circular(8),
                                onTap: () {
                                  openContainer();
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Row(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                app.iconImageUrl,
                                              ),
                                              fit: BoxFit.cover),
                                        ),
                                        width: 100,
                                        height: 100,
                                      ),
                                      const SizedBox(
                                        width: 16,
                                      ),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              app.id.id.toHexString(),
                                              style: TextStyle(
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  fontSize: 10,
                                                  color: Theme.of(context)
                                                      .disabledColor),
                                              maxLines: 2,
                                            ),
                                            SizedBox(
                                              height: 4,
                                            ),
                                            Text(
                                              app.name,
                                              style: const TextStyle(
                                                overflow: TextOverflow.ellipsis,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                              maxLines: 2,
                                            ),
                                            SizedBox(
                                              height: 4,
                                            ),
                                            Text(
                                              app.shortDescription,
                                              style: TextStyle(
                                                overflow: TextOverflow.ellipsis,
                                                fontSize: 10,
                                              ),
                                              maxLines: 3,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                  childCount: data.apps.length,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
