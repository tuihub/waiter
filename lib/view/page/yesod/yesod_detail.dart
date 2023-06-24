import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:tuihub_protos/librarian/v1/common.pb.dart';

class YesodDetailPage extends StatelessWidget {
  final FeedItem item;

  const YesodDetailPage({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item.title),
      ),
      body: HtmlWidget(
        item.description,
        renderMode: RenderMode.listView,
      ),
    );
  }
}
