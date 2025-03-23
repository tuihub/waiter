import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:smooth_scroll_multiplatform/smooth_scroll_multiplatform.dart';
import 'package:tuihub_protos/librarian/sephirah/v1/sephirah/gebura.pb.dart';
import 'package:tuihub_protos/librarian/v1/wellknown.pb.dart';
import 'package:universal_ui/universal_ui.dart';

import '../../../bloc/gebura/gebura_bloc.dart';

import '../../layout/bootstrap_container.dart';

class GeburaStoreDetail extends StatelessWidget {
  const GeburaStoreDetail({super.key, required this.appID});

  final InternalID appID;

  @override
  Widget build(BuildContext context) {
    String msg = '未选择应用';
    return BlocConsumer<GeburaBloc, GeburaState>(listener: (context, state) {
      if (state is GeburaFetchBoundAppsState) {
        msg = state.msg ?? msg;
      }
    }, builder: (context, state) {
      // final apps =
      //     state.appInfoMap != null ? state.appInfoMap![appID.id] : null;
      // final app = apps != null ? mixAppInfo(apps) : null;
      const AppInfo? app = null;
      return Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
            child: AppBar(
              title: const Text(''),
            ),
          ),
          Expanded(
            child: app == null
                ? Center(child: Text(msg))
                : DynMouseScroll(builder: (context, controller, physics) {
                    return SingleChildScrollView(
                      controller: controller,
                      physics: physics,
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
                                      borderRadius: UniversalUI.of(context)
                                          .defaultBorderRadius,
                                      image: DecorationImage(
                                        image: ExtendedNetworkImageProvider(
                                          app.backgroundImageUrl,
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
                                        app.name,
                                        style: TextStyle(
                                          fontSize: 52,
                                          fontWeight: FontWeight.bold,
                                          shadows: [
                                            Shadow(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .surface,
                                                blurRadius: 3)
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 100,
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: Row(
                                children: [
                                  // if (state.purchasedAppInfos?.contains(app) ??
                                  //     false)
                                  //   const UniversalElevatedButton(
                                  //     onPressed: null,
                                  //     child: Text('已在库中'),
                                  //   )
                                  // else
                                  //   UniversalElevatedButton(
                                  //     onPressed: () {
                                  //       unawaited(showDialog<void>(
                                  //         context: context,
                                  //         builder: (_) {
                                  //           return BlocProvider.value(
                                  //             value: context.read<GeburaBloc>(),
                                  //             child: PurchaseAppDialog(
                                  //               app: app,
                                  //             ),
                                  //           );
                                  //         },
                                  //       ));
                                  //     },
                                  //     child: const Text('添加至游戏库'),
                                  //   ),
                                  const SizedBox(
                                    width: 24,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('开发商：${app.developer}'),
                                      Text('发行商：${app.publisher}'),
                                      // Text('发行日期：${app.releaseDate}'),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SpacingHelper.defaultDivider,
                          BootstrapContainer(
                            children: [
                              BootstrapColumn(
                                xxs: 12,
                                sm: 10,
                                md: 8,
                                child: Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: HtmlWidget(
                                    app.description,
                                    buildAsync: false,
                                    renderMode: RenderMode.column,
                                    onErrorBuilder: (context, element, error) =>
                                        Text('$element error: $error'),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  }),
          )
        ]),
      );
    });
  }
}

class PurchaseAppDialog extends StatelessWidget {
  const PurchaseAppDialog({super.key, required this.app});

  final AppInfo app;

  @override
  Widget build(BuildContext context) {
    String msg = '';
    return BlocConsumer<GeburaBloc, GeburaState>(
      listener: (context, state) {
        if (state is GeburaPurchaseState) {
          if (state.success) {
            UniversalToast.show(context, message: '添加成功');
            Navigator.of(context).pop();
          } else {
            msg = state.msg ?? msg;
          }
        }
      },
      builder: (context, state) {
        return UniversalDialog(
          title: const Text('入库'),
          content: SizedBox(
            width: 600,
            child: Text(
                '确定将${app.name}加入你的库存？${msg.isNotEmpty ? '\n错误：$msg' : ''}'),
          ),
          actions: [
            UniversalDialogAction(
              // onPressed: () {
              //   context
              //       .read<GeburaBloc>()
              //       .add(GeburaPurchaseEvent(null, app.id));
              // },
              isPrimary: true,
              child: state is GeburaPurchaseState && state.processing
                  ? const CircularProgressIndicator()
                  : const Text('确定'),
            ),
            UniversalDialogAction(
              onPressed: () {
                Navigator.pop(context); //close Dialog
              },
              child: const Text('取消'),
            )
          ],
        );
      },
    );
  }
}
