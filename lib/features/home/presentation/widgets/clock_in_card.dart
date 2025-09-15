import 'package:crm_app/core/extensions/flipped_for_lcale.dart';
import 'package:crm_app/core/extensions/num_extension.dart';
import 'package:crm_app/core/extensions/string_to_icon.dart';
import 'package:crm_app/core/extensions/text_style_extension.dart';
import 'package:crm_app/core/extensions/theme_extension.dart';
import 'package:crm_app/core/static/icons.dart';
import 'package:crm_app/core/translations/locale_keys.g.dart';
import 'package:crm_app/core/utils/widgets/inputs/custom_form_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ClockInCard extends StatelessWidget {
  const ClockInCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [const Color(0xFFE92929).withAlpha(70), const Color(0xFFE92929).withAlpha(0)],
        ),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Timer display
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('00:01:10', style: context.titleLarge.bold.s40.copyWith(color: Colors.black)),
              ClockIconButton(),
            ],
          ),

          16.gap,

          // Status row
          Row(
            children: [
              AppIcons.timerOutIc.icon().flippedForLocale(context),
              8.gap,
              Text(
                LocaleKeys.you_are_clocked_in.tr(),
                style: TextStyle(fontSize: 16, color: Colors.grey, fontWeight: FontWeight.w500),
              ),
            ],
          ),

          24.gap,

          // Bottom row with search and clock out
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
                    decoration: BoxDecoration(color: Color(0xffE79393), borderRadius: BorderRadius.circular(10)),
                    child: AppIcons.filterIc.icon(),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ClockIconButton extends StatelessWidget {
  final String dateText;
  final VoidCallback? onTap;

  const ClockIconButton({super.key, this.dateText = 'clock out', this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
        decoration: BoxDecoration(
          gradient: RadialGradient(
            center: Alignment.center,
            radius: 0.5,
            colors: [Colors.white.withOpacity(0.7), Colors.white.withOpacity(0.7)],
          ),
          border: Border.all(color: const Color(0xFFF5F5F5), width: 2),
          borderRadius: BorderRadius.circular(19),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Power button container
            Container(
              padding: const EdgeInsets.all(9),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xFFEF7676), Color(0xFFE92929)],
                ),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.white.withOpacity(0.3), width: 2.51121),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFFE92929).withOpacity(0.44),
                    offset: const Offset(0, 5.02242),
                    blurRadius: 13.3931,
                  ),
                ],
              ),
              child: AppIcons.powerIc.icon(),
            ),

            16.gap,

            // Date text
            Text(
              dateText,
              style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w500, height: 1.5, color: Color(0xFF040415)),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
