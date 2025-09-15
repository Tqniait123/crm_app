import 'package:crm_app/core/extensions/string_to_icon.dart';
import 'package:crm_app/core/static/icons.dart';
import 'package:crm_app/core/translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class CustomBottomNavigation extends StatefulWidget {
  const CustomBottomNavigation({super.key});

  @override
  State<CustomBottomNavigation> createState() => _CustomBottomNavigationState();
}

class _CustomBottomNavigationState extends State<CustomBottomNavigation> {
  int selectedIndex = 0;

  final List<BottomNavItem> navItems = [
    BottomNavItem(
      icon: AppIcons.homeIc,
      label: LocaleKeys.home.tr(),
    ),
    BottomNavItem(
      icon: AppIcons.leadsIc,
      label: LocaleKeys.leads.tr(),
    ),
    BottomNavItem(
      icon: AppIcons.meetingIc,
      label: LocaleKeys.meeting.tr(),
    ),
    BottomNavItem(
      icon: AppIcons.profileIc,
      label: LocaleKeys.profile.tr(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: navItems.asMap().entries.map((entry) {
              final index = entry.key;
              final item = entry.value;
              final isSelected = selectedIndex == index;

              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                behavior: HitTestBehavior.opaque,
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Icon container
                      Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          gradient: isSelected
                              ? const LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Color(0xFFEF7676),
                                    Color(0xFFE92929),
                                  ],
                                )
                              : null,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Center(
                          child: item.icon.icon(
                            color: isSelected ? Colors.white : Colors.grey[400],
                          
                          ),
                        ),
                      ),

                      const SizedBox(height: 4),

                      // Label
                      Text(
                        item.label,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: isSelected ? const Color(0xFFE92929) : Colors.grey[400],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

class BottomNavItem {
  final String icon;
  final String label;

  BottomNavItem({
    required this.icon,
    required this.label,
  });
}
