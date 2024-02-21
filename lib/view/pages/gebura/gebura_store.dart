import 'package:animations/animations.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_scroll_multiplatform/smooth_scroll_multiplatform.dart';
import 'package:tuihub_protos/librarian/v1/common.pb.dart';

import '../../../bloc/gebura/gebura_bloc.dart';
import '../../helper/spacing.dart';
import '../../layout/bootstrap_container.dart';
import 'gebura_store_detail.dart';

class GeburaStorePage extends StatelessWidget {
  const GeburaStorePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();
    List<AppInfoMixed>? apps;
    String msg = '';
    return BlocBuilder<GeburaBloc, GeburaState>(builder: (context, state) {
      if (state is GeburaSearchAppInfosState) {
        apps = state.apps;
        if (controller.text.isEmpty) {
          msg = '输入应用名称进行搜索';
        } else if (state.processing) {
          msg = '加载中';
        } else if (state.failed) {
          msg = '加载失败';
        } else if (state.success) {
          msg = '无结果';
        }
      }
      return Scaffold(
        body: apps != null && apps!.isNotEmpty
            ? StoreList(apps: apps!)
            : Center(child: Text(msg)),
        appBar: AppBar(
          shape: RoundedRectangleBorder(
            borderRadius: SpacingHelper.defaultBorderRadius,
          ),
          title: BootstrapContainer(
            children: [
              BootstrapColumn(
                xxs: 12,
                md: 6,
                child: LayoutBuilder(builder: (context, constrains) {
                  final width = constrains.maxWidth; // 父级宽度
                  const height = 45.0;
                  return Container(
                    width: width,
                    height: height,
                    decoration: BoxDecoration(
                        border:
                            Border.all(color: Theme.of(context).primaryColor),
                        borderRadius: BorderRadius.circular(height)),
                    child: TextField(
                      controller: controller,
                      decoration: InputDecoration(
                          hintText: '搜索',
                          hintStyle: const TextStyle(
                              color: Colors.grey, fontSize: height / 3),
                          contentPadding:
                              const EdgeInsets.only(top: height / 5),
                          border: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          fillColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          icon: Padding(
                              padding: const EdgeInsets.only(left: 10, top: 4),
                              child: Icon(
                                Icons.search,
                                size: 18,
                                color: Theme.of(context).primaryColor,
                              )),
                          suffixIcon: IconButton(
                            icon: const Icon(
                              Icons.close,
                              size: 18,
                            ),
                            onPressed: () {
                              controller.text = '';
                              context.read<GeburaBloc>().add(
                                    GeburaSearchAppInfosEvent(''),
                                  );
                            },
                            splashColor: Theme.of(context).primaryColor,
                            color: Theme.of(context).primaryColor,
                          )),
                      onChanged: (text) {
                        context.read<GeburaBloc>().add(
                              GeburaSearchAppInfosEvent(text),
                            );
                      },
                    ),
                  );
                }),
              )
            ],
          ),
        ),
      );
    });
  }
}

class StoreList extends StatelessWidget {
  const StoreList({
    super.key,
    required this.apps,
  });
  final List<AppInfoMixed> apps;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return DynMouseScroll(builder: (context, controller, physics) {
      return CustomScrollView(
        controller: controller,
        physics: physics,
        slivers: [
          SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: apps.length,
              (context, index) {
                final app = apps.elementAt(index);
                return Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: OpenContainer(
                    openBuilder: (_, closedContainer) {
                      return BlocProvider.value(
                        value: context.read<GeburaBloc>(),
                        child: Container(
                          color: Theme.of(context).scaffoldBackgroundColor,
                          child: GeburaStoreDetail(appID: app.id),
                        ),
                      );
                    },
                    openColor: theme.colorScheme.primary,
                    closedShape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                    closedColor: theme.scaffoldBackgroundColor,
                    closedElevation: 0,
                    closedBuilder: (context, openContainer) {
                      return SizedBox(
                        height: 128,
                        child: Card(
                          child: InkWell(
                            borderRadius: SpacingHelper.defaultBorderRadius,
                            onTap: () {
                              openContainer();
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8),
                              child: Row(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          SpacingHelper.defaultBorderRadius,
                                      image: DecorationImage(
                                          image: ExtendedNetworkImageProvider(
                                            app.coverImageUrl,
                                          ),
                                          fit: BoxFit.scaleDown),
                                    ),
                                    width: 150,
                                    height: 200,
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
                                              overflow: TextOverflow.ellipsis,
                                              fontSize: 10,
                                              color: Theme.of(context)
                                                  .disabledColor),
                                          maxLines: 2,
                                        ),
                                        const SizedBox(
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
                                        const SizedBox(
                                          height: 4,
                                        ),
                                        Text(
                                          app.shortDescription,
                                          style: const TextStyle(
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
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      );
    });
  }
}
