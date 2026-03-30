import 'package:flutter/material.dart';

class BackgroundOrb extends StatelessWidget {
  final double size;
  final Color  color;
  final double opacity;

  const BackgroundOrb({
    super.key,
    required this.size,
    required this.color,
    this.opacity = 0.18,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color.withOpacity(opacity),
      ),
    );
  }
}
