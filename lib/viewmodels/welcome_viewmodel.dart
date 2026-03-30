import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import '../data/models/quote_model.dart';
import '../data/repositories/quote_repository.dart';

class WelcomeViewModel extends ChangeNotifier {
  WelcomeViewModel({IQuoteRepository? repository})
      : _repository = repository ?? QuoteRepository();

  final IQuoteRepository _repository;

  late final List<Quote> previewQuotes = _repository.getPreviewQuotes(3);

  void onGetStartedTapped(VoidCallback onNavigate) {
    HapticFeedback.lightImpact();
    onNavigate();
  }
}
