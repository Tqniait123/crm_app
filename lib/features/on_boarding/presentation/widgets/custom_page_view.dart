import 'package:crm_app/core/extensions/txt_theme.dart';
import 'package:crm_app/core/theme/colors.dart';
import 'package:crm_app/core/translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomPageView extends StatelessWidget {
  const CustomPageView({
    super.key,
    required int currentPage,
    required PageController pageController,
    required Widget buttons, // Add buttons parameter
  }) : _currentPage = currentPage,
       _pageController = pageController,
       _buttons = buttons;

  final int _currentPage;
  final PageController _pageController;
  final Widget _buttons;

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> pages = [
      {"title": LocaleKeys.on_boarding_one_title.tr(), "description": LocaleKeys.on_boarding_one_subtitle.tr()},
      {"title": LocaleKeys.on_boarding_two_title.tr(), "description": LocaleKeys.on_boarding_two_subtitle.tr()},
      {"title": LocaleKeys.on_boarding_three_title.tr(), "description": LocaleKeys.on_boarding_three_subtitle.tr()},
    ];

    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Full screen PageView for content
        Expanded(
          child: PageView.builder(
            itemCount: pages.length,
            controller: _pageController,
            itemBuilder: (BuildContext context, int index) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start, // Align to start
                children: [
                  // const Spacer(),

                  // Title text - aligned to start
                  Text(
                    pages[index]["title"]!,
                    style: context.textTheme.bodyLarge!.copyWith(color: AppColors.white, fontSize: 25.r),
                    textAlign: TextAlign.start, // Changed from center to start
                  ),

                  SizedBox(height: 12.h),

                  // Description text - aligned to start
                  Text(
                    pages[index]["description"]!,
                    textAlign: TextAlign.start, // Changed from center to start
                    style: context.textTheme.bodySmall!.copyWith(color: AppColors.white.withValues(alpha: 0.5)),
                  ),
                  SizedBox(height: 30.h),
                ],
              ),
            ),
          ),
        ),

        // Buttons section at the bottom
        Padding(
          padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: MediaQuery.of(context).padding.bottom + 20.h),
          child: _buttons,
        ),
      ],
    );
  }
}
