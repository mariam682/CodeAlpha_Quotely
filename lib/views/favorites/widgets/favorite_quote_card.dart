import 'package:flutter/material.dart';
import '../../../data/models/quote_model.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_text_styles.dart';

class FavoriteQuoteCard extends StatelessWidget {
  final Quote        quote;
  final VoidCallback onRemove;

  const FavoriteQuoteCard({
    super.key,
    required this.quote,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.white10,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppColors.white20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Text(
            '\u201C\u201C',
            style: TextStyle(
              fontSize: 28,
              color: AppColors.gold.withOpacity(0.70),
              fontFamily: 'Georgia',
              height: 0.8,
            ),
          ),
          const SizedBox(height: 12),

          Text(quote.text, style: AppTextStyles.quoteTextSmall),
          const SizedBox(height: 16),

          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  '— ${quote.author.toUpperCase()}',
                  style: AppTextStyles.authorSmall,
                ),
              ),
              GestureDetector(
                onTap: onRemove,
                child: const Icon(
                  Icons.favorite_rounded,
                  color: AppColors.gold,
                  size: 20,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
