import 'package:fluent_ui/fluent_ui.dart' as fluent;
import 'package:flutter/material.dart' as material;
import 'package:flutter/widgets.dart';
import 'universal.dart';

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
        return fluent.CommandBar(
          mainAxisAlignment: mainAxisAlignment,
          primaryItems: primaryItems.map((e) => e.buildFluentItem()).toList(),
          secondaryItems:
              secondaryItems.map((e) => e.buildFluentItem()).toList(),
        );
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
      icon: fluent.Icon(icon),
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
      icon: material.Icon(icon),
      onPressed: onPressed,
      label: label ?? const SizedBox(),
    );
  }
}
