import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get_it/get_it.dart';
import 'package:smooth_scroll_multiplatform/smooth_scroll_multiplatform.dart';
import 'package:tuihub_protos/librarian/v1/common.pb.dart';

import '../../../repo/yesod/yesod_repo.dart';
import '../../helper/spacing.dart';

class YesodDetailPage extends StatefulWidget {
  const YesodDetailPage({super.key, required this.itemId});

  final InternalID itemId;

  @override
  State<StatefulWidget> createState() => _YesodDetailPageState();
}

class _YesodDetailPageState extends State<YesodDetailPage> {
  @override
  void initState() {
    super.initState();
    item = FeedItem();
    unawaited(GetIt.I<YesodRepo>()
        .getFeedItem(widget.itemId)
        .then((value) => item = value));
  }

  late FeedItem item;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: SpacingHelper.defaultBorderRadius,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          ClipRRect(
            borderRadius: SpacingHelper.defaultBorderRadius,
            child: AppBar(
              title: Text(item.title),
            ),
          ),
          Expanded(
            child: DynMouseScroll(
              builder: (context, controller, physics) {
                return SingleChildScrollView(
                  controller: controller,
                  physics: physics,
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    alignment: Alignment.topCenter,
                    constraints: const BoxConstraints(
                      maxWidth: 720,
                    ),
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
                        Text('发布日期：${item.publishedParsed.toDateTime()}'),
                        if (!item.updatedParsed.toDateTime().isUtc)
                          Text('更新日期：${item.updatedParsed.toDateTime()}'),
                        const SizedBox(
                          height: 16,
                        ),
                        HtmlWidget(
                          item.description,
                          renderMode: RenderMode.column,
                          enableCaching: true,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
