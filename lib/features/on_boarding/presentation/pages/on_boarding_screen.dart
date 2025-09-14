import 'package:crm_app/config/routes/routes.dart';
import 'package:crm_app/core/extensions/num_extension.dart';
import 'package:crm_app/core/extensions/txt_theme.dart';
import 'package:crm_app/core/preferences/shared_pref.dart';
import 'package:crm_app/core/services/di.dart';
import 'package:crm_app/core/static/app_assets.dart';
import 'package:crm_app/core/static/icons.dart';
import 'package:crm_app/core/translations/locale_keys.g.dart';
import 'package:crm_app/core/utils/dialogs/languages_bottom_sheet.dart';
import 'package:crm_app/core/utils/widgets/buttons/custom_elevated_button.dart';
import 'package:crm_app/features/on_boarding/presentation/widgets/custom_page_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

/// OnBoarding screen with language selection
class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _pageController = PageController();
  final CrmAppPreferences preferences = sl<CrmAppPreferences>();

  int _currentPage = 0;

  final List<String> _images = [AppImages.onBoarding1, AppImages.onBoarding2, AppImages.onBoarding3];

  @override
  void initState() {
    super.initState();
    _setupPageController();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // This will be called whenever the locale changes
    if (mounted) {
      setState(() {
        // Force rebuild when locale changes
      });
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _setupPageController() {
    _pageController.addListener(() {
      if (_pageController.hasClients) {
        setState(() {
          _currentPage = _pageController.page!.round();
        });
      }
    });
  }

  void _showLanguageDropdown() {
    showLanguageBottomSheet(context);
  }

  String _getSelectedLanguageFlag() {
    switch (context.locale.languageCode) {
      case 'ar':
        return AppIcons.ar;
      case 'en':
      default:
        return AppIcons.en;
    }
  }

  void _handleNextButton() {
    if (_currentPage < 2) {
      _pageController.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
    } else {
      _completeOnBoarding(Routes.login);
    }
  }

  void _handleSkip() {
    _completeOnBoarding(Routes.login);
  }

  void _handleCreateAccount() {
    _completeOnBoarding(Routes.login);
  }

  void _completeOnBoarding(String route) {
    try {
      preferences.setOnBoardingCompleted();
      if (mounted) {
        context.pushReplacement(route);
      }
    } catch (error) {
      debugPrint('Error completing onboarding: $error');
    }
  }

  void _navigateToPage(int index) {
    _pageController.animateToPage(index, duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Full screen image background
          _buildFullScreenImageBackground(),

          // Content overlay
          _buildContentOverlay(),
        ],
      ),
    );
  }

  Widget _buildFullScreenImageBackground() {
    return Positioned.fill(
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 800),
        switchInCurve: Curves.easeInOut,
        switchOutCurve: Curves.easeInOut,
        transitionBuilder: (Widget child, Animation<double> animation) {
          return FadeTransition(
            opacity: animation,
            child: ScaleTransition(
              scale: Tween<double>(
                begin: 1.1, // Start slightly larger (zoom in effect)
                end: 1.0, // End at normal size
              ).animate(CurvedAnimation(parent: animation, curve: Curves.easeOut)),
              child: child,
            ),
          );
        },
        child: SizedBox(
          key: ValueKey(_currentPage),
          width: double.infinity,
          height: double.infinity,
          child: Image.asset(
            _images[_currentPage],
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
            // Add these properties to ensure no borders and better quality
            filterQuality: FilterQuality.high,
            isAntiAlias: true,
          ),
        ),
      ),
    );
  }

  Widget _buildContentOverlay() {
    return SafeArea(
      child: Column(
        children: [
          // Language selector at top
          _buildTopLanguageBar(),

          // Spacer to push content to bottom
          const Spacer(),

          // Content section at bottom
          _buildBottomContent(),
        ],
      ),
    );
  }

  Widget _buildTopLanguageBar() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Skip button
          GestureDetector(
            onTap: _handleSkip,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(color: Colors.black.withOpacity(0.3), borderRadius: BorderRadius.circular(20)),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    LocaleKeys.skip.tr(),
                    style: context.textTheme.bodyLarge!.copyWith(color: Colors.white, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(width: 4),
                  const Icon(Icons.arrow_forward_ios_rounded, color: Colors.white, size: 16),
                ],
              ),
            ),
          ),
          // Language selector
          _buildLanguageSelector(),
        ],
      ),
    );
  }

  Widget _buildBottomContent() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [
            Colors.black.withOpacity(0.8),
            Colors.black.withOpacity(0.6),
            Colors.black.withOpacity(0.3),
            Colors.transparent,
          ],
          stops: const [0.0, 0.4, 0.7, 1.0],
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Page content
          _buildPageContent(),

          // const SizedBox(height: 24),

          // Page indicators
          // _buildPageIndicators(),
          // const SizedBox(height: 32),

          // Action buttons
          // _buildActionButtons(),
          // const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildLanguageSelector() {
    return GestureDetector(
      onTap: _showLanguageDropdown,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.9),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.withOpacity(0.3), width: 1),
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 4, offset: const Offset(0, 2))],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Flag
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.grey.withOpacity(0.3)),
              ),
              child: ClipOval(
                child: SvgPicture.asset(
                  _getSelectedLanguageFlag(),
                  fit: BoxFit.cover,
                  placeholderBuilder: (context) => Container(color: Colors.grey.withOpacity(0.3)),
                ),
              ),
            ),
            const SizedBox(width: 8),

            // Language code
            Text(
              context.locale.languageCode.toUpperCase(),
              style: const TextStyle(color: Colors.black87, fontSize: 12, fontWeight: FontWeight.w500),
            ),
            const SizedBox(width: 4),

            // Dropdown arrow
            const Icon(Icons.keyboard_arrow_down, color: Colors.black54, size: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildPageContent() {
    return Container(
      constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.7),
      child: CustomPageView(currentPage: _currentPage, pageController: _pageController, buttons: _buildActionButtons()),
    );
  }

  Widget _buildPageIndicators() {
    return AnimatedSmoothIndicator(
      activeIndex: _currentPage,
      count: 3,
      effect: const ExpandingDotsEffect(
        activeDotColor: Colors.white,
        dotColor: Colors.white54,
        dotHeight: 10,
        dotWidth: 10,
      ),
      onDotClicked: _navigateToPage,
    );
  }

  Widget _buildActionButtons() {
    return Column(
      children: [
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          transitionBuilder: (Widget child, Animation<double> animation) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0.0, 0.5), // Slide up from bottom
                end: Offset.zero,
              ).animate(CurvedAnimation(parent: animation, curve: Curves.easeOutBack)),
              child: FadeTransition(opacity: animation, child: child),
            );
          },
          child: _currentPage == 2
              ? CustomElevatedButton(
                  key: const ValueKey('create_account_button'),
                  heroTag: 'login',
                  // backgroundColor: Colors.pr,
                  title: LocaleKeys.login.tr(),
                  // textColor: Colors.black,
                  onPressed: _handleCreateAccount,
                )
              : const SizedBox.shrink(key: ValueKey('empty_button')),
        ),
        20.gap,

        // Create account button
        CustomElevatedButton(
          heroTag: 'next',
          // isFilled: false,
          backgroundColor: Colors.white,
          title: LocaleKeys.next.tr(),
          textColor: Colors.black,
          onPressed: _handleNextButton,
        ),
      ],
    );
  }
}
