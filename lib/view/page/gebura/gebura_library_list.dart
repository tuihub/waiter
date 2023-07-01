import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tuihub_protos/librarian/sephirah/v1/gebura.pb.dart';
import 'package:waitress/common/base/base_rest_mixins.dart';
import 'package:waitress/view/widget/rail_tile.dart';

class GeburaLibraryListPage extends StatefulWidget {
  const GeburaLibraryListPage({super.key});
  
  @override
  State<GeburaLibraryListPage> createState() => _GeburaLibraryListPageState();
}

class _GeburaLibraryListPageState extends State<GeburaLibraryListPage>
  with SingleRequestMixin<GeburaLibraryListPage, GetPurchasedAppsResponse> {
  @override
  void initState() {
    super.initState();
    loadLibrary();
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
          : LibraryList(data: response.getData());
    }
    if (isError) {
      return Center(
        child: Text("加载失败: ${response.error}"),
      );
    }
    return const SizedBox();
  }

  void loadLibrary() {
    doRequest(
      request: (client, option) {
        return client.getPurchasedApps(
          GetPurchasedAppsRequest(),
          options: option,
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildStatePage();
    // return Scaffold(
    //   backgroundColor: Colors.transparent,
    //   body: _buildStatePage(),
    //   floatingActionButton: FloatingActionButton(
    //     onPressed: loadLibrary,
    //     child: const Icon(Icons.refresh),
    //   ),
    // );
  }
}

class LibraryList extends StatelessWidget {
  const LibraryList({
    super.key,
    required this.data,
  });

  final GetPurchasedAppsResponse data;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (final app in data.apps)
          RailTile(
            onTap: () {
              GoRouter.of(context).go("/app/Gebura/${app.id.id}");
            },
            title: Text(app.name),
          ),
      ],
    );
  }
}