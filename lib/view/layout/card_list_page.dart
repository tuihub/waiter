import 'package:flutter/material.dart';

import '../../l10n/l10n.dart';
import '../helper/app_bar.dart';
import '../universal/card.dart';
import '../universal/universal.dart';

class ListManagePage extends StatefulWidget {
  const ListManagePage({
    super.key,
    this.title = '',
    required this.children,
    required this.processing,
    this.msg,
    this.onRefresh,
    this.onAdd,
    this.onBack,
    this.floatingActionButton,
    this.popupMenuItems,
  });

  final String title;
  final List<Widget> children;
  final bool processing;
  final String? msg;
  final void Function()? onRefresh;
  final void Function()? onAdd;
  final void Function()? onBack;
  final FloatingActionButton? floatingActionButton;
  final List<PopupMenuEntry<String>>? popupMenuItems;

  @override
  State<ListManagePage> createState() => ListManagePageState();
}

class ListManagePageState extends State<ListManagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: UniversalUI.of(context).defaultShape,
        backgroundColor: UniversalUI.of(context).appBarBackgroundColor,
        leading:
            AppBarHelper.defaultMainLeading(context, onPressed: widget.onBack),
        title: Text(widget.title),
        actions: [
          if (widget.onAdd != null)
            IconButton(
              onPressed: widget.onAdd,
              icon: const Icon(Icons.add),
            ),
          PopupMenuButton(
            itemBuilder: (context) {
              return [
                if (widget.onAdd != null)
                  PopupMenuItem(
                    value: 'add',
                    onTap: widget.onAdd,
                    child: Text(S.of(context).add),
                  ),
                if (widget.popupMenuItems != null) ...widget.popupMenuItems!,
                PopupMenuItem(
                  value: 'refresh',
                  onTap: widget.onRefresh,
                  child: Text(S.of(context).refresh),
                ),
              ];
            },
          ),
          // IconButton(
          //   onPressed: widget.onRefresh,
          //   icon: const Icon(Icons.refresh),
          // ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 8, bottom: 8),
        child: Stack(children: [
          if (widget.processing)
            const Center(
              child: CircularProgressIndicator(),
            ),
          if (widget.msg != null && widget.msg!.isNotEmpty)
            Center(
              child: Text(widget.msg!),
            )
          else if (widget.children.isEmpty && widget.onAdd != null)
            Center(
              child: ElevatedButton.icon(
                onPressed: widget.onAdd,
                icon: const Icon(Icons.add),
                label: Text(S.of(context).add),
              ),
            )
          else
            ListView.builder(
              itemCount: widget.children.length,
              itemBuilder: (context, index) {
                return SelectionArea(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 4),
                    child: UniversalCard(
                      child: widget.children.elementAt(index),
                    ),
                  ),
                );
              },
            ),
        ]),
      ),
      floatingActionButton: widget.floatingActionButton,
    );
  }
}
