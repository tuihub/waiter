import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get_it/get_it.dart';
import 'package:smooth_scroll_multiplatform/smooth_scroll_multiplatform.dart';
import 'package:tuihub_protos/librarian/v1/common.pb.dart';

import '../../../repo/local/yesod_repo.dart';
import '../../helper/duration_format.dart';
import '../../helper/spacing.dart';
import '../../layout/bootstrap_container.dart';

class YesodDetailPage extends StatefulWidget {
  const YesodDetailPage({super.key, required this.itemId});

  final InternalID itemId;

  @override
  State<StatefulWidget> createState() => _YesodDetailPageState();
}

class _YesodDetailPageState extends State<YesodDetailPage> {
  bool initialized = false;
  late FeedItem item;

  @override
  void initState() {
    super.initState();
    item = FeedItem();
    unawaited(GetIt.I<YesodRepo>().getFeedItem(widget.itemId).then((value) {
      setState(() {
        item = value;
        initialized = true;
      });
    }));
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          ClipRRect(
            borderRadius: SpacingHelper.defaultBorderRadius,
            child: AppBar(
              title: Text(initialized ? item.title : '加载中...'),
            ),
          ),
          if (initialized)
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
                                    for (final author in item.authors)
                                      Text(author.name),
                                  ],
                                ),
                                Text(
                                    '发布时间：${DurationHelper.recentString(item.publishedParsed.toDateTime())}'),
                                if (item.updatedParsed
                                    .toDateTime()
                                    .isAfter(item.publishedParsed.toDateTime()))
                                  Text(
                                      '更新时间：${DurationHelper.recentString(item.updatedParsed.toDateTime())}'),
                                const SizedBox(
                                  height: 16,
                                ),
                                HtmlWidget(
                                  item.content.isNotEmpty
                                      ? item.content
                                      : item.description,
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
  }
}
