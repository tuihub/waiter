import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:tuihub_protos/librarian/sephirah/v1/gebura.pb.dart';
import 'package:tuihub_protos/librarian/v1/common.pb.dart';
import 'package:waitress/common/base/base_rest_mixins.dart';

class GeburaStoreDetail extends StatefulWidget {
  const GeburaStoreDetail({super.key, required this.appID});

  final InternalID appID;

  @override
  State<StatefulWidget> createState() => _GeburaStoreDetailState(appID: appID);
}

class _GeburaStoreDetailState extends State<GeburaStoreDetail>
    with SingleRequestMixin<GeburaStoreDetail, GetAppResponse> {
  _GeburaStoreDetailState({required this.appID});

  final InternalID appID;

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
      return client.getApp(
        GetAppRequest(appId: appID),
        options: option,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
            child: AppBar(
              title: Text(""),
            ),
          ),
          Expanded(
            child: _buildStatePage(),
          )
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: loadAppDetail,
      //   child: const Icon(Icons.add),
      // ),
    );
  }
}

class AppDetails extends StatelessWidget {
  const AppDetails({
    super.key,
    required this.data,
  });

  final GetAppResponse data;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
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
                        data.app.details.heroImageUrl,
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
                        data.app.name,
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
          SizedBox(
            height: 100,
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => PurchaseAppDialog(
                          callback: (){}, app: data.app,
                        ),
                      );
                    },
                    child: Text("添加至游戏库"),
                  ),
                  SizedBox(
                    width: 24,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("开发商：${data.app.details.developer}"),
                      Text("发行商：${data.app.details.publisher}"),
                      Text("发行日期：${data.app.details.releaseDate}"),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Divider(
            height: 10,
            indent: 20,
            endIndent: 20,
            thickness: 2,
            color: Theme.of(context).brightness == Brightness.dark
                ? Theme.of(context).colorScheme.outline
                : Theme.of(context).colorScheme.outlineVariant,
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: HtmlWidget(
              data.app.details.description,
              buildAsync: false,
              renderMode: RenderMode.column,
              onErrorBuilder: (context, element, error) =>
                  Text('$element error: $error'),
            ),
          ),
        ],
      ),
    );
  }
}

class PurchaseAppDialog extends StatefulWidget {
  const PurchaseAppDialog({super.key, required this.callback, required this.app});

  final void Function() callback;
  final App app;

  @override
  State<PurchaseAppDialog> createState() => _PurchaseAppDialogState(app: app);
}

class _PurchaseAppDialogState extends State<PurchaseAppDialog>
    with SingleRequestMixin<PurchaseAppDialog, PurchaseAppResponse> {
  _PurchaseAppDialogState({required this.app});

  void purchase() {
    doRequest(
      request: (client, option) {
        return client.purchaseApp(
          PurchaseAppRequest(
              appId: app.id,
          ),
          options: option,
        );
      },
    ).then((value) {
      widget.callback();
      Navigator.of(context).pop();
    });
  }

  final App app;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('入库'),
      content: SizedBox(
        width: 600,
        child: Text("确定将《${app.name}》加入你的库存？"),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: purchase,
          child: loading ? const CircularProgressIndicator() : const Text('确定'),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context); //close Dialog
          },
          child: const Text('关闭'),
        )
      ],
    );
  }
}