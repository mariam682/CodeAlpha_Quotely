import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_text_styles.dart';

class GetStartedButton extends StatelessWidget {
  final VoidCallback onTap;

  const GetStartedButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 56,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [AppColors.gold, AppColors.goldLight, AppColors.gold],
          ),
          borderRadius: BorderRadius.circular(28),
          boxShadow: [
            BoxShadow(
              color: AppColors.gold.withOpacity(0.45),
              blurRadius: 22,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Get Started', style: AppTextStyles.getStartedBtn),
            SizedBox(width: 8),
            Icon(
              Icons.arrow_forward_rounded,
              color: AppColors.goldDark,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }
}
