import 'package:crm_app/core/extensions/num_extension.dart';
import 'package:crm_app/core/extensions/string_extensions.dart';
import 'package:crm_app/core/static/app_assets.dart';
import 'package:crm_app/core/translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class StatisticsGrid extends StatelessWidget {
  const StatisticsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      childAspectRatio: 1.0,
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      children: [
        StatisticCard(
          title: LocaleKeys.total_project.tr(),
          value: '7,937',
          icon: AppImages.project,
          color: const Color(0xFFE92929),
          backgroundColor: Colors.white,
        ),
        StatisticCard(
          title: LocaleKeys.total_leads.tr(),
          value: '6.5',
          subtitle: 'leads',
          icon: AppImages.leads,
          color: const Color(0xFFE92929),
          backgroundColor: const Color(0xFF0B0B26),
          textColor: Colors.white,
          hasChart: true,
          isLeadsCard: true,
        ),
        StatisticCard(
          title: LocaleKeys.total_properties.tr(),
          value: '3.5',
          subtitle: 'properties',
          icon: AppImages.properties,
          color: const Color(0xFFE92929),
          backgroundColor: Colors.white,
          hasBottleChart: true,
        ),
        StatisticCard(
          title: LocaleKeys.total_meeting.tr(),
          value: '135',
          icon: AppImages.meeting,
          color: const Color(0xFFE92929),
          backgroundColor: Colors.white,
        ),
      ],
    );
  }
}

class StatisticCard extends StatelessWidget {
  final String title;
  final String value;
  final String? subtitle;
  final String icon;
  final Color color;
  final Color backgroundColor;
  final Color textColor;
  final bool hasChart;
  final bool hasBottleChart;
  final bool isLeadsCard;

  const StatisticCard({
    super.key,
    required this.title,
    required this.value,
    this.subtitle,
    required this.icon,
    required this.color,
    required this.backgroundColor,
    this.textColor = Colors.black,
    this.hasChart = false,
    this.hasBottleChart = false,
    this.isLeadsCard = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isLeadsCard ? null : backgroundColor,
        gradient: isLeadsCard
            ? LinearGradient(
                begin: const Alignment(-0.8, -0.8),
                end: const Alignment(0.8, 0.8),
                colors: [
                  const Color(0xFFE92929).withOpacity(0.2),
                  const Color(0xFFE92929).withOpacity(0.10288),
                  Colors.transparent,
                ],
                stops: const [0.0239, 0.3339, 0.6623],
              )
            : null,
        borderRadius: BorderRadius.circular(18),
        boxShadow: isLeadsCard
            ? []
            : [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 2))],
      ),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: isLeadsCard
            ? BoxDecoration(color: const Color(0xFF0B0B26).withOpacity(0.95), borderRadius: BorderRadius.circular(18))
            : null,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title with icon
            Row(
              children: [
                if (isLeadsCard)
                  Container(
                    width: 25.36,
                    height: 25.36,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.08),
                      borderRadius: BorderRadius.circular(13),
                    ),
                    child: Center(child: icon.toImage()),
                  )
                else
                  icon.toImage(),

                (isLeadsCard ? 12 : 8).gap,

                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: isLeadsCard ? 12 : 14,
                      fontWeight: isLeadsCard ? FontWeight.w400 : FontWeight.w500,
                      color: isLeadsCard ? Colors.white : textColor.withOpacity(0.7),
                    ),
                  ),
                ),

                if (hasChart && isLeadsCard)
                  Container(
                    width: 31.21,
                    height: 31.21,
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
                  )
                else if (hasChart)
                  const AddButton(),
              ],
            ),

            const Spacer(),

            // Main value
            Text(
              value,
              style: TextStyle(
                fontSize: isLeadsCard ? 18 : 32,
                fontWeight: isLeadsCard ? FontWeight.w500 : FontWeight.bold,
                color: textColor,
                letterSpacing: isLeadsCard ? -0.02 : 0,
              ),
            ),

            if (subtitle != null) ...[
              4.gap,
              Text(
                subtitle!,
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: textColor.withOpacity(0.6)),
              ),
            ],

            const Spacer(),

            // Progress indicator or chart
            if (hasChart && isLeadsCard)
              const LeadsBarChart()
            else if (hasChart)
              const MiniBarChart()
            else if (hasBottleChart)
              const BottleChart()
            else
              Container(
                height: 4,
                decoration: BoxDecoration(color: color.withOpacity(0.2), borderRadius: BorderRadius.circular(2)),
                child: FractionallySizedBox(
                  widthFactor: 0.7,
                  child: Container(
                    decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(2)),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class LeadsBarChart extends StatelessWidget {
  const LeadsBarChart({super.key});

  @override
  Widget build(BuildContext context) {
    // Bar heights based on the CSS design
    final barHeights = [35.0, 58.0, 48.0, 59.0, 28.0, 74.0];

    return SizedBox(
      height: 74,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          for (int i = 0; i < barHeights.length; i++)
            Container(
              width: 18,
              height: barHeights[i],
              margin: const EdgeInsets.only(right: 6),
              decoration: BoxDecoration(
                color: i == barHeights.length - 1 ? const Color(0xFFE92929) : const Color(0xFFE92929).withOpacity(0.2),
                borderRadius: BorderRadius.circular(i == barHeights.length - 1 ? 11.5 : 10),
                boxShadow: [
                  BoxShadow(color: Colors.black.withOpacity(0.02), offset: const Offset(4, 4), blurRadius: 12),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

class AddButton extends StatelessWidget {
  const AddButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 24,
      height: 24,
      decoration: BoxDecoration(color: Colors.white.withOpacity(0.2), borderRadius: BorderRadius.circular(6)),
      child: const Icon(Icons.add, size: 16, color: Colors.white),
    );
  }
}

class MiniBarChart extends StatelessWidget {
  const MiniBarChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (int i = 0; i < 7; i++)
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(right: 2),
              height: 20 + (i * 4.0),
              decoration: BoxDecoration(
                color: i == 6 ? const Color(0xFFE92929) : Colors.grey.withOpacity(0.3),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
      ],
    );
  }
}

class BottleChart extends StatelessWidget {
  const BottleChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        _buildBottle(0.8, const Color(0xFFE92929)),
        _buildBottle(0.6, const Color(0xFFE92929).withOpacity(0.7)),
        _buildBottle(0.4, const Color(0xFFE92929).withOpacity(0.5)),
      ],
    );
  }

  Widget _buildBottle(double fillRatio, Color color) {
    return Container(
      width: 12,
      height: 24,
      decoration: BoxDecoration(color: Colors.grey.withOpacity(0.2), borderRadius: BorderRadius.circular(6)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            width: double.infinity,
            height: 24 * fillRatio,
            decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(6)),
          ),
        ],
      ),
    );
  }
}
