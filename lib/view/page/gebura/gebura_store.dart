import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tuihub_protos/librarian/sephirah/v1/gebura.pb.dart';
import 'package:tuihub_protos/librarian/v1/common.pb.dart';
import 'package:waitress/bloc/api_request/api_request_bloc.dart';
import 'package:waitress/common/base/base_rest_mixins.dart';
import 'package:waitress/view/page/chesed/chesed_image_view.dart';
import 'package:waitress/view/page/gebura/gebura_library_list.dart';

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
    doRequest(
      request: (client, option) {
        return client.searchApps(
          SearchAppsRequest(),
          options: option,
        );
      }
    );
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
    return Expanded(
        child: Card(
          margin: EdgeInsets.zero,
          child: GridView.builder(
            padding: EdgeInsets.all(8),
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 256),
            itemBuilder: (BuildContext context, int index) {
              if (index == data.apps.length) {
                return Ink(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Theme.of(context)
                        .colorScheme
                        .secondaryContainer,
                  ),
                  child: Center(
                    child: Text("没有了"),
                  ),
                );
              }
              final item = data.apps.elementAt(index);
              return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ChesedImageViewWidget(
                              imageUrl: item.imageUrl)),
                    );
                  },
                  child: Ink(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                        image: NetworkImage(
                          item.imageUrl,
                        ),
                        fit: BoxFit.contain,
                      ),
                    ),
                    child: Text(item.name),
                  ));
            },
            itemCount: data.apps.length,
          ),
        ),
      );
  }
}
