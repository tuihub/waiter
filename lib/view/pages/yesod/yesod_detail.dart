import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:tuihub_protos/librarian/v1/common.pb.dart';

class YesodDetailPage extends StatelessWidget {
  final FeedItem item;

  const YesodDetailPage({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
            child: AppBar(
              title: Text(item.title),
            ),
          ),
          Expanded(
            child: HtmlWidget(
              item.description,
              renderMode: RenderMode.listView,
            ),
          ),
        ],
      ),
    );
  }
}
