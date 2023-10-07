import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:open_file/open_file.dart';
import 'package:tuihub_protos/librarian/sephirah/v1/gebura.pb.dart';
import 'package:tuihub_protos/librarian/v1/common.pb.dart';

import '../../../common/api/api_mixins.dart';
import '../../../common/util/platform.dart';
import '../../../repo/gebura/gebura_repo.dart';
import '../../components/toast.dart';
import '../../helper/spacing.dart';
import 'gebura_app_launcher_setting_dialog.dart';

class GeburaLibraryDetailPage extends StatefulWidget {
  const GeburaLibraryDetailPage({super.key, required this.appID});

  final int appID;

  @override
  State<StatefulWidget> createState() => _GeburaLibraryDetailPageState();
}

class _GeburaLibraryDetailPageState extends State<GeburaLibraryDetailPage>
    with SingleRequestMixin<GeburaLibraryDetailPage, GetAppResponse> {
  @override
  void initState() {
    super.initState();
    loadAppDetail();
  }

  @override
  void didUpdateWidget(covariant GeburaLibraryDetailPage oldWidget) {
    super.didUpdateWidget(oldWidget);
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
        GetAppRequest(appId: InternalID(id: $fixnum.Int64(widget.appID))),
        options: option,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: _buildStatePage(),
      // floatingActionButton: PlatformHelper.isWindowsApp()
      //     ? FloatingActionButton(
      //         onPressed: () {
      //           unawaited(showDialog<void>(
      //             context: context,
      //             builder: (context) => GeburaAppLauncherSettingDialog(
      //               appID: widget.appID,
      //             ),
      //           ));
      //         },
      //         child: const Icon(Icons.settings),
      //       )
      //     : const SizedBox(),
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
                    borderRadius: SpacingHelper.defaultBorderRadius,
                    image: DecorationImage(
                      image: CachedNetworkImageProvider(
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
                  if (PlatformHelper.isWindowsApp())
                    ElevatedButton(
                      onPressed: () async {
                        final setting = await GetIt.I<GeburaRepo>()
                            .getLauncherSetting(data.app.id.id.toInt());
                        if (setting == null || setting.path.isEmpty) {
                          if (context.mounted) {
                            const Toast(title: '', message: '未设置应用路径，请完成设置')
                                .show(context);
                          }
                        } else {
                          await OpenFile.open(setting.path);
                        }
                      },
                      child: const Text('启动游戏'),
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
                  const Expanded(child: SizedBox()),
                  if (PlatformHelper.isWindowsApp())
                    ElevatedButton(
                      onPressed: () {
                        unawaited(showDialog<void>(
                          context: context,
                          builder: (context) => GeburaAppLauncherSettingDialog(
                            appID: data.app.id.id.toInt(),
                          ),
                        ));
                      },
                      child: const Icon(Icons.settings),
                    )
                ],
              ),
            ),
          ),
          SpacingHelper.defaultDivider,
          // Padding(
          //   padding: const EdgeInsets.all(8),
          //   child: Text(data.app.shortDescription),
          // ),
        ],
      ),
    );
  }
}
