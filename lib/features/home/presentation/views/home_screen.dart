import 'package:crm_app/core/extensions/flipped_for_lcale.dart';
import 'package:crm_app/core/extensions/num_extension.dart';
import 'package:crm_app/core/extensions/string_to_icon.dart';
import 'package:crm_app/core/extensions/text_style_extension.dart';
import 'package:crm_app/core/extensions/theme_extension.dart';
import 'package:crm_app/core/static/icons.dart';
import 'package:crm_app/core/translations/locale_keys.g.dart';
import 'package:crm_app/core/utils/widgets/inputs/custom_form_field.dart';
import 'package:crm_app/core/widgets/custom_scaffold.dart';
import 'package:crm_app/features/home/presentation/widgets/custom_app_bar.dart';
import 'package:crm_app/features/home/presentation/widgets/clock_in_card.dart';
import 'package:crm_app/features/home/presentation/widgets/statistics_grid.dart';
import 'package:crm_app/features/home/presentation/widgets/calendar_widget.dart';
import 'package:crm_app/features/home/presentation/widgets/current_leads_section.dart';
import 'package:crm_app/features/home/presentation/widgets/bottom_navigation.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Pinned Custom App Bar
            CustomAppBar(
              notificationCount: 6,
              onLocationTap: () {
                print("Location tapped");
              },
              onNotificationTap: () {
                print("Notification tapped");
              },
              onProfileTap: () {
                print("Profile tapped");
              },
            ),

            // Scrollable content
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const ClockInCard(),
                    24.gap,
                    const StatisticsGrid(),
                    24.gap,
                    const CalendarWidget(),
                    24.gap,
                    const CurrentLeadsSection(),
                    100.gap, // Bottom padding for navigation
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomNavigation(),
    );
  }
}
