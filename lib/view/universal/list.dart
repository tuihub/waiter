import 'package:fluent_ui/fluent_ui.dart' as fluent;
import 'package:flutter/material.dart' as material;
import 'package:flutter/widgets.dart';
import 'universal.dart';

class UniversalListTile extends StatelessWidget {
  const UniversalListTile({
    super.key,
    this.shape,
    this.leading,
    this.title,
    this.subtitle,
    this.trailing,
    this.onTap,
    this.focusNode,
    this.autofocus = false,
    this.contentPadding,
    this.selected = false,
  });

  final ShapeBorder? shape;
  final Widget? leading;
  final Widget? title;
  final Widget? subtitle;
  final Widget? trailing;
  final VoidCallback? onTap;
  final FocusNode? focusNode;
  final bool autofocus;
  final EdgeInsetsGeometry? contentPadding;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    final design = UniversalUI.of(context).design;

    switch (design) {
      case UIDesign.material:
        return material.ListTile(
          shape: shape,
          leading: leading,
          title: title,
          subtitle: subtitle,
          trailing: trailing,
          onTap: onTap,
          focusNode: focusNode,
          autofocus: autofocus,
          selected: selected,
          contentPadding: contentPadding,
        );
      case UIDesign.fluent:
        return fluent.ListTile.selectable(
          shape: shape ?? fluent.kDefaultListTileShape,
          leading: leading,
          title: title,
          subtitle: subtitle,
          trailing: trailing,
          onPressed: onTap,
          focusNode: focusNode,
          autofocus: autofocus,
          selected: selected,
          contentPadding: contentPadding ?? fluent.kDefaultListTilePadding,
        );
    }
  }
}
