import 'dart:developer';

import 'package:crm_app/features/home/data/models/responses/meeting.dart';
import 'package:crm_app/features/home/presentation/widgets/calender_table_widget.dart';
import 'package:crm_app/features/home/presentation/widgets/meeting_custom_painter.dart';
import 'package:crm_app/features/home/presentation/widgets/meeting_list_widget.dart';
import 'package:crm_app/features/home/presentation/widgets/page_indicator_widget.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarWidget extends StatefulWidget {
  const CalendarWidget({super.key});

  @override
  State<CalendarWidget> createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  CalendarFormat _calendarFormat = CalendarFormat.week;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay = DateTime.now();
  final Map<DateTime, List<Meeting>> _meetings = {};
  int _currentMeetingPage = 0;

  @override
  void initState() {
    super.initState();
    _selectedDay = DateTime.now();
    _initializeSampleData();
  }

  void _initializeSampleData() {
    final today = DateTime.now();
    final normalizedToday = DateTime(today.year, today.month, today.day);
    final tomorrow = DateTime(today.year, today.month, today.day + 1);
    final dayAfter = DateTime(today.year, today.month, today.day + 2);

    _meetings[normalizedToday] = [
      Meeting(
        title: "اجتماع الفريق اليومي",
        description: "الاجتماع اليومي لمناقشة التقدم، التحديات، وخطة اليوم.",
        organizer: "محمد ياسر",
        dateTime: DateTime(today.year, today.month, today.day, 9, 0),
        participants: [
          "https://randomuser.me/api/portraits/men/11.jpg",
          "https://randomuser.me/api/portraits/women/12.jpg",
          "https://randomuser.me/api/portraits/men/13.jpg",
          "https://randomuser.me/api/portraits/women/14.jpg",
        ],
      ),
      Meeting(
        title: "جلسة تخطيط المنتج",
        description: "هدفنا هو التأكد من أن لديك كل ما تحتاجه لتشعر بالراحة والثقة والاستعداد لتقديم أفضل أداء.",
        organizer: "سارة جونسون",
        dateTime: DateTime(today.year, today.month, today.day, 11, 30),
        participants: [
          "https://randomuser.me/api/portraits/women/15.jpg",
          "https://randomuser.me/api/portraits/men/16.jpg",
          "https://randomuser.me/api/portraits/women/17.jpg",
          "https://randomuser.me/api/portraits/men/18.jpg",
          "https://randomuser.me/api/portraits/women/19.jpg",
          "https://randomuser.me/api/portraits/men/20.jpg",
          "https://randomuser.me/api/portraits/women/21.jpg",
        ],
      ),
      Meeting(
        title: "مراجعة مع العميل",
        description: "مراجعة ربع سنوية مع العميل الأساسي لمناقشة التقدم والتغذية الراجعة وخارطة الطريق المستقبلية.",
        organizer: "ديفيد تشين",
        dateTime: DateTime(today.year, today.month, today.day, 14, 0),
        participants: [
          "https://randomuser.me/api/portraits/men/22.jpg",
          "https://randomuser.me/api/portraits/women/23.jpg",
          "https://randomuser.me/api/portraits/men/24.jpg",
          "https://randomuser.me/api/portraits/women/25.jpg",
          "https://randomuser.me/api/portraits/men/26.jpg",
        ],
      ),
      Meeting(
        title: "سباق التصميم",
        description: "جلسة تصميم تشاركية لتوليد أفكار أولية ونماذج مبدئية للميزات القادمة.",
        organizer: "إيما ويلسون",
        dateTime: DateTime(today.year, today.month, today.day, 16, 0),
        participants: [
          "https://randomuser.me/api/portraits/women/27.jpg",
          "https://randomuser.me/api/portraits/men/28.jpg",
          "https://randomuser.me/api/portraits/women/29.jpg",
        ],
      ),
    ];

    _meetings[tomorrow] = [
      Meeting(
        title: "اجتماع الشركة العام",
        description: "اجتماع على مستوى الشركة لمناقشة النتائج ربع السنوية والمبادرات القادمة.",
        organizer: "جون سميث",
        dateTime: DateTime(today.year, today.month, today.day + 1, 10, 0),
        participants: [
          "https://randomuser.me/api/portraits/men/30.jpg",
          "https://randomuser.me/api/portraits/women/31.jpg",
          "https://randomuser.me/api/portraits/men/32.jpg",
          "https://randomuser.me/api/portraits/women/33.jpg",
          "https://randomuser.me/api/portraits/men/34.jpg",
          "https://randomuser.me/api/portraits/women/35.jpg",
          "https://randomuser.me/api/portraits/men/36.jpg",
          "https://randomuser.me/api/portraits/women/37.jpg",
        ],
      ),
      Meeting(
        title: "اجتماع فردي مع المدير",
        description: "الاجتماع الأسبوعي الفردي لمناقشة التطوير المهني والمشاريع الحالية.",
        organizer: "ليزا أندرسون",
        dateTime: DateTime(today.year, today.month, today.day + 1, 15, 30),
        participants: ["https://randomuser.me/api/portraits/women/38.jpg"],
      ),
    ];

    _meetings[dayAfter] = [
      Meeting(
        title: "الاجتماع الختامي للسبرنت",
        description: "اجتماع لمراجعة ما تم إنجازه في السبرنت، ما يمكن تحسينه، وخطة التحسين للسبرنت القادم.",
        organizer: "مايك رودريغيز",
        dateTime: DateTime(today.year, today.month, today.day + 2, 13, 0),
        participants: [
          "https://randomuser.me/api/portraits/men/39.jpg",
          "https://randomuser.me/api/portraits/women/40.jpg",
          "https://randomuser.me/api/portraits/men/41.jpg",
          "https://randomuser.me/api/portraits/women/42.jpg",
          "https://randomuser.me/api/portraits/men/43.jpg",
        ],
      ),
    ];
  }

  List<Meeting> getEventsForDay(DateTime day) {
    log('Input day: ${day.toString()}');
    final normalizedDate = DateTime(day.year, day.month, day.day);
    log('Normalized date for lookup: ${normalizedDate.toString()}');

    final meetings = _meetings[normalizedDate] ?? [];
    log('Number of meetings found: ${meetings.length}');

    return meetings;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final availableHeight = constraints.maxHeight.isInfinite
            ? MediaQuery.of(context).size.height * 0.44
            : constraints.maxHeight;

        final meetings = getEventsForDay(_selectedDay ?? DateTime.now());

        return SizedBox(
          width: constraints.maxWidth,
          height: availableHeight,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              CustomPaint(
                painter: RPSCustomPainter(),
                child: Container(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    children: [
                      CalendarTableWidget(
                        calendarFormat: _calendarFormat,
                        focusedDay: _focusedDay,
                        selectedDay: _selectedDay,
                        eventLoader: getEventsForDay,
                        onDaySelected: (selectedDay, focusedDay) {
                          if (!isSameDay(_selectedDay, selectedDay)) {
                            setState(() {
                              _selectedDay = selectedDay;
                              _focusedDay = focusedDay;
                              _currentMeetingPage = 0; // Reset page when selecting new day
                            });
                          }
                        },
                        onFormatChanged: (format) {
                          if (_calendarFormat != format) {
                            setState(() {
                              _calendarFormat = format;
                            });
                          }
                        },
                        onPageChanged: (focusedDay) {
                          setState(() {
                            _focusedDay = focusedDay;
                          });
                        },
                      ),
                      const SizedBox(height: 20),
                      Expanded(
                        child: MeetingsListWidget(
                          meetings: meetings,
                          onPageChanged: (index) {
                            setState(() {
                              _currentMeetingPage = index;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              if (meetings.length > 1)
                Positioned(
                  bottom: 10, // Half the height of  the indicator (assuming ~40px height)
                  left: 0,
                  right: 0,
                  child: Center(
                    child: PageIndicatorWidget(currentPage: _currentMeetingPage, totalPages: meetings.length),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
