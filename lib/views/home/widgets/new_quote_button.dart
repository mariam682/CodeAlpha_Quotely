import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_text_styles.dart';

class NewQuoteButton extends StatelessWidget {
  final VoidCallback onTap;

  const NewQuoteButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 54,
        constraints: const BoxConstraints(maxWidth: 280),
        margin: const EdgeInsets.only(bottom: 44),
        decoration: BoxDecoration(
          color: AppColors.white10,
          borderRadius: BorderRadius.circular(27),
          border: Border.all(
            color: AppColors.gold.withOpacity(0.30),
            width: 1.5,
          ),
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.refresh_rounded, color: AppColors.gold, size: 18),
            SizedBox(width: 8),
            Text('New Quote', style: AppTextStyles.newQuoteBtn),
          ],
        ),
      ),
    );
  }
}
