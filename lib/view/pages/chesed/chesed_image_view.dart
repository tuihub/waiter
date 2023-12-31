import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

import '../../helper/spacing.dart';

class ChesedImageViewWidget extends StatelessWidget {
  final String imageUrl;

  const ChesedImageViewWidget({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Ink(
          decoration: BoxDecoration(
            borderRadius: SpacingHelper.defaultBorderRadius,
            image: DecorationImage(
              image: ExtendedNetworkImageProvider(
                imageUrl,
              ),
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: const Icon(Icons.close),
      ),
    );
  }
}
