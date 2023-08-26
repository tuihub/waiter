import 'package:flutter/cupertino.dart';

class _BootstrapBreakpoints {
  static const int xs = 0;
  static const int sm = 576;
  static const int md = 768;
  static const int lg = 992;
  static const int xl = 1200;
  static const int xxl = 1400;
}

class _BootstrapContainerMaxWidth {
  static const double xs = double.infinity;
  static const double sm = 540;
  static const double md = 720;
  static const double lg = 960;
  static const double xl = 1140;
  static const double xxl = 1320;
}

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

      if (width >= _BootstrapBreakpoints.xxl) {
        maxWidth = _BootstrapContainerMaxWidth.xxl;
      } else if (width >= _BootstrapBreakpoints.xl) {
        maxWidth = _BootstrapContainerMaxWidth.xl;
      } else if (width >= _BootstrapBreakpoints.lg) {
        maxWidth = _BootstrapContainerMaxWidth.lg;
      } else if (width >= _BootstrapBreakpoints.md) {
        maxWidth = _BootstrapContainerMaxWidth.md;
      } else if (width >= _BootstrapBreakpoints.sm) {
        maxWidth = _BootstrapContainerMaxWidth.sm;
      } else {
        maxWidth = _BootstrapContainerMaxWidth.xs;
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
      this.xs = -1,
      this.sm = -1,
      this.md = -1,
      this.lg = -1,
      this.xl = -1,
      this.xxl = -1});

  final Widget child;
  final int xs;
  final int sm;
  final int md;
  final int lg;
  final int xl;
  final int xxl;

  @override
  Widget build(BuildContext context) {
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

      if (0 <= xs && xs <= 12) {
        xs_ = xs;
      } else {
        xs_ = 0;
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

      if (containerWidth == _BootstrapContainerMaxWidth.xs ||
          containerWidth < _BootstrapContainerMaxWidth.sm) {
        late double maxWidth = constraints.biggest.width;
        if (maxWidth == double.infinity) {
          maxWidth = _BootstrapContainerMaxWidth.sm;
        }
        columnWidth = maxWidth * xs_ / 12;
      } else if (containerWidth < _BootstrapContainerMaxWidth.md) {
        columnWidth = _BootstrapContainerMaxWidth.sm * sm_ / 12;
      } else if (containerWidth < _BootstrapContainerMaxWidth.lg) {
        columnWidth = _BootstrapContainerMaxWidth.md * md_ / 12;
      } else if (containerWidth < _BootstrapContainerMaxWidth.xl) {
        columnWidth = _BootstrapContainerMaxWidth.lg * lg_ / 12;
      } else if (containerWidth < _BootstrapContainerMaxWidth.xxl) {
        columnWidth = _BootstrapContainerMaxWidth.xl * xl_ / 12;
      } else {
        columnWidth = _BootstrapContainerMaxWidth.xxl * xxl_ / 12;
      }

      debugPrint('$containerWidth $xs_ $sm_ $md_ $lg_ $xl_ $xxl_ $columnWidth');

      return SizedBox(
        width: columnWidth,
        child: child,
      );
    });
  }
}
