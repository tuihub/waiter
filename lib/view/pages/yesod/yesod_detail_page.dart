import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:smooth_scroll_multiplatform/smooth_scroll_multiplatform.dart';
import 'package:tuihub_protos/librarian/v1/common.pb.dart';
import 'package:universal_ui/universal_ui.dart';

import '../../../bloc/yesod/yesod_bloc.dart';
import '../../helper/duration_format.dart';
import '../../layout/bootstrap_container.dart';

class YesodDetailPage extends StatefulWidget {
  const YesodDetailPage({super.key, required this.itemId});

  final InternalID itemId;

  @override
  State<YesodDetailPage> createState() => YesodDetailPageState();
}

class YesodDetailPageState extends State<YesodDetailPage> {
  @override
  void initState() {
    super.initState();
    unawaited(
      context.read<YesodBloc>().getFeedItem(widget.itemId).then((value) {
        setState(() {
          item = value;
        });
      }),
    );
  }

  FeedItem? item;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<YesodBloc, YesodState>(listener: (context, state) {
      if (state is YesodFeedItemLoadState && state.success) {
        setState(() {
          item = state.feedItem;
        });
      }
    }, builder: (context, state) {
      return DecoratedBox(
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            ClipRRect(
              borderRadius: UniversalUI.of(context).defaultBorderRadius,
              child: AppBar(
                title: Text(item != null ? item!.title : '加载中...'),
              ),
            ),
            if (item != null)
              Expanded(
                child: DynMouseScroll(
                  builder: (context, controller, physics) {
                    return SingleChildScrollView(
                      controller: controller,
                      physics: physics,
                      child: BootstrapContainer(
                        children: [
                          BootstrapColumn(
                            xxs: 12,
                            sm: 10,
                            md: 8,
                            child: Container(
                              padding: const EdgeInsets.all(16),
                              alignment: Alignment.topCenter,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  Row(
                                    children: [
                                      const Text('作者：'),
                                      for (final author in item!.authors)
                                        Text(author.name),
                                    ],
                                  ),
                                  Text(
                                      '发布时间：${DurationHelper.recentString(item!.publishedParsed.toDateTime())}'),
                                  if (item!.updatedParsed.toDateTime().isAfter(
                                      item!.publishedParsed.toDateTime()))
                                    Text(
                                        '更新时间：${DurationHelper.recentString(item!.updatedParsed.toDateTime())}'),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  HtmlWidget(
                                    item!.content.isNotEmpty
                                        ? item!.content
                                        : item!.description,
                                    renderMode: RenderMode.column,
                                    enableCaching: true,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              )
            else
              const Center(
                child: CircularProgressIndicator(),
              ),
          ],
        ),
      );
    });
  }
}
