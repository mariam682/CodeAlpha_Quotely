import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_text_styles.dart';
import 'circle_icon_button.dart';

class HomeHeader extends StatelessWidget {
  final int          favoritesCount;
  final VoidCallback onFavoritesTap;

  const HomeHeader({
    super.key,
    required this.favoritesCount,
    required this.onFavoritesTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('Quotely', style: AppTextStyles.appTitle),
          CircleIconButton(
            icon: favoritesCount > 0
                ? Icons.favorite_rounded
                : Icons.favorite_border_rounded,
            onTap:     onFavoritesTap,
            iconColor: AppColors.gold,
            bgColor:   AppColors.gold.withOpacity(0.18),
            size:      40,
            iconSize:  18,
          ),
        ],
      ),
    );
  }
}
