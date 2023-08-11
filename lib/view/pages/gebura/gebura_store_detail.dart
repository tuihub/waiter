import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:tuihub_protos/librarian/sephirah/v1/gebura.pb.dart';
import 'package:tuihub_protos/librarian/v1/common.pb.dart';
import '../../../bloc/api_request/api_request_bloc.dart';
import '../../../common/api/api_mixins.dart';

class GeburaStoreDetail extends StatefulWidget {
  const GeburaStoreDetail({super.key, required this.appID});

  final InternalID appID;

  @override
  State<StatefulWidget> createState() => _GeburaStoreDetailState();
}

class _GeburaStoreDetailState extends State<GeburaStoreDetail>
    with SingleRequestMixin<GeburaStoreDetail, GetAppResponse> {
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
        child: Text('加载失败: ${response.error}'),
      );
    }
    return const SizedBox();
  }

  void loadAppDetail() {
    unawaited(doRequest(request: (client, option) {
      return client.getApp(
        GetAppRequest(appId: widget.appID),
        options: option,
      );
    }));
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
              title: const Text(''),
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
                        data.app.heroImageUrl,
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
                        const Color.fromRGBO(0, 0, 0, 0),
                        Theme.of(context).colorScheme.surface,
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(8),
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
                )
              ],
            )),
          ),
          SizedBox(
            height: 100,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (_) {
                          return BlocProvider.value(
                            value: context.read<ApiRequestBloc>(),
                            child: PurchaseAppDialog(
                              app: data.app,
                            ),
                          );
                        },
                      );
                    },
                    child: const Text('添加至游戏库'),
                  ),
                  const SizedBox(
                    width: 24,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('开发商：${data.app.details.developer}'),
                      Text('发行商：${data.app.details.publisher}'),
                      Text('发行日期：${data.app.details.releaseDate}'),
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
            padding: const EdgeInsets.all(8),
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
  const PurchaseAppDialog({super.key, required this.app});

  final App app;

  @override
  State<PurchaseAppDialog> createState() => _PurchaseAppDialogState();
}

class _PurchaseAppDialogState extends State<PurchaseAppDialog>
    with SingleRequestMixin<PurchaseAppDialog, PurchaseAppResponse> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ApiRequestBloc, ApiRequestState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return AlertDialog(
          title: const Text('入库'),
          content: SizedBox(
            width: 600,
            child: Text('确定将《${widget.app.name}》加入你的库存？'),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () async {
                await doRequest(
                  request: (client, option) {
                    return client.purchaseApp(
                      PurchaseAppRequest(
                        appId: widget.app.id,
                      ),
                      options: option,
                    );
                  },
                ).then((value) {
                  context
                      .read<ApiRequestBloc>()
                      .add(GeburaLibraryRefreshEvent());
                  Navigator.of(context).pop();
                });
              },
              child: loading
                  ? const CircularProgressIndicator()
                  : const Text('确定'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context); //close Dialog
              },
              child: const Text('关闭'),
            )
          ],
        );
      },
    );
  }
}
