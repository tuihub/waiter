import 'dart:ui';

import 'package:flutter/material.dart';

class BackdropBlur extends StatelessWidget {
  const BackdropBlur({super.key, required this.begin, required this.end});

  final AlignmentGeometry begin;
  final AlignmentGeometry end;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: begin,
          end: end,
          colors: [
            Theme.of(context)
                .colorScheme
                .surfaceContainerHighest
                .withOpacity(0),
            Theme.of(context)
                .colorScheme
                .surfaceContainerHighest
                .withOpacity(0.8125),
          ],
        ),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
        child: Container(
          color: Colors.transparent,
        ),
      ),
    );
  }
}

TextStyle backdropBlurTextStyle(BuildContext context, {double fontSize = 52}) {
  return TextStyle(
    fontSize: fontSize,
    color: Theme.of(context).colorScheme.onSurface.withOpacity(0.1),
    shadows: [
      Shadow(
        color: Theme.of(context).colorScheme.onSurface.withOpacity(0.5),
        blurRadius: 1,
      )
    ],
  );
}
