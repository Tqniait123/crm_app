import 'package:crm_app/core/extensions/num_extension.dart';
import 'package:crm_app/core/extensions/string_to_icon.dart';
import 'package:crm_app/core/static/icons.dart';
import 'package:crm_app/core/theme/colors.dart';
import 'package:crm_app/core/translations/locale_keys.g.dart';
import 'package:crm_app/core/utils/widgets/buttons/custom_icon_button.dart';
import 'package:crm_app/core/utils/widgets/buttons/notifications_button.dart';
import 'package:crm_app/core/utils/widgets/inputs/custom_form_field.dart';
import 'package:crm_app/features/home/presentation/widgets/current_leads_section.dart';
import 'package:crm_app/features/home/presentation/widgets/custom_app_bar.dart';
import 'package:crm_app/features/leads/presentation/widgets/custom_toggle_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class LeadsScreen extends StatefulWidget {
  const LeadsScreen({super.key});

  @override
  State<LeadsScreen> createState() => _LeadsScreenState();
}

class _LeadsScreenState extends State<LeadsScreen> {
  bool isGridSelected = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          // Pinned Custom App Bar
          CustomAppBar.custom(
            customContent: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomIconButton(
                  color: AppColors.white,
                  iconAsset: AppIcons.plusIc,
                  onPressed: () {},
                  buttonType: ButtonType.withAngel,
                ),
                Text(
                  LocaleKeys.leads.tr(),
                  style: const TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
                ),
                NotificationButton(onNotificationTap: () {}, notificationCount: 7),
              ],
            ),
          ),
          22.gap,

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
                      10.gap,
                      CustomToggleButton.gridTable(
                        isGridSelected: isGridSelected,
                        onToggle: (isGrid) {
                          setState(() {
                            isGridSelected = isGrid;
                          });
                          // Handle your logic here
                          if (isGrid) {
                            // Show grid view
                          } else {
                            // Show table view
                          }
                        },
                      ),
                    ],
                  ),
                  const CurrentLeadsSection(withTitle: false),
                  100.gap, // Bottom padding for navigation
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
