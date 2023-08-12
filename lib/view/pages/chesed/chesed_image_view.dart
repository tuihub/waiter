import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

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
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(
              image: CachedNetworkImageProvider(
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
