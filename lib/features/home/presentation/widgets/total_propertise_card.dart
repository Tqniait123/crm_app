import 'package:crm_app/core/extensions/num_extension.dart';
import 'package:crm_app/core/extensions/string_extensions.dart';
import 'package:crm_app/core/static/app_assets.dart';
import 'package:crm_app/core/translations/locale_keys.g.dart';
import 'package:crm_app/features/home/presentation/widgets/custom_charts.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

// Total Properties Card
class TotalPropertiesCard extends StatelessWidget {
  const TotalPropertiesCard({super.key});

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
                child: Center(child: AppImages.properties.toImage()),
              ),
              8.gap,
              Expanded(
                child: Text(
                  LocaleKeys.total_properties.tr(),
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

          // Value and subtitle
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '3.5',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF061D3D),
                  letterSpacing: -0.02,
                ),
              ),
              8.gap,
              Padding(
                padding: const EdgeInsets.only(bottom: 2),
                child: Text(
                  'properties',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFF061D3D).withOpacity(0.6),
                  ),
                ),
              ),
            ],
          ),

          const Spacer(),

          // Bottle Charts
          const PropertiesBottleChart(),
        ],
      ),
    );
  }
}
