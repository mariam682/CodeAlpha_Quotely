import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';
import '../../viewmodels/favorites_viewmodel.dart';
import 'widgets/favorites_header.dart';
import 'widgets/favorite_quote_card.dart';
import 'widgets/empty_favorites_view.dart';

class FavoritesScreen extends StatefulWidget {
  final FavoritesViewModel favoritesViewModel;

  const FavoritesScreen({super.key, required this.favoritesViewModel});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  FavoritesViewModel get _vm => widget.favoritesViewModel;

  @override
  void initState() {
    super.initState();
    _vm.addListener(_rebuild);
  }

  @override
  void dispose() {
    _vm.removeListener(_rebuild);
    super.dispose();
  }

  void _rebuild() => setState(() {});

  @override
  Widget build(BuildContext context) {
    final favorites = _vm.favorites;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: AppColors.favoritesGradient,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [

              FavoritesHeader(
                count:  _vm.count,
                onBack: () => Navigator.pop(context),
              ),

              Expanded(
                child: _vm.isEmpty
                    ? const EmptyFavoritesView()
                    : ListView.builder(
                        padding: const EdgeInsets.fromLTRB(24, 8, 24, 24),
                        itemCount: favorites.length,
                        itemBuilder: (_, i) => FavoriteQuoteCard(
                          quote:    favorites[i],
                          onRemove: () => _vm.remove(favorites[i]),
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
