import 'package:flutter/material.dart';
import '../../../data/models/quote_model.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_text_styles.dart';
import 'circle_icon_button.dart';

class QuoteCard extends StatelessWidget {
  final Quote              quote;
  final bool               isFavorite;
  final Animation<double>  heartScaleAnimation;
  final VoidCallback        onFavoriteToggle;
  final VoidCallback        onShare;

  const QuoteCard({
    super.key,
    required this.quote,
    required this.isFavorite,
    required this.heartScaleAnimation,
    required this.onFavoriteToggle,
    required this.onShare,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(32, 28, 32, 28),
      decoration: BoxDecoration(
        color: AppColors.cardBg,
        borderRadius: BorderRadius.circular(28),
        border: Border.all(color: AppColors.cardBorder),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.30),
            blurRadius: 40,
            offset: const Offset(0, 20),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Text(
            '\u201C\u201C',
            style: TextStyle(
              fontSize: 44,
              color: AppColors.gold.withOpacity(0.80),
              fontFamily: 'Georgia',
              height: 0.8,
            ),
          ),
          const SizedBox(height: 16),

          Text(quote.text, style: AppTextStyles.quoteText),

          Container(
            margin: const EdgeInsets.symmetric(vertical: 24),
            height: 1,
            color: AppColors.white20,
          ),

          Text(
            '— ${quote.author.toUpperCase()}',
            style: AppTextStyles.author,
          ),
          const SizedBox(height: 24),

          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [

              CircleIconButton(
                icon:  Icons.share_outlined,
                onTap: onShare,
              ),
              const SizedBox(width: 10),

              ScaleTransition(
                scale: heartScaleAnimation,
                child: CircleIconButton(
                  icon: isFavorite
                      ? Icons.favorite_rounded
                      : Icons.favorite_border_rounded,
                  onTap:     onFavoriteToggle,
                  iconColor: isFavorite ? Colors.red[300] : null,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
