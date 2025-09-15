import 'package:crm_app/core/extensions/num_extension.dart';
import 'package:crm_app/core/extensions/string_to_icon.dart';
import 'package:crm_app/core/static/icons.dart';
import 'package:crm_app/core/translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class CalendarWidget extends StatefulWidget {
  const CalendarWidget({super.key});

  @override
  State<CalendarWidget> createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  int selectedMonth = 8; // August
  int selectedDay = 6; // Friday 06

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFFE92929),
            Color(0xFFD41E1E),
          ],
        ),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        children: [
          // Month navigation
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {
                  setState(() {
                    selectedMonth = selectedMonth > 1 ? selectedMonth - 1 : 12;
                  });
                },
                icon: const Icon(Icons.chevron_left, color: Colors.white),
              ),
              Text(
                _getMonthName(selectedMonth),
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    selectedMonth = selectedMonth < 12 ? selectedMonth + 1 : 1;
                  });
                },
                icon: const Icon(Icons.chevron_right, color: Colors.white),
              ),
            ],
          ),

          20.gap,

          // Week days
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: ['M', 'T', 'F', 'S', 'S', 'M']
                .map((day) => Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: day == 'F' ? Colors.white : Colors.transparent,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Text(
                          day,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: day == 'F' ? const Color(0xFFE92929) : Colors.white,
                          ),
                        ),
                      ),
                    ))
                .toList(),
          ),

          12.gap,

          // Day numbers
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: ['06', '06', '06', '06', '06', '06']
                .asMap()
                .entries
                .map((entry) => Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: entry.key == 2 ? Colors.white : Colors.transparent,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Text(
                          entry.value,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: entry.key == 2 ? const Color(0xFFE92929) : Colors.white,
                          ),
                        ),
                      ),
                    ))
                .toList(),
          ),

          24.gap,

          // Meeting card
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.15),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.white.withOpacity(0.2)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      LocaleKeys.meeting_name.tr(),
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          AppIcons.editIc.icon(color: Colors.white,),
                          4.gap,
                          Text(
                            LocaleKeys.edit.tr(),
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                8.gap,

                Text(
                  'Our goal is to grow meeting with intent to be comfortable.',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white.withOpacity(0.8),
                  ),
                ),

                16.gap,

                Row(
                  children: [
                    // Profile images
                    Stack(
                      children: [
                        CircleAvatar(
                          radius: 16,
                          backgroundColor: Colors.white,
                          child: CircleAvatar(
                            radius: 14,
                            backgroundImage: NetworkImage('https://via.placeholder.com/32'),
                          ),
                        ),
                      ],
                    ),

                    8.gap,

                    // Meeting details
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Mohamed Yasser',
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            'Jan 23, 2024 | 10:00',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.white.withOpacity(0.7),
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Participant count
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Stack(
                            children: [
                              CircleAvatar(radius: 8, backgroundImage: NetworkImage('https://via.placeholder.com/16')),
                              Positioned(
                                left: 12,
                                child: CircleAvatar(radius: 8, backgroundImage: NetworkImage('https://via.placeholder.com/16')),
                              ),
                              Positioned(
                                left: 24,
                                child: CircleAvatar(radius: 8, backgroundImage: NetworkImage('https://via.placeholder.com/16')),
                              ),
                            ],
                          ),
                          8.gap,
                          Text(
                            '+1',
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _getMonthName(int month) {
    const months = [
      'January', 'February', 'March', 'April', 'May', 'June',
      'July', 'August', 'September', 'October', 'November', 'December'
    ];
    return months[month - 1];
  }
}
