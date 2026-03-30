import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_text_styles.dart';

class FeatureIconItem extends StatelessWidget {
  final IconData icon;
  final String   label;

  const FeatureIconItem({
    super.key,
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.white10,
            border: Border.all(color: AppColors.white20),
          ),
          child: Icon(icon, color: AppColors.gold, size: 22),
        ),
        const SizedBox(height: 8),
        Text(label, style: AppTextStyles.featureLabel),
      ],
    );
  }
}
