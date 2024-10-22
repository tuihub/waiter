import 'package:flutter/material.dart';

final class SpacingHelper {
  static Widget defaultDivider = _DefaultDivider();

  static List<Widget> listSpacing({
    required Iterable<Widget> children,
    double height = 0,
    double width = 0,
    bool includeEnds = false,
  }) {
    final list = children
        .expand((item) sync* {
          yield SizedBox(height: height, width: width);
          yield item;
        })
        .skip(1)
        .toList();
    if (includeEnds) {
      return [
        SizedBox(height: height, width: width),
        ...list,
        SizedBox(height: height, width: width),
      ];
    } else {
      return list;
    }
  }
}

class _DefaultDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 10,
      indent: 20,
      endIndent: 20,
      thickness: 2,
      color: Theme.of(context).brightness == Brightness.dark
          ? Theme.of(context).colorScheme.outline
          : Theme.of(context).colorScheme.outlineVariant,
    );
  }
}
