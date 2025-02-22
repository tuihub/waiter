import 'package:fluent_ui/fluent_ui.dart' as fluent;
import 'package:flutter/material.dart' as material;
import 'package:flutter/widgets.dart';
import 'base.dart';
import 'list_tile.dart';

class UniversalToolBar extends StatelessWidget {
  const UniversalToolBar({
    super.key,
    required this.primaryItems,
    this.secondaryItems = const [],
    this.mainAxisAlignment = MainAxisAlignment.start,
  });

  final List<UniversalToolBarItem> primaryItems;
  final List<UniversalToolBarItem> secondaryItems;
  final MainAxisAlignment mainAxisAlignment;

  @override
  Widget build(BuildContext context) {
    final design = UniversalUI.of(context).design;

    switch (design) {
      case UIDesign.material:
        return Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: mainAxisAlignment,
          children: [
            ...primaryItems,
            if (secondaryItems.isNotEmpty)
              material.PopupMenuButton(
                itemBuilder: (context) {
                  return [
                    for (final item in secondaryItems)
                      item.buildMaterialMenuItem(),
                  ];
                },
              ),
          ],
        );
      case UIDesign.fluent:
        Widget ret = fluent.CommandBar(
          mainAxisAlignment: mainAxisAlignment,
          primaryItems: primaryItems.map((e) => e.buildFluentItem()).toList(),
          secondaryItems:
              secondaryItems.map((e) => e.buildFluentItem()).toList(),
        );
        if (UniversalListTile.of(context) != null) {
          ret = fluent.Flexible(
            child: ret,
          );
        }
        return ret;
    }
  }
}

class UniversalToolBarItem extends StatelessWidget {
  const UniversalToolBarItem({
    super.key,
    this.icon,
    this.onPressed,
    this.label,
  });

  final IconData? icon;
  final VoidCallback? onPressed;
  final Widget? label;

  fluent.CommandBarItem buildFluentItem() {
    return fluent.CommandBarButton(
      icon: icon != null ? fluent.Icon(icon) : null,
      onPressed: onPressed,
      label: label,
    );
  }

  material.PopupMenuItem buildMaterialMenuItem() {
    return material.PopupMenuItem(
      onTap: onPressed,
      child: label,
    );
  }

  @override
  Widget build(BuildContext context) {
    return material.TextButton.icon(
      icon: icon != null ? material.Icon(icon) : null,
      onPressed: onPressed,
      label: label ?? const SizedBox(),
    );
  }
}
