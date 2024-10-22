import 'package:flutter/material.dart';

import '../../l10n/l10n.dart';
import '../helper/app_bar.dart';
import '../universal/button.dart';
import '../universal/card.dart';
import '../universal/tool_bar.dart';
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
  final List<UniversalToolBarItem>? popupMenuItems;

  @override
  State<ListManagePage> createState() => ListManagePageState();
}

class ListManagePageState extends State<ListManagePage> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final width = constraints.maxWidth;

      return Scaffold(
        appBar: AppBar(
          shape: UniversalUI.of(context).defaultShape,
          backgroundColor: UniversalUI.of(context).appBarBackgroundColor,
          leading: AppBarHelper.defaultMainLeading(context,
              onPressed: widget.onBack),
          title: Text(widget.title),
          actions: [
            Container(
              width: width / 2,
              padding: const EdgeInsets.only(right: 8),
              child: UniversalToolBar(
                mainAxisAlignment: MainAxisAlignment.end,
                primaryItems: [
                  if (widget.onAdd != null)
                    UniversalToolBarItem(
                      icon: Icons.add,
                      onPressed: widget.onAdd,
                      label: Text(S.of(context).add),
                    ),
                ],
                secondaryItems: [
                  if (widget.onAdd != null)
                    UniversalToolBarItem(
                      icon: Icons.add,
                      onPressed: widget.onAdd,
                      label: Text(S.of(context).add),
                    ),
                  if (widget.popupMenuItems != null) ...widget.popupMenuItems!,
                  UniversalToolBarItem(
                    icon: Icons.refresh,
                    onPressed: widget.onRefresh,
                    label: Text(S.of(context).refresh),
                  ),
                ],
              ),
            ),
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
                child: UniversalElevatedButton.icon(
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
    });
  }
}
