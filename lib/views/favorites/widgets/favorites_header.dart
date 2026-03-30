import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_text_styles.dart';

class FavoritesHeader extends StatelessWidget {
  final int          count;
  final VoidCallback onBack;

  const FavoritesHeader({
    super.key,
    required this.count,
    required this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
      child: Row(
        children: [

          GestureDetector(
            onTap: onBack,
            child: Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.white10,
              ),
              child: const Icon(
                Icons.arrow_back_ios_new_rounded,
                color: Colors.white,
                size: 15,
              ),
            ),
          ),
          const SizedBox(width: 16),

          const Text('Favorites', style: AppTextStyles.favoritesTitle),

          const Spacer(),

          if (count > 0)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: AppColors.gold.withOpacity(0.18),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.gold.withOpacity(0.40)),
              ),
              child: Text('$count', style: AppTextStyles.countBadge),
            ),
        ],
      ),
    );
  }
}
