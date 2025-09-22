import 'package:crm_app/core/extensions/string_to_icon.dart';
import 'package:crm_app/core/static/icons.dart';
import 'package:crm_app/core/translations/locale_keys.g.dart';
import 'package:crm_app/core/utils/widgets/inputs/custom_form_field.dart';
import 'package:crm_app/features/home/presentation/widgets/custom_app_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class LeadsScreen extends StatelessWidget {
  const LeadsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                  Row(
                    children: [
                      // Search container
                      Expanded(
                        child: CustomTextFormField(
                          controller: TextEditingController(),
                          hint: LocaleKeys.search.tr(),
                          margin: 0,
                          prefixIC: AppIcons.searchIc.icon(),
                          suffixIC: Container(
                            width: 40,
                            height: 40,
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Color(0xffE79393),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: AppIcons.filterIc.icon(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),

      // bottomNavigationBar: const CustomBottomNavigation(),
    );
  }
}
