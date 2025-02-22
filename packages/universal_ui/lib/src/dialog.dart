import 'package:fluent_ui/fluent_ui.dart' as fluent;
import 'package:flutter/material.dart' as material;
import 'package:flutter/widgets.dart';
import 'base.dart';

class UniversalDialog extends StatelessWidget {
  const UniversalDialog({
    super.key,
    this.title,
    this.content,
    this.actions,
  });

  final Widget? title;
  final Widget? content;
  final List<UniversalDialogAction>? actions;

  Future<void> show(BuildContext context) async {
    final design = UniversalUI.of(context).design;
    switch (design) {
      case UIDesign.material:
        await material.showDialog<void>(
          context: context,
          builder: (context) => this,
        );
      case UIDesign.fluent:
        await fluent.showDialog(
          context: context,
          builder: (context) => this,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    final design = UniversalUI.of(context).design;
    List<UniversalDialogAction>? organizedActions = actions;
    if (organizedActions != null) {
      if (organizedActions.length > 1 &&
          organizedActions.where((action) => action.isPrimary).length == 1) {
        final primaryPosition =
            organizedActions.indexWhere((action) => action.isPrimary);
        final primaryAction = organizedActions[primaryPosition];
        if (primaryPosition == 0) {
          organizedActions = organizedActions.reversed.toList();
        }
        switch (design) {
          case UIDesign.material:
            organizedActions = [
              ...organizedActions.where((action) => !action.isPrimary),
              primaryAction,
            ];
          case UIDesign.fluent:
            organizedActions = [
              primaryAction,
              ...organizedActions.reversed.where((action) => !action.isPrimary),
            ];
        }
      }
    }

    switch (design) {
      case UIDesign.material:
        return material.AlertDialog(
          title: title,
          content: content,
          actions: organizedActions,
        );
      case UIDesign.fluent:
        return fluent.ContentDialog(
          title: title,
          content: content,
          actions: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: actions!.map((e) {
                final index = actions!.indexOf(e);
                return Padding(
                  padding: EdgeInsetsDirectional.only(
                    end: index != (actions!.length - 1) ? 6 : 0,
                  ),
                  child: e,
                );
              }).toList(),
            )
          ],
        );
    }
  }
}

class UniversalDialogAction extends StatelessWidget {
  const UniversalDialogAction({
    super.key,
    required this.child,
    this.onPressed,
    this.isPrimary = false,
  });

  final Widget child;
  final void Function()? onPressed;
  final bool isPrimary;

  @override
  Widget build(BuildContext context) {
    final design = UniversalUI.of(context).design;

    switch (design) {
      case UIDesign.material:
        if (isPrimary) {
          return material.FilledButton.tonal(
            onPressed: onPressed,
            child: child,
          );
        } else {
          return material.TextButton(
            onPressed: onPressed,
            child: child,
          );
        }
      case UIDesign.fluent:
        if (isPrimary) {
          return fluent.FilledButton(
            onPressed: onPressed,
            child: child,
          );
        } else {
          return fluent.Button(
            onPressed: onPressed,
            child: child,
          );
        }
    }
  }
}
