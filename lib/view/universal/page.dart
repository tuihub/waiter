import 'package:fluent_ui/fluent_ui.dart' as fluent;
import 'package:flutter/material.dart' as material;
import 'package:flutter/widgets.dart';
import 'common.dart';

class UniversalPageRoute<T> extends PageRoute<T> {
  UniversalPageRoute({
    required this.builder,
    super.settings,
    this.maintainState = true,
    super.fullscreenDialog,
    super.allowSnapshotting = true,
    super.barrierDismissible = false,
  }) {
    assert(opaque);
  }

  /// Builds the primary contents of the route.
  final WidgetBuilder builder;

  @override
  Duration get transitionDuration => const Duration(milliseconds: 300);

  @override
  Color? get barrierColor => null;

  @override
  String? get barrierLabel => null;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    final design = UniversalUI.of(context).design;
    switch (design) {
      case UIDesign.material:
        final material.PageTransitionsTheme theme =
            material.Theme.of(context).pageTransitionsTheme;
        return theme.buildTransitions<T>(
            this, context, animation, secondaryAnimation, builder(context));
      case UIDesign.fluent:
        return fluent.DrillInPageTransition(
          animation: animation,
          child: builder(context),
        );
    }
  }

  @override
  final bool maintainState;
}
