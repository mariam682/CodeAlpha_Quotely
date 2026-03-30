import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import '../data/models/quote_model.dart';

class FavoritesViewModel extends ChangeNotifier {
  final List<Quote> _favorites = [];

  List<Quote> get favorites    => List.unmodifiable(_favorites);
  int          get count       => _favorites.length;
  bool         get isEmpty     => _favorites.isEmpty;
  bool         get isNotEmpty  => _favorites.isNotEmpty;

  bool isFavorite(Quote quote) => _favorites.contains(quote);

  void add(Quote quote) {
    if (_favorites.contains(quote)) return;
    _favorites.add(quote);
    notifyListeners();
  }

  void remove(Quote quote) {
    if (!_favorites.remove(quote)) return;
    HapticFeedback.lightImpact();
    notifyListeners();
  }

  void toggle(Quote quote) =>
      isFavorite(quote) ? remove(quote) : add(quote);
}
