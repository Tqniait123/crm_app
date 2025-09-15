import 'package:crm_app/core/extensions/num_extension.dart';
import 'package:crm_app/core/extensions/string_extensions.dart';
import 'package:crm_app/core/static/app_assets.dart';
import 'package:crm_app/core/translations/locale_keys.g.dart';
import 'package:crm_app/features/home/presentation/widgets/custom_charts.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

// Total Leads Card (Dark Theme)
class TotalLeadsCard extends StatelessWidget {
  const TotalLeadsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        // Outer shadow for blur effect
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF061D3D).withOpacity(0.35),
            blurRadius: 30,
            offset: const Offset(0, 19),
            spreadRadius: -14,
          ),
        ],
      ),
      child: Container(
        // padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: const Alignment(-0.8, -0.8),
            end: const Alignment(0.8, 0.8),
            colors: [
              const Color(0xFFE92929).withOpacity(0.2),
              const Color(0xFFE92929).withOpacity(0.10288),
              Colors.transparent,
            ],
            stops: const [0.0239, 0.3339, 0.6623],
          ),
          borderRadius: BorderRadius.circular(18),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xFF0B0B26).withOpacity(0.95),
            borderRadius: BorderRadius.circular(18),
          ),
          padding: const EdgeInsets.all(18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header with icon and title
              Row(
                children: [
                  Container(
                    // width: 25.36,
                    // height: 25.36,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.08),
                      borderRadius: BorderRadius.circular(13),
                    ),
                    child: Center(child: AppImages.leads.toImage()),
                  ),
                  8.gap,
                  Expanded(
                    child: Text(
                      LocaleKeys.total_leads.tr(),
                      style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: Colors.white),
                    ),
                  ),
                  // const Spacer(),
                  // Add button
                  Container(
                    // width: 31.21,
                    // height: 31.21,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.12),
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [BoxShadow(color: const Color(0xFF495A2A).withOpacity(0.05), blurRadius: 50)],
                    ),
                    child: Center(
                      child: Container(
                        width: 19.51,
                        height: 19.51,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(11),
                          boxShadow: [
                            BoxShadow(color: Colors.black.withOpacity(0.08), offset: const Offset(4, 4), blurRadius: 5),
                          ],
                        ),
                        child: const Icon(Icons.add, size: 13, color: Color(0xFF142947)),
                      ),
                    ),
                  ),
                ],
              ),

              20.gap,

              // Value and subtitle
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '6.5',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                      letterSpacing: -0.02,
                    ),
                  ),
                  8.gap,
                  Padding(
                    padding: const EdgeInsets.only(bottom: 2),
                    child: Text(
                      'leads',
                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: Colors.white.withOpacity(0.6)),
                    ),
                  ),
                ],
              ),

              const Spacer(),

              // Bar Chart
              const LeadsBarChart(),
            ],
          ),
        ),
      ),
    );
  }
}
