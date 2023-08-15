import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:tuihub_protos/librarian/v1/common.pb.dart';

class YesodDetailPage extends StatelessWidget {
  const YesodDetailPage(
      {super.key, required this.item, required this.controller});

  final FeedItem item;
  final ScrollController controller;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            child: AppBar(
              title: Text(item.title),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              controller: controller,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: [
                      const Text('作者：'),
                      for (final author in item.authors) Text(author.name),
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
          ),
        ],
      ),
    );
  }
}
