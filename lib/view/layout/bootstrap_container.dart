import 'package:flutter/material.dart';

import 'bootstrap_breakpoints.dart';

class BootstrapContainer extends StatelessWidget {
  const BootstrapContainer({
    super.key,
    required this.children,
    this.alignment = Alignment.center,
    this.fill = BootstrapSteps.undefined,
  });

  final List<Widget> children;
  final AlignmentGeometry alignment;
  final BootstrapSteps fill;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final width = constraints.biggest.width;
      late double maxWidth;

      if (width >= BootstrapBreakpoints.xxl) {
        if (fill.value >= BootstrapSteps.xxl.value) {
          maxWidth = width;
        } else {
          maxWidth = BootstrapContainerMaxWidth.xxl;
        }
      } else if (width >= BootstrapBreakpoints.xl) {
        if (fill.value >= BootstrapSteps.xl.value) {
          maxWidth = width;
        } else {
          maxWidth = BootstrapContainerMaxWidth.xl;
        }
      } else if (width >= BootstrapBreakpoints.lg) {
        if (fill.value >= BootstrapSteps.lg.value) {
          maxWidth = width;
        } else {
          maxWidth = BootstrapContainerMaxWidth.lg;
        }
      } else if (width >= BootstrapBreakpoints.md) {
        if (fill.value >= BootstrapSteps.md.value) {
          maxWidth = width;
        } else {
          maxWidth = BootstrapContainerMaxWidth.md;
        }
      } else if (width >= BootstrapBreakpoints.sm) {
        if (fill.value >= BootstrapSteps.sm.value) {
          maxWidth = width;
        } else {
          maxWidth = BootstrapContainerMaxWidth.sm;
        }
      } else if (width >= BootstrapBreakpoints.xs) {
        if (fill.value >= BootstrapSteps.xs.value) {
          maxWidth = width;
        } else {
          maxWidth = BootstrapContainerMaxWidth.xs;
        }
      } else {
        if (fill.value >= BootstrapSteps.xxs.value) {
          maxWidth = width;
        } else {
          maxWidth = BootstrapContainerMaxWidth.xxs;
        }
      }
      return _InheritedBootstrapContainer(
        width: maxWidth,
        filled: maxWidth == width,
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
    required this.filled,
    required super.child,
  });

  final double width;
  final bool filled;

  static _InheritedBootstrapContainer? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<_InheritedBootstrapContainer>();
  }

  @override
  bool updateShouldNotify(_InheritedBootstrapContainer old) {
    return old.width != width;
  }
}

typedef BootstrapColumnBuilder = Widget Function(
    BuildContext context, bool containerFilled);

class BootstrapColumn extends StatelessWidget {
  const BootstrapColumn(
      {super.key,
      this.child,
      this.builder,
      this.fill = BootstrapSteps.undefined,
      this.xxs = -1,
      this.xs = -1,
      this.sm = -1,
      this.md = -1,
      this.lg = -1,
      this.xl = -1,
      this.xxl = -1})
      : assert(child != null || builder != null,
            'child or builder must not be null');

  final BootstrapColumnBuilder? builder;
  final Widget? child;
  final BootstrapSteps fill;
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
        if (fill.value >= BootstrapSteps.xxs.value) {
          columnWidth = containerWidth;
        } else {
          double maxWidth = constraints.biggest.width;
          if (maxWidth == double.infinity) {
            maxWidth = BootstrapContainerMaxWidth.xs;
          }
          columnWidth = maxWidth * xxs_ / 12;
        }
      } else if (containerWidth < BootstrapContainerMaxWidth.sm) {
        if (fill.value >= BootstrapSteps.xs.value) {
          columnWidth = containerWidth;
        } else {
          columnWidth = BootstrapContainerMaxWidth.xs * xs_ / 12;
        }
      } else if (containerWidth < BootstrapContainerMaxWidth.md) {
        if (fill.value >= BootstrapSteps.sm.value) {
          columnWidth = containerWidth;
        } else {
          columnWidth = BootstrapContainerMaxWidth.sm * sm_ / 12;
        }
      } else if (containerWidth < BootstrapContainerMaxWidth.lg) {
        if (fill.value >= BootstrapSteps.md.value) {
          columnWidth = containerWidth;
        } else {
          columnWidth = BootstrapContainerMaxWidth.md * md_ / 12;
        }
      } else if (containerWidth < BootstrapContainerMaxWidth.xl) {
        if (fill.value >= BootstrapSteps.lg.value) {
          columnWidth = containerWidth;
        } else {
          columnWidth = BootstrapContainerMaxWidth.lg * lg_ / 12;
        }
      } else if (containerWidth < BootstrapContainerMaxWidth.xxl) {
        if (fill.value >= BootstrapSteps.xl.value) {
          columnWidth = containerWidth;
        } else {
          columnWidth = BootstrapContainerMaxWidth.xl * xl_ / 12;
        }
      } else {
        if (fill.value >= BootstrapSteps.xxl.value) {
          columnWidth = containerWidth;
        } else {
          columnWidth = BootstrapContainerMaxWidth.xxl * xxl_ / 12;
        }
      }
      if (builder != null) {
        return SizedBox(
          width: columnWidth,
          child: builder!(context,
              _InheritedBootstrapContainer.of(context)?.filled ?? false),
        );
      } else {
        return SizedBox(
          width: columnWidth,
          child: child,
        );
      }
    });
  }
}
