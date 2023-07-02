import 'package:flutter/material.dart';
import 'package:tuihub_protos/librarian/v1/common.pb.dart';
import 'package:waitress/common/base/base_rest_mixins.dart';
import 'package:tuihub_protos/librarian/sephirah/v1/gebura.pb.dart';

import 'package:fixnum/fixnum.dart' as $fixnum;

class GeburaDetailPage extends StatefulWidget {
  const GeburaDetailPage({super.key, required this.appID});

  final int appID;

  @override
  State<StatefulWidget> createState() => _GeburaDetailPageState(appID: appID);
}

class _GeburaDetailPageState extends State<GeburaDetailPage>
    with SingleRequestMixin<GeburaDetailPage, GetBindAppsResponse> {
  _GeburaDetailPageState({required this.appID});

  final int appID;

  @override
  void initState() {
    super.initState();
    loadAppDetail();
  }

  Widget _buildStatePage() {
    if (loading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    if (isSuccess) {
      return AppDetails(data: response.getData());
    }
    if (isError) {
      return Center(
        child: Text("加载失败: ${response.error}"),
      );
    }
    return const SizedBox();
  }

  void loadAppDetail() {
    doRequest(request: (client, option) {
      return client.getBindApps(
        GetBindAppsRequest(appId: InternalID(id: $fixnum.Int64(appID))),
        options: option,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: _buildStatePage(),
      floatingActionButton: FloatingActionButton(
        onPressed: loadAppDetail,
        child: const Icon(Icons.refresh),
      ),
    );
  }
}

class AppDetails extends StatelessWidget {
  const AppDetails({
    super.key,
    required this.data,
  });

  final GetBindAppsResponse data;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: SizedBox(
            height: 400,
            child: Center(
                child: Stack(
              fit: StackFit.expand,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                      image: NetworkImage(
                        "https://cdn.akamai.steamstatic.com/steam/apps/1448440/capsule_616x353.jpg?t=1677225626",
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  // margin: EdgeInsets.all(32),
                  height: 400,
                ),
                DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: FractionalOffset.center,
                      end: FractionalOffset.bottomCenter,
                      colors: [
                        Color.fromRGBO(0, 0, 0, 0),
                        Theme.of(context).colorScheme.surface,
                      ],
                    ),
                  ),
                ),
                Container(
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: Text(
                        data.apps[0].name,
                        style: TextStyle(
                          fontSize: 52,
                          fontWeight: FontWeight.bold,
                          shadows: [
                            Shadow(
                                color: Theme.of(context).colorScheme.surface,
                                blurRadius: 3)
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            )),
          ),
        ),
        SliverToBoxAdapter(
          child: Center(
            child: Text(data.toString()),
          ),
        )
      ],
    );
  }
}
