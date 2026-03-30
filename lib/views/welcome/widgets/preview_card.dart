import 'package:flutter/material.dart';
import '../../../data/models/quote_model.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_text_styles.dart';

class PreviewCard extends StatelessWidget {
  final Quote  quote;
  final double opacity;
  final double scale;

  const PreviewCard({
    super.key,
    required this.quote,
    this.opacity = 1.0,
    this.scale   = 1.0,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: scale,
      child: Opacity(
        opacity: opacity,
        child: Container(
          margin: const EdgeInsets.only(bottom: 10),
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
          decoration: BoxDecoration(
            color: AppColors.white10,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: AppColors.white20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '\u201C${quote.text}\u201D',
                style: AppTextStyles.previewQuote,
              ),
              const SizedBox(height: 8),
              Text(
                '— ${quote.author.toUpperCase()}',
                style: AppTextStyles.previewAuthor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
