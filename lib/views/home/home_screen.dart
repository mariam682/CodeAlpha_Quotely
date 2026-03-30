import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/constants/app_colors.dart';
import '../../viewmodels/home_viewmodel.dart';
import '../../viewmodels/favorites_viewmodel.dart';
import '../favorites/favorites_screen.dart';
import 'widgets/background_orb.dart';
import 'widgets/home_header.dart';
import 'widgets/quote_card.dart';
import 'widgets/new_quote_button.dart';

class HomeScreen extends StatefulWidget {
  final HomeViewModel      homeViewModel;
  final FavoritesViewModel favoritesViewModel;

  const HomeScreen({
    super.key,
    required this.homeViewModel,
    required this.favoritesViewModel,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {

  HomeViewModel      get _homeVM => widget.homeViewModel;
  FavoritesViewModel get _favVM  => widget.favoritesViewModel;

  late final AnimationController _fadeCtrl;
  late final Animation<double>   _fadeAnim;

  late final AnimationController _heartCtrl;
  late final Animation<double>   _heartScale;

  @override
  void initState() {
    super.initState();

    _fadeCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 380),
    )..forward();
    _fadeAnim = CurvedAnimation(parent: _fadeCtrl, curve: Curves.easeInOut);

    _heartCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 320),
    );
    _heartScale = TweenSequence<double>([
      TweenSequenceItem(tween: Tween(begin: 1.0, end: 1.40), weight: 50),
      TweenSequenceItem(tween: Tween(begin: 1.4, end: 1.00), weight: 50),
    ]).animate(CurvedAnimation(parent: _heartCtrl, curve: Curves.easeInOut));

    _homeVM.addListener(_onHomeChanged);
    _favVM.addListener(_rebuild);
  }

  @override
  void dispose() {
    _homeVM.removeListener(_onHomeChanged);
    _favVM.removeListener(_rebuild);
    _fadeCtrl.dispose();
    _heartCtrl.dispose();
    super.dispose();
  }

  void _onHomeChanged() {
    if (_homeVM.isTransitioning) {
      _fadeCtrl.reverse();
    } else {
      _fadeCtrl.forward();
    }
    setState(() {});
  }

  void _rebuild() => setState(() {});

  void _onFavToggle() {
    HapticFeedback.lightImpact();
    _heartCtrl.forward(from: 0);
    _favVM.toggle(_homeVM.currentQuote);
  }

  void _onShare() {
    _homeVM.onShareTapped(() {
      final q = _homeVM.currentQuote;
      final preview = q.text.length > 48
          ? '${q.text.substring(0, 48)}…'
          : q.text;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('"$preview" — ${q.author}'),
          duration: const Duration(seconds: 2),
        ),
      );
    });
  }

  void _goToFavorites() {
    HapticFeedback.selectionClick();
    Navigator.push(
      context,
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 420),
        pageBuilder: (_, anim, __) => FadeTransition(
          opacity: anim,
          child: FavoritesScreen(favoritesViewModel: _favVM),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final quote    = _homeVM.currentQuote;
    final gradient = _homeVM.currentGradient;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 750),
      curve: Curves.easeInOut,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: gradient,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [

            const Positioned(
              top: -60, right: -60,
              child: BackgroundOrb(size: 280, color: AppColors.orbPurple),
            ),
            const Positioned(
              bottom: 80, left: -80,
              child: BackgroundOrb(size: 240, color: AppColors.orbBlue),
            ),

            SafeArea(
              child: Column(
                children: [

                  HomeHeader(
                    favoritesCount: _favVM.count,
                    onFavoritesTap: _goToFavorites,
                  ),

                  const Spacer(),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: FadeTransition(
                      opacity: _fadeAnim,
                      child: QuoteCard(
                        quote:               quote,
                        isFavorite:          _favVM.isFavorite(quote),
                        heartScaleAnimation: _heartScale,
                        onFavoriteToggle:    _onFavToggle,
                        onShare:             _onShare,
                      ),
                    ),
                  ),

                  const Spacer(),

                  NewQuoteButton(onTap: _homeVM.loadNextQuote),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
