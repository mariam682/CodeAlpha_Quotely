import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';
import '../../core/constants/app_text_styles.dart';
import '../../viewmodels/welcome_viewmodel.dart';
import '../../viewmodels/home_viewmodel.dart';
import '../../viewmodels/favorites_viewmodel.dart';
import '../home/home_screen.dart';
import 'widgets/quote_logo.dart';
import 'widgets/preview_card.dart';
import 'widgets/feature_icon_item.dart';
import 'widgets/get_started_button.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {

  final _vm = WelcomeViewModel();

  late final AnimationController _fadeCtrl;
  late final Animation<double>   _fadeAnim;

  @override
  void initState() {
    super.initState();
    _fadeCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );
    _fadeAnim = CurvedAnimation(parent: _fadeCtrl, curve: Curves.easeOut);
    _fadeCtrl.forward();
  }

  @override
  void dispose() {
    _fadeCtrl.dispose();
    super.dispose();
  }

  void _goToHome() {
    _vm.onGetStartedTapped(() {
      Navigator.of(context).push(
        PageRouteBuilder(
          transitionDuration: const Duration(milliseconds: 650),
          pageBuilder: (_, animation, __) => FadeTransition(
            opacity: animation,
            child: HomeScreen(
              homeViewModel:      HomeViewModel(),
              favoritesViewModel: FavoritesViewModel(),
            ),
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final previews = _vm.previewQuotes;

    return Scaffold(

      backgroundColor: AppColors.welcomeGradient.last,
      body: Container(

        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: AppColors.welcomeGradient,
          ),
        ),
        child: SafeArea(

          bottom: false,
          child: FadeTransition(
            opacity: _fadeAnim,
            child: SingleChildScrollView(
              padding: EdgeInsets.fromLTRB(
                28, 0, 28,
                MediaQuery.of(context).padding.bottom + 8,
              ),
              child: Column(
                children: [
                  const SizedBox(height: 44),

                  const QuoteLogo(size: 72),
                  const SizedBox(height: 22),

                  const Text('Quotely', style: AppTextStyles.welcomeTitle),
                  const SizedBox(height: 10),

                  const Text(
                    'A daily dose of wisdom\nto inspire your journey',
                    textAlign: TextAlign.center,
                    style: AppTextStyles.tagline,
                  ),
                  const SizedBox(height: 38),

                  PreviewCard(quote: previews[0], opacity: 1.00, scale: 1.00),
                  PreviewCard(quote: previews[1], opacity: 0.72, scale: 0.97),
                  PreviewCard(quote: previews[2], opacity: 0.45, scale: 0.94),
                  const SizedBox(height: 26),

                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      FeatureIconItem(icon: Icons.refresh_rounded,         label: 'Random Quotes'),
                      FeatureIconItem(icon: Icons.favorite_border_rounded, label: 'Save Favorites'),
                      FeatureIconItem(icon: Icons.share_outlined,          label: 'Share Wisdom'),
                    ],
                  ),
                  const SizedBox(height: 30),

                  GetStartedButton(onTap: _goToHome),
                  const SizedBox(height: 28),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
