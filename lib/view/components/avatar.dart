import 'dart:math';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  const Avatar({
    super.key,
    required this.name,
    required this.image,
    required this.radius,
  });

  final String name;
  final double radius;
  final String image;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: _getColorFromString(name),
        borderRadius: BorderRadius.circular(radius),
        image: DecorationImage(
          image: ExtendedNetworkImageProvider(image),
          fit: BoxFit.cover,
        ),
      ),
      child: Text(
        name.isNotEmpty ? name[0].toUpperCase() : '',
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

Color _getColorFromString(String str) {
  final int hash = str.hashCode;
  final random = Random(hash);
  return Color.fromARGB(
    255,
    random.nextInt(100) + 155,
    random.nextInt(100) + 155,
    random.nextInt(100) + 155,
  );
}
