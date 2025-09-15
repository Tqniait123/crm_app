import 'package:crm_app/core/extensions/num_extension.dart';
import 'package:crm_app/core/extensions/string_extensions.dart';
import 'package:crm_app/core/static/app_assets.dart';
import 'package:crm_app/core/translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

// Total Project Card
class TotalProjectCard extends StatelessWidget {
  const TotalProjectCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(color: const Color(0xFFE92929).withOpacity(0.18), blurRadius: 100, offset: const Offset(0, 0)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header with icon and title
          Row(
            children: [
              Container(
                width: 25.36,
                height: 25.36,
                decoration: BoxDecoration(
                  color: const Color(0xFF061D3D).withOpacity(0.04),
                  borderRadius: BorderRadius.circular(13),
                ),
                child: Center(child: AppImages.project.toImage()),
              ),
              8.gap,
              Expanded(
                child: Text(
                  LocaleKeys.total_project.tr(),
                  style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: Color(0xFF061D3D)),
                ),
              ),
              // Three dots menu
              Container(
                width: 15.61,
                height: 15.61,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
                child: Icon(Icons.more_horiz, size: 15, color: const Color(0xFF061D3D).withOpacity(0.25)),
              ),
            ],
          ),

          20.gap,

          // Main value
          Text(
            '7,937',
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Color(0xFF061D3D),
              letterSpacing: -0.02,
            ),
          ),

          const Spacer(),

          // Progress bar
          Container(
            height: 12,
            decoration: BoxDecoration(
              color: const Color(0xFFE92929).withOpacity(0.09),
              borderRadius: BorderRadius.circular(11.5),
            ),
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color(0xFFE92929).withOpacity(0.09),
                    borderRadius: BorderRadius.circular(11.5),
                  ),
                ),
                FractionallySizedBox(
                  alignment: Alignment.centerLeft,
                  widthFactor: 0.587, // 79.92/136.05 ≈ 0.587
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFE92929),
                      borderRadius: BorderRadius.circular(11.5),
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
