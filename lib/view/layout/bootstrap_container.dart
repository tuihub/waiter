import 'package:flutter/material.dart';

import 'bootstrap_breakpoints.dart';

class BootstrapContainer extends StatelessWidget {
  const BootstrapContainer(
      {super.key, required this.children, this.alignment = Alignment.center});

  final List<Widget> children;
  final AlignmentGeometry alignment;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final width = constraints.biggest.width;
      late double maxWidth;

      if (width >= BootstrapBreakpoints.xxl) {
        maxWidth = BootstrapContainerMaxWidth.xxl;
      } else if (width >= BootstrapBreakpoints.xl) {
        maxWidth = BootstrapContainerMaxWidth.xl;
      } else if (width >= BootstrapBreakpoints.lg) {
        maxWidth = BootstrapContainerMaxWidth.lg;
      } else if (width >= BootstrapBreakpoints.md) {
        maxWidth = BootstrapContainerMaxWidth.md;
      } else if (width >= BootstrapBreakpoints.sm) {
        maxWidth = BootstrapContainerMaxWidth.sm;
      } else if (width >= BootstrapBreakpoints.xs) {
        maxWidth = BootstrapContainerMaxWidth.xs;
      } else {
        maxWidth = BootstrapContainerMaxWidth.xxs;
      }
      return _InheritedBootstrapContainer(
        width: maxWidth,
        child: Align(
          alignment: alignment,
          child: Container(
            alignment: alignment,
            constraints: BoxConstraints(
              maxWidth: maxWidth,
            ),
            width: maxWidth,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: children,
            ),
          ),
        ),
      );
    });
  }
}

class _InheritedBootstrapContainer extends InheritedWidget {
  const _InheritedBootstrapContainer({
    required this.width,
    required super.child,
  });

  final double width;

  static _InheritedBootstrapContainer? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<_InheritedBootstrapContainer>();
  }

  @override
  bool updateShouldNotify(_InheritedBootstrapContainer old) {
    return old.width != width;
  }
}

class BootstrapColumn extends StatelessWidget {
  const BootstrapColumn(
      {super.key,
      required this.child,
      this.xxs = -1,
      this.xs = -1,
      this.sm = -1,
      this.md = -1,
      this.lg = -1,
      this.xl = -1,
      this.xxl = -1});

  final Widget child;
  final int xxs;
  final int xs;
  final int sm;
  final int md;
  final int lg;
  final int xl;
  final int xxl;

  @override
  Widget build(BuildContext context) {
    int xxs_ = 0;
    int xs_ = 0;
    int sm_ = 0;
    int md_ = 0;
    int lg_ = 0;
    int xl_ = 0;
    int xxl_ = 0;

    return LayoutBuilder(builder: (context, constraints) {
      final containerWidth =
          _InheritedBootstrapContainer.of(context)?.width ?? double.infinity;
      late double columnWidth;

      if (0 <= xxs && xxs <= 12) {
        xxs_ = xxs;
      } else {
        xxs_ = 0;
      }
      if (0 <= xs && xs <= 12) {
        xs_ = xs;
      } else {
        xs_ = xxs_;
      }
      if (0 <= sm && sm <= 12) {
        sm_ = sm;
      } else {
        sm_ = xs_;
      }
      if (0 <= md && md <= 12) {
        md_ = md;
      } else {
        md_ = sm_;
      }
      if (0 <= lg && lg <= 12) {
        lg_ = lg;
      } else {
        lg_ = md_;
      }
      if (0 <= xl && xl <= 12) {
        xl_ = xl;
      } else {
        xl_ = lg_;
      }
      if (0 <= xxl && xxl <= 12) {
        xxl_ = xxl;
      } else {
        xxl_ = xl_;
      }

      if (containerWidth == BootstrapContainerMaxWidth.xxs ||
          containerWidth < BootstrapContainerMaxWidth.xs) {
        late double maxWidth = constraints.biggest.width;
        if (maxWidth == double.infinity) {
          maxWidth = BootstrapContainerMaxWidth.xs;
        }
        columnWidth = maxWidth * xxs_ / 12;
      } else if (containerWidth < BootstrapContainerMaxWidth.sm) {
        columnWidth = BootstrapContainerMaxWidth.xs * xs_ / 12;
      } else if (containerWidth < BootstrapContainerMaxWidth.md) {
        columnWidth = BootstrapContainerMaxWidth.sm * sm_ / 12;
      } else if (containerWidth < BootstrapContainerMaxWidth.lg) {
        columnWidth = BootstrapContainerMaxWidth.md * md_ / 12;
      } else if (containerWidth < BootstrapContainerMaxWidth.xl) {
        columnWidth = BootstrapContainerMaxWidth.lg * lg_ / 12;
      } else if (containerWidth < BootstrapContainerMaxWidth.xxl) {
        columnWidth = BootstrapContainerMaxWidth.xl * xl_ / 12;
      } else {
        columnWidth = BootstrapContainerMaxWidth.xxl * xxl_ / 12;
      }

      debugPrint(
          '$containerWidth $xxs_ $xs_ $sm_ $md_ $lg_ $xl_ $xxl_ $columnWidth');

      return SizedBox(
        width: columnWidth,
        child: child,
      );
    });
  }
}
