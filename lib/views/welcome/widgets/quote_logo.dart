import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';

class QuoteLogo extends StatelessWidget {
  final double size;
  const QuoteLogo({super.key, this.size = 72});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: const LinearGradient(
          colors: [AppColors.gold, AppColors.goldLight],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.gold.withOpacity(0.45),
            blurRadius: 26,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Center(
        child: Text(
          '\u201C',
          style: TextStyle(
            fontSize: size * 0.54,
            color: AppColors.goldDark,
            fontFamily: 'Georgia',
            fontWeight: FontWeight.bold,
            height: 1.55,
          ),
        ),
      ),
    );
  }
}
