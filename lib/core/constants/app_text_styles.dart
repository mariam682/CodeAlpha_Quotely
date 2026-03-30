import 'package:flutter/material.dart';
import 'app_colors.dart';

abstract final class AppTextStyles {

  static const TextStyle welcomeTitle = TextStyle(
    fontSize: 36,
    fontWeight: FontWeight.bold,
    color: Colors.white,
    fontFamily: 'Georgia',
    letterSpacing: 0.5,
  );

  static const TextStyle tagline = TextStyle(
    fontSize: 15,
    color: AppColors.white70,
    height: 1.6,
  );

  static const TextStyle previewQuote = TextStyle(
    fontFamily: 'Georgia',
    fontStyle: FontStyle.italic,
    fontSize: 13,
    color: AppColors.white90,
    height: 1.5,
  );

  static const TextStyle previewAuthor = TextStyle(
    fontSize: 11,
    color: AppColors.gold,
    fontWeight: FontWeight.w600,
    letterSpacing: 1.2,
  );

  static const TextStyle getStartedBtn = TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.w700,
    color: AppColors.goldDark,
    letterSpacing: 0.3,
  );

  static const TextStyle featureLabel = TextStyle(
    fontSize: 11,
    color: AppColors.white70,
  );

  static const TextStyle appTitle = TextStyle(
    fontSize: 26,
    fontWeight: FontWeight.bold,
    color: Colors.white,
    fontFamily: 'Georgia',
    letterSpacing: 0.3,
  );

  static const TextStyle quoteText = TextStyle(
    fontFamily: 'Georgia',
    fontStyle: FontStyle.italic,
    fontSize: 22,
    color: Colors.white,
    height: 1.55,
  );

  static const TextStyle author = TextStyle(
    fontSize: 14,
    color: AppColors.gold,
    fontWeight: FontWeight.w500,
    letterSpacing: 1.2,
  );

  static const TextStyle newQuoteBtn = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: Colors.white,
    letterSpacing: 0.3,
  );

  static const TextStyle favoritesTitle = TextStyle(
    fontSize: 26,
    fontWeight: FontWeight.bold,
    color: Colors.white,
    fontFamily: 'Georgia',
  );

  static const TextStyle quoteTextSmall = TextStyle(
    fontFamily: 'Georgia',
    fontStyle: FontStyle.italic,
    fontSize: 16,
    color: Colors.white,
    height: 1.55,
  );

  static const TextStyle authorSmall = TextStyle(
    fontSize: 12,
    color: AppColors.gold,
    fontWeight: FontWeight.w500,
    letterSpacing: 1.1,
  );

  static const TextStyle countBadge = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.bold,
    color: AppColors.gold,
  );

  static const TextStyle emptyTitle = TextStyle(
    fontSize: 20,
    fontFamily: 'Georgia',
    color: AppColors.white70,
  );

  static const TextStyle emptySubtitle = TextStyle(
    fontSize: 14,
    color: AppColors.white50,
    height: 1.5,
  );
}
