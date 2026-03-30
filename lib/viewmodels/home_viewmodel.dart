import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'dart:math';

import '../data/models/quote_model.dart';
import '../data/repositories/quote_repository.dart';
import '../core/constants/app_colors.dart';

class HomeViewModel extends ChangeNotifier {
  HomeViewModel({IQuoteRepository? repository})
      : _repository = repository ?? QuoteRepository() {
    _currentQuote = _repository.getAllQuotes().first;
  }

  final IQuoteRepository _repository;
  final _rng = Random();

  late Quote _currentQuote;
  int  _gradientIndex  = 0;
  bool _isTransitioning = false;

  Quote          get currentQuote    => _currentQuote;
  List<Color>    get currentGradient => AppColors.gradients[_gradientIndex];
  bool           get isTransitioning => _isTransitioning;

  void loadNextQuote() {
    if (_isTransitioning) return;
    HapticFeedback.mediumImpact();

    _isTransitioning = true;
    notifyListeners();

    Future.delayed(const Duration(milliseconds: 350), () {
      _currentQuote   = _repository.getRandomQuote();
      _gradientIndex  = _rng.nextInt(AppColors.gradients.length);
      _isTransitioning = false;
      notifyListeners();
    });
  }

  void onShareTapped(VoidCallback showShareUI) {
    HapticFeedback.selectionClick();
    showShareUI();
  }
}
