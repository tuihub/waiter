// https://github.com/blackmann/overlapping_panels

import 'dart:core';

import 'package:flutter/material.dart';

const double minPixelsPerSecond = 240;
const double minDragExtent = 24;

/// Display sections
enum RevealSide { left, right, main }

/// Widget to display three view panels with the [OverlappingPanels.main] being
/// in the center, [OverlappingPanels.left] and [OverlappingPanels.right] also
/// revealing from their respective sides. Just like you will see in the
/// Discord mobile app's navigation.
class OverlappingPanels extends StatefulWidget {
  /// The left panel
  final Widget? left;

  /// The main panel
  final Widget main;

  /// The right panel
  final Widget? right;

  /// The offset to use to keep the main panel visible when the left or right
  /// panel is revealed.
  final double restWidth;

  /// Allow reveal to left
  final bool gestureLeft;

  /// Allow reveal to right
  final bool gestureRight;

  /// A callback to notify when a panel reveal has completed.
  final ValueChanged<RevealSide>? onSideChange;

  const OverlappingPanels({
    this.left,
    required this.main,
    this.right,
    this.restWidth = 40,
    this.onSideChange,
    this.gestureLeft = true,
    this.gestureRight = true,
    super.key,
  });

  static OverlappingPanelsState? of(BuildContext context) {
    return context.findAncestorStateOfType<OverlappingPanelsState>();
  }

  @override
  State<StatefulWidget> createState() {
    return OverlappingPanelsState();
  }
}

class OverlappingPanelsState extends State<OverlappingPanels>
    with TickerProviderStateMixin {
  AnimationController? controller;
  double translate = 0;
  double lastTranslate = 0;
  late double width;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback(
      (_) => setState(() {
        translate = widget.left == null ? 0 : _calculateGoal(width, 1);
        lastTranslate = translate;
      }),
    );
  }

  double _calculateGoal(double width, int multiplier) {
    return (multiplier * width) + (-multiplier * widget.restWidth);
  }

  void _onApplyTranslation(Offset pixelsPerSecond, bool gestureEnd) {
    final animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 160));

    animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        widget.onSideChange?.call(translate == 0
            ? RevealSide.main
            : (translate > 0 ? RevealSide.left : RevealSide.right));
        animationController.dispose();
      }
    });

    double goal;
    if (pixelsPerSecond.dx.abs() > minPixelsPerSecond) {
      final multiplier = (translate > lastTranslate
          ? lastTranslate < 0
              ? 0
              : 1
          : lastTranslate > 0
              ? 0
              : -1);
      goal = _calculateGoal(width, multiplier);
    } else if (translate.abs() >= width / 2) {
      final multiplier = (translate > 0 ? 1 : -1);
      goal = _calculateGoal(width, multiplier);
    } else {
      goal = 0;
    }

    if ((translate - lastTranslate).abs() > minDragExtent) {
      translate += translate < lastTranslate ? minDragExtent : -minDragExtent;
    } else {
      translate = lastTranslate;
    }

    if (widget.left == null && goal > 0) goal = 0;
    if (widget.right == null && goal < 0) goal = 0;

    if (!widget.gestureLeft && gestureEnd && goal > 0) goal = 0;
    if (!widget.gestureRight && gestureEnd && goal < 0) goal = 0;

    final Tween<double> tween = Tween<double>(begin: translate, end: goal);

    final animation = tween.animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.fastOutSlowIn,
    ));

    animation.addListener(() {
      setState(() {
        translate = animation.value;
        lastTranslate = animation.value;
      });
    });

    animationController.forward();
  }

  void reveal(RevealSide direction) {
    final multiplier = (direction == RevealSide.left ? 1 : -1);
    double goal =
        direction == RevealSide.main ? 0 : _calculateGoal(width, multiplier);

    if (widget.left == null && goal > 0) goal = 0;
    if (widget.right == null && goal < 0) goal = 0;

    final animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200));

    animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _onApplyTranslation(Offset.zero, false);
        animationController.dispose();
      }
    });

    final animation =
        Tween<double>(begin: translate, end: goal).animate(animationController);

    animation.addListener(() {
      setState(() {
        translate = animation.value;
      });
    });

    animationController.forward();
  }

  void _onTranslate(double delta) {
    setState(() {
      final translate = this.translate + delta;
      if ((widget.gestureRight && translate < 0 && widget.right != null) ||
          (widget.gestureLeft && translate > 0 && widget.left != null)) {
        this.translate = translate;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      width = constraints.biggest.width;

      return WillPopScope(
        onWillPop: () async {
          if (translate < 0) {
            reveal(RevealSide.main);
          } else if (translate == 0) {
            reveal(RevealSide.left);
          } else {
            return true;
          }
          return false;
        },
        child: Stack(children: [
          Offstage(
            offstage: translate < 0,
            child: widget.left,
          ),
          Offstage(
            offstage: translate > 0,
            child: widget.right,
          ),
          Transform.translate(
            offset: translate == lastTranslate
                ? Offset(translate, 0)
                : (translate - lastTranslate).abs() > minDragExtent
                    ? Offset(
                        translate > lastTranslate
                            ? translate - minDragExtent
                            : translate + minDragExtent,
                        0)
                    : Offset(lastTranslate, 0),
            child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () {
                if (translate != 0) {
                  reveal(RevealSide.main);
                }
              },
              child: IgnorePointer(
                ignoring: translate != 0,
                child: widget.main,
              ),
            ),
          ),
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            onHorizontalDragUpdate: (details) {
              _onTranslate(details.delta.dx);
            },
            onHorizontalDragEnd: (details) {
              _onApplyTranslation(details.velocity.pixelsPerSecond, true);
            },
          ),
        ]),
      );
    });
  }
}
