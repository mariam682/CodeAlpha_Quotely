import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';

class CircleIconButton extends StatelessWidget {
  final IconData   icon;
  final VoidCallback onTap;
  final Color?     iconColor;
  final Color?     bgColor;
  final double     size;
  final double     iconSize;

  const CircleIconButton({
    super.key,
    required this.icon,
    required this.onTap,
    this.iconColor,
    this.bgColor,
    this.size     = 38,
    this.iconSize = 18,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: bgColor ?? AppColors.white10,
          border: Border.all(color: AppColors.white10),
        ),
        child: Icon(
          icon,
          color: iconColor ?? Colors.white.withOpacity(0.82),
          size: iconSize,
        ),
      ),
    );
  }
}
