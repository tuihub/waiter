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
    debugPrint("loading:$loading, suc: $isSuccess, err: $isError");
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
    doRequest(
      request: (client, option) {
        return client.getBindApps(
            GetBindAppsRequest(appId: InternalID(id: $fixnum.Int64(appID))),
          options: option,
        );
      }
    );
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
    return Center(
      child: Text(data.toString()),
    );
  }
}