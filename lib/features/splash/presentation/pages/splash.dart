import 'package:crm_app/config/app_settings/cubit/settings_cubit.dart';
import 'package:crm_app/config/routes/routes.dart';
import 'package:crm_app/core/extensions/string_to_icon.dart';
import 'package:crm_app/core/preferences/shared_pref.dart';
import 'package:crm_app/core/services/di.dart';
import 'package:crm_app/core/static/icons.dart';
import 'package:crm_app/core/theme/colors.dart';
import 'package:crm_app/core/translations/locale_keys.g.dart';
import 'package:crm_app/core/utils/widgets/logo_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  late AnimationController _fadeController;
  late AnimationController _positionController;
  late AnimationController _logoFadeController;
  late AnimationController _progressController; // New controller for progress
  late Animation<double> _fadeAnimation;
  late Animation<double> _positionAnimation;
  late Animation<double> _logoFadeAnimation;
  late Animation<double> _progressAnimation; // New animation for progress
  bool _settingsLoaded = false;

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

    final settingsCubit = AppSettingsCubit.get(context);
    settingsCubit.getAppSettings().then((_) {
      if (settingsCubit.state is AppSettingsSuccessState) {
        _settingsLoaded = true;
        _startAnimationSequence();
      } else {
        _showRetryButton();
      }
    });
  }

  void _showRetryButton() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(LocaleKeys.error.tr()), // Generic error title
          content: Text(LocaleKeys.something_went_wrong.tr()), // Generic message
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                final settingsCubit = AppSettingsCubit.get(context);
                settingsCubit.getAppSettings().then((_) {
                  if (settingsCubit.state is AppSettingsSuccessState) {
                    _settingsLoaded = true;
                    _startAnimationSequence();
                  } else {
                    _showRetryButton(); // Retry if it fails again
                  }
                });
              },
              child: Text(LocaleKeys.retry.tr()),
            ),
          ],
        );
      },
    );
  }

  void _startAnimationSequence() async {
    // Wait for initial delay
    await Future.delayed(const Duration(milliseconds: 500));

    // Start logo fade animation
    _logoFadeController.forward();

    // Wait 1 second before showing welcome message and moving logo
    await Future.delayed(const Duration(seconds: 1));

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
      context.go(Routes.secondSplash);
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
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.splashBackground,
      body: Stack(
        fit: StackFit.expand,
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          Positioned(
            left: -300, // Shift pattern to the left
            child: Opacity(
              opacity: 0.3,
              child: AppIcons.splashPattern.svg(
                width: MediaQuery.sizeOf(context).width * 1.2,
                height: MediaQuery.sizeOf(context).height * 1.2,
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Centered logo
          Center(
            child: FadeTransition(
              opacity: _logoFadeAnimation,
              child: AnimatedBuilder(
                animation: _positionAnimation,
                builder: (context, child) {
                  return Transform.translate(offset: Offset(0, _positionAnimation.value), child: child);
                },
                child: LogoWidget(type: LogoType.svg),
              ),
            ),
          ),
          // Loading indicator at the bottom
          Positioned(
            bottom: 80,
            left: 0,
            right: 0,
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      border: Border.all(color: Color(0xffE3E3E3)),
                    ),
                    child: SizedBox(
                      width: 200,
                      child: AnimatedBuilder(
                        animation: _progressAnimation,
                        builder: (context, child) {
                          return Container(
                            height: 8,
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.white),
                            child: Stack(
                              children: [
                                Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white,
                                  ),
                                ),
                                FractionallySizedBox(
                                  widthFactor: _progressAnimation.value,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: const Color(0xFFE53E3E), // Red color
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    LocaleKeys.loading.tr(),
                    style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
