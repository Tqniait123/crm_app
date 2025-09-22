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

// Lead model to hold data
class Lead {
  final String projectName;
  final String zone;
  final String area;
  final String unitType;
  final String status;

  Lead({
    required this.projectName,
    required this.zone,
    required this.area,
    required this.unitType,
    required this.status,
  });
}

class LeadsTableView extends StatelessWidget {
  final List<Lead> leads;

  const LeadsTableView({super.key, required this.leads});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 2))],
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Column(
          children: [
            // Table Header
            Container(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.grey.shade50,
                borderRadius: const BorderRadius.only(topLeft: Radius.circular(12), topRight: Radius.circular(12)),
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: 150,
                    child: Text(
                      'اسم المشروع',
                      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14, color: Colors.grey.shade700),
                    ),
                  ),
                  SizedBox(
                    width: 120,
                    child: Text(
                      'المنطقة',
                      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14, color: Colors.grey.shade700),
                    ),
                  ),
                  SizedBox(
                    width: 100,
                    child: Text(
                      'المساحة',
                      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14, color: Colors.grey.shade700),
                    ),
                  ),
                  SizedBox(
                    width: 120,
                    child: Text(
                      'نوع الوحدة',
                      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14, color: Colors.grey.shade700),
                    ),
                  ),
                  SizedBox(
                    width: 110,
                    child: Text(
                      'الحالة',
                      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14, color: Colors.grey.shade700),
                    ),
                  ),
                ],
              ),
            ),
            // Table Rows
            ...leads.map((lead) => _buildTableRow(lead)),
          ],
        ),
      ),
    );
  }

  Widget _buildTableRow(Lead lead) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey.shade200, width: 1)),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 150,
            child: Text(
              lead.projectName,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black87),
            ),
          ),
          SizedBox(
            width: 120,
            child: Text(lead.zone, style: TextStyle(fontSize: 13, color: Colors.grey.shade600)),
          ),
          SizedBox(
            width: 100,
            child: Text(lead.area, style: TextStyle(fontSize: 13, color: Colors.grey.shade600)),
          ),
          SizedBox(
            width: 120,
            child: Text(lead.unitType, style: TextStyle(fontSize: 13, color: Colors.grey.shade600)),
          ),
          SizedBox(
            width: 110,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(color: Colors.green.shade100, borderRadius: BorderRadius.circular(16)),
              child: Text(
                lead.status,
                style: TextStyle(fontSize: 11, color: Colors.green.shade700, fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class LeadsScreen extends StatefulWidget {
  const LeadsScreen({super.key});

  @override
  State<LeadsScreen> createState() => _LeadsScreenState();
}

class _LeadsScreenState extends State<LeadsScreen> {
  bool isGridSelected = true;

  // Dummy Arabic data
  final List<Lead> dummyLeads = List.generate(
    8,
    (index) => Lead(
      projectName: 'مدينتي ${index + 1}',
      zone: 'القاهرة الجديدة',
      area: '${(index + 1) * 120} م²',
      unitType: 'شقة',
      status: 'مكتمل التشطيب',
    ),
  );

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
                        },
                      ),
                    ],
                  ),
                  20.gap,

                  // Animated view switcher
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    transitionBuilder: (Widget child, Animation<double> animation) {
                      return FadeTransition(opacity: animation, child: child);
                    },
                    child: isGridSelected
                        ? const CurrentLeadsSection(withTitle: false, key: Key('grid_view'))
                        : LeadsTableView(leads: dummyLeads, key: const Key('table_view')),
                  ),
                  100.gap, // Bottom padding for navigation
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
