import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_text_styles.dart';

class EmptyFavoritesView extends StatelessWidget {
  const EmptyFavoritesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.favorite_border_rounded,
            color: AppColors.gold.withOpacity(0.38),
            size: 64,
          ),
          const SizedBox(height: 22),
          const Text('No favorites yet', style: AppTextStyles.emptyTitle),
          const SizedBox(height: 10),
          const Text(
            'Tap the heart on any quote\nto save it here.',
            textAlign: TextAlign.center,
            style: AppTextStyles.emptySubtitle,
          ),
        ],
      ),
    );
  }
}
