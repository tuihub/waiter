import 'package:flutter/material.dart';

import '../../l10n/l10n.dart';
import '../specialized/app_bar.dart';

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
  });

  final String title;
  final List<Widget> children;
  final bool processing;
  final String? msg;
  final void Function()? onRefresh;
  final void Function()? onAdd;
  final void Function()? onBack;
  final FloatingActionButton? floatingActionButton;

  @override
  State<ListManagePage> createState() => ListManagePageState();
}

class ListManagePageState extends State<ListManagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        shape: AppBarHelper.defaultShape,
        leading:
            AppBarHelper.defaultMainLeading(context, onPressed: widget.onBack),
        title: Text(widget.title),
        actions: [
          OutlinedButton.icon(
            onPressed: widget.onAdd,
            icon: const Icon(Icons.add),
            label: Text(S.of(context).add),
          ),
          PopupMenuButton(
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  value: 'add',
                  onTap: widget.onAdd,
                  child: Text(S.of(context).add),
                ),
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
          else if (widget.children.isEmpty)
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
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Ink(
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.surface,
                        borderRadius: BorderRadius.circular(12),
                      ),
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
