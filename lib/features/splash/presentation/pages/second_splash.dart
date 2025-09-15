import 'package:crm_app/config/routes/routes.dart';
import 'package:crm_app/core/extensions/txt_theme.dart';
import 'package:crm_app/core/preferences/shared_pref.dart';
import 'package:crm_app/core/services/di.dart';
import 'package:crm_app/core/theme/colors.dart';
import 'package:crm_app/core/translations/locale_keys.g.dart';
import 'package:crm_app/core/utils/widgets/logo_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SecondSplashScreen extends StatefulWidget {
  const SecondSplashScreen({super.key});

  @override
  State<SecondSplashScreen> createState() => _SecondSplashScreenState();
}

class _SecondSplashScreenState extends State<SecondSplashScreen> with TickerProviderStateMixin {
  late AnimationController _fadeController;
  late AnimationController _positionController;
  late AnimationController _logoFadeController;
  late AnimationController _progressController; // New controller for progress
  late AnimationController _welcomeController; // New controller for welcome message
  late Animation<double> _fadeAnimation;
  late Animation<double> _positionAnimation;
  late Animation<double> _logoFadeAnimation;
  late Animation<double> _progressAnimation; // New animation for progress
  late Animation<double> _welcomeAnimation; // New animation for welcome message

  @override
  void initState() {
    super.initState();

    // Setup fade animation for welcome message
    _fadeController = AnimationController(duration: const Duration(milliseconds: 800), vsync: this);
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(_fadeController);

    // Setup fade animation for logo
    _logoFadeController = AnimationController(duration: const Duration(milliseconds: 800), vsync: this);
    _logoFadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(_logoFadeController);

    // Setup position animation for logo - match duration with fade animation
    _positionController = AnimationController(
      duration: const Duration(milliseconds: 800), // Match fade duration
      vsync: this,
    );
    _positionAnimation = Tween<double>(
      begin: 0.0,
      end: -20.0,
    ).animate(CurvedAnimation(parent: _positionController, curve: Curves.easeOut));

    // Setup progress animation - from 0 to 1 (0% to 100%)
    _progressController = AnimationController(
      duration: const Duration(seconds: 2), // 2 seconds to complete
      vsync: this,
    );
    _progressAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _progressController, curve: Curves.easeInOut));

    // Setup welcome message animation
    _welcomeController = AnimationController(
      duration: const Duration(milliseconds: 600), // 600ms fade in
      vsync: this,
    );
    _welcomeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _welcomeController, curve: Curves.easeIn));

    _startAnimationSequence();
  }

  void _startAnimationSequence() async {
    // Wait for initial delay
    await Future.delayed(const Duration(milliseconds: 500));

    // Start logo fade animation
    _logoFadeController.forward();

    // Wait for logo animation to complete, then show welcome message
    await Future.delayed(const Duration(milliseconds: 800));

    // Start welcome message animation
    _welcomeController.forward();

    // Wait another second before starting other animations
    await Future.delayed(const Duration(milliseconds: 500));

    // Start fade, position, and progress animations simultaneously
    _fadeController.forward();
    _positionController.forward();
    _progressController.forward(); // Start progress animation

    // Wait for progress animation to complete (2 seconds) + a bit more
    await Future.delayed(const Duration(milliseconds: 2500));

    if (mounted) {
      await _handleNavigation();
    }
  }

  Future<void> _handleNavigation() async {
    final pref = CrmAppPreferences(sl());
    final bool isOnBoardingCompleted = pref.isOnBoardingCompleted();

    if (!isOnBoardingCompleted) {
      // Navigate to onboarding if not completed
      context.go(Routes.onBoarding1);
    } else {
      // Always navigate to login screen
      context.go(Routes.login);
    }
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _positionController.dispose();
    _logoFadeController.dispose();
    _progressController.dispose(); // Dispose progress controller
    _welcomeController.dispose(); // Dispose welcome controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Stack(
        fit: StackFit.expand,
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Animated logo with position change and fade
                LogoWidget(type: LogoType.wide),
                const SizedBox(height: 20), // Space between logo and welcome message
                // Welcome message with fade animation
                FadeTransition(
                  opacity: _welcomeAnimation,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      LocaleKeys.welcome_to_must_invest.tr(),
                      style: context.textTheme.bodyMedium!.copyWith(color: AppColors.primary),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
