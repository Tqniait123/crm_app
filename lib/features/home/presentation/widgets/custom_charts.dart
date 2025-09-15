import 'package:crm_app/core/extensions/num_extension.dart';
import 'package:flutter/material.dart';

// Leads Bar Chart Widget
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

// Properties Bottle Chart Widget
class PropertiesBottleChart extends StatelessWidget {
  const PropertiesBottleChart({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 47,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          // First bottle - full gradient
          Container(
            width: 28,
            height: 47,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFFEF7676), Color(0xFFE92929)],
              ),
              borderRadius: BorderRadius.circular(4),
            ),
          ),

          9.gap,

          // Second bottle - with inner fill
          Container(
            width: 28,
            height: 47,
            decoration: BoxDecoration(
              color: const Color(0xFFE92929).withOpacity(0.09),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: 21.58,
                height: 30.05,
                decoration: BoxDecoration(color: const Color(0xFFE92929), borderRadius: BorderRadius.circular(4)),
              ),
            ),
          ),

          9.gap,

          // Third bottle - mirrored with inner fill
          Container(
            width: 28,
            height: 47,
            decoration: BoxDecoration(
              color: const Color(0xFFE92929).withOpacity(0.09),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: 21.58,
                height: 30.05,
                decoration: BoxDecoration(color: const Color(0xFFE92929), borderRadius: BorderRadius.circular(4)),
              ),
            ),
          ),

          9.gap,

          // Fourth bottle - empty
          Container(
            width: 28,
            height: 47,
            decoration: BoxDecoration(
              color: const Color(0xFFE92929).withOpacity(0.09),
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        ],
      ),
    );
  }
}
