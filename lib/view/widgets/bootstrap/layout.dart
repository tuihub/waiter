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
  const BootstrapContainer({super.key, required this.children});

  final List<Widget> children;

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
        child: Center(
          child: Container(
            constraints: BoxConstraints(
              maxWidth: maxWidth,
            ),
            width: maxWidth,
            height: constraints.biggest.height,
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
      this.xs = 0,
      this.sm = 0,
      this.md = 0,
      this.lg = 0,
      this.xl = 0,
      this.xxl = 0});

  final Widget child;
  final int xs;
  final int sm;
  final int md;
  final int lg;
  final int xl;
  final int xxl;

  @override
  Widget build(BuildContext context) {
    int xs = 0;
    int sm = 0;
    int md = 0;
    int lg = 0;
    int xl = 0;
    int xxl = 0;

    return LayoutBuilder(builder: (context, constraints) {
      final containerWidth =
          _InheritedBootstrapContainer.of(context)?.width ?? double.infinity;
      late double columnWidth;

      if (1 <= xs && xs <= 12) {
        xs = xs;
      } else {
        xs = 1;
      }
      if (1 <= sm && sm <= 12) {
        sm = sm;
      } else {
        sm = xs;
      }
      if (1 <= md && md <= 12) {
        md = md;
      } else {
        md = sm;
      }
      if (1 <= lg && lg <= 12) {
        lg = lg;
      } else {
        lg = md;
      }
      if (1 <= xl && xl <= 12) {
        xl = xl;
      } else {
        xl = lg;
      }
      if (1 <= xxl && xxl <= 12) {
        xxl = xxl;
      } else {
        xxl = xxl;
      }

      if (containerWidth == _BootstrapContainerMaxWidth.xs ||
          containerWidth < _BootstrapContainerMaxWidth.sm) {
        late double maxWidth = constraints.biggest.width;
        if (maxWidth == double.infinity) {
          maxWidth = _BootstrapContainerMaxWidth.sm;
        }
        columnWidth = maxWidth * xs / 12;
      } else if (containerWidth < _BootstrapContainerMaxWidth.md) {
        columnWidth = _BootstrapContainerMaxWidth.sm * sm / 12;
      } else if (containerWidth < _BootstrapContainerMaxWidth.lg) {
        columnWidth = _BootstrapContainerMaxWidth.md * md / 12;
      } else if (containerWidth < _BootstrapContainerMaxWidth.xl) {
        columnWidth = _BootstrapContainerMaxWidth.lg * lg / 12;
      } else if (containerWidth < _BootstrapContainerMaxWidth.xxl) {
        columnWidth = _BootstrapContainerMaxWidth.xl * xl / 12;
      } else {
        columnWidth = _BootstrapContainerMaxWidth.xxl * xxl / 12;
      }

      return SizedBox(
        width: columnWidth,
        child: child,
      );
    });
  }
}
