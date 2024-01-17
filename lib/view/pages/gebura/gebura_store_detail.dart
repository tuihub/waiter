import 'dart:async';

import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:smooth_scroll_multiplatform/smooth_scroll_multiplatform.dart';
import 'package:tuihub_protos/librarian/v1/common.pb.dart';

import '../../../bloc/gebura/gebura_bloc.dart';
import '../../components/toast.dart';
import '../../helper/spacing.dart';
import '../../layout/bootstrap_container.dart';

class GeburaStoreDetail extends StatelessWidget {
  const GeburaStoreDetail({super.key, required this.appID});

  final InternalID appID;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GeburaBloc, GeburaState>(builder: (context, state) {
      final app = state.storeApps != null ? state.storeApps![appID] : null;
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
                ? const Center(child: Text('未选择应用'))
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
                                      borderRadius:
                                          SpacingHelper.defaultBorderRadius,
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
                                  if (state.purchasedApps?.contains(app) ??
                                      false)
                                    const ElevatedButton(
                                      onPressed: null,
                                      child: Text('已在库中'),
                                    )
                                  else
                                    ElevatedButton(
                                      onPressed: () {
                                        unawaited(showDialog<void>(
                                          context: context,
                                          builder: (_) {
                                            return BlocProvider.value(
                                              value: context.read<GeburaBloc>(),
                                              child: PurchaseAppDialog(
                                                app: app,
                                              ),
                                            );
                                          },
                                        ));
                                      },
                                      child: const Text('添加至游戏库'),
                                    ),
                                  const SizedBox(
                                    width: 24,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('开发商：${app.details.developer}'),
                                      Text('发行商：${app.details.publisher}'),
                                      Text('发行日期：${app.details.releaseDate}'),
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
                                    app.details.description,
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

  final AppMixed app;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GeburaBloc, GeburaState>(
      listener: (context, state) {
        if (state is GeburaPurchaseState) {
          if (state.success) {
            const Toast(title: '', message: '添加成功').show(context);
            Navigator.of(context).pop();
          }
        }
      },
      builder: (context, state) {
        return AlertDialog(
          title: const Text('入库'),
          content: SizedBox(
            width: 600,
            child: Text('确定将${app.name}加入你的库存？'),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                context.read<GeburaBloc>().add(GeburaPurchaseEvent(app.id));
              },
              child: state is GeburaPurchaseState && state.processing
                  ? const CircularProgressIndicator()
                  : const Text('确定'),
            ),
            TextButton(
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
