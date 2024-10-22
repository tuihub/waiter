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

class UniversalExpansionTile extends StatelessWidget {
  const UniversalExpansionTile({
    super.key,
    this.leading,
    required this.title,
    this.subtitle,
    required this.children,
    this.trailing,
    this.initiallyExpanded = false,
    this.onExpansionChanged,
    this.backgroundColor,
    this.childrenPadding = const EdgeInsets.all(16.0),
  });

  final Widget? leading;
  final Widget title;
  final Widget? subtitle;
  final List<Widget> children;
  final Widget? trailing;
  final bool initiallyExpanded;
  final ValueChanged<bool>? onExpansionChanged;
  final Color? backgroundColor;
  final EdgeInsetsGeometry childrenPadding;

  @override
  Widget build(BuildContext context) {
    final design = UniversalUI.of(context).design;
    final theme = fluent.FluentTheme.of(context);

    switch (design) {
      case UIDesign.material:
        return material.ExpansionTile(
          leading: leading,
          title: title,
          subtitle: subtitle,
          trailing: trailing,
          initiallyExpanded: initiallyExpanded,
          onExpansionChanged: onExpansionChanged,
          backgroundColor: backgroundColor,
          childrenPadding: childrenPadding,
          children: children,
        );
      case UIDesign.fluent:
        return fluent.Expander(
          leading: leading,
          header: Container(
            constraints: const BoxConstraints(
              minHeight: fluent.kOneLineTileHeight,
              minWidth: 88.0,
            ),
            margin: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 2.0),
            padding: fluent.kDefaultListTilePadding,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DefaultTextStyle.merge(
                  style: (theme.typography.body ?? const TextStyle())
                      .copyWith(fontSize: 16),
                  child: title,
                ),
                if (subtitle != null)
                  DefaultTextStyle.merge(
                    style: theme.typography.caption ?? const TextStyle(),
                    child: subtitle!,
                  ),
              ],
            ),
          ),
          initiallyExpanded: initiallyExpanded,
          onStateChanged: onExpansionChanged,
          trailing: trailing,
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: children,
          ),
          contentBackgroundColor: backgroundColor,
          contentPadding: childrenPadding,
        );
    }
  }
}
