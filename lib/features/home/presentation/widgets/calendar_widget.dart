import 'dart:developer';

import 'package:crm_app/core/extensions/string_to_icon.dart';
import 'package:crm_app/core/extensions/text_style_extension.dart';
import 'package:crm_app/core/extensions/theme_extension.dart';
import 'package:crm_app/core/static/constants.dart';
import 'package:crm_app/core/static/icons.dart';
import 'package:crm_app/core/theme/colors.dart';
import 'package:crm_app/core/translations/locale_keys.g.dart';
import 'package:crm_app/features/home/data/models/responses/meeting.dart';
import 'package:crm_app/features/home/presentation/widgets/meeting_custom_painter.dart';
import 'package:easy_localization/easy_localization.dart';
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

  // Sample meeting data
  final Map<DateTime, List<Meeting>> _meetings = {};

  @override
  void initState() {
    super.initState();
    _selectedDay = DateTime.now();

    // Sample meetings data
    final today = DateTime.now();
    final normalizedToday = DateTime(today.year, today.month, today.day);

    _meetings[normalizedToday] = [
      Meeting(
        title: "Meeting Name",
        description:
            "Our goal is to ensure that you have everything you need to feel comfortable, confident, and ready to make an impact.",
        organizer: "Mohamed Yasser",
        // notice this is for yesterday
        dateTime: DateTime(today.year, today.month, today.day, 10, 0),
        participants: [
          "https://randomuser.me/api/portraits/men/11.jpg",
          "https://randomuser.me/api/portraits/women/12.jpg",
          "https://randomuser.me/api/portraits/men/13.jpg",
          "https://randomuser.me/api/portraits/women/14.jpg",
          "https://randomuser.me/api/portraits/men/15.jpg",
          "https://randomuser.me/api/portraits/women/16.jpg",
          "https://randomuser.me/api/portraits/men/17.jpg",
          "https://randomuser.me/api/portraits/women/18.jpg",
          "https://randomuser.me/api/portraits/men/19.jpg",
          "https://randomuser.me/api/portraits/women/20.jpg",
        ],
      ),
    ];
  }

  List<Meeting> _getEventsForDay(DateTime day) {
    // Log the input day
    log('Input day: ${day.toString()}');

    // Create normalized date for lookup
    final normalizedDate = DateTime(day.year, day.month, day.day);
    log('Normalized date for lookup: ${normalizedDate.toString()}');

    // Log the current meetings map
    log('Current meetings map: ${_meetings.toString()}');

    // Check if meetings exist for this day
    final hasMeetings = _meetings.containsKey(normalizedDate);
    log('Has meetings for this day: $hasMeetings');

    // Get meetings for the day
    final meetings = _meetings[normalizedDate] ?? [];
    log('Number of meetings found: ${meetings.length}');

    // Log each meeting if any exist
    if (meetings.isNotEmpty) {
      for (var i = 0; i < meetings.length; i++) {
        log('Meeting $i: ${meetings[i].title} at ${meetings[i].dateTime}');
      }
    } else {
      log('No meetings found for this day');
    }

    return meetings;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Handle infinite height constraints
        final availableHeight = constraints.maxHeight.isInfinite
            ? MediaQuery.of(context).size.height * 0.44
            : constraints.maxHeight;

        return SizedBox(
          width: constraints.maxWidth,
          height: availableHeight,
          child: CustomPaint(
            painter: RPSCustomPainter(),
            child: Container(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  // Enhanced Calendar with table_calendar
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(16),
                      // border: Border.all(color: Colors.white.withOpacity(0.2)),
                    ),
                    child: TableCalendar<Meeting>(
                      firstDay: DateTime.utc(2020, 1, 1),
                      lastDay: DateTime.utc(2030, 12, 31),
                      focusedDay: _focusedDay,
                      calendarFormat: _calendarFormat,
                      eventLoader: _getEventsForDay,
                      startingDayOfWeek: StartingDayOfWeek.monday,
                      selectedDayPredicate: (day) => isSameDay(_selectedDay, day),

                      // Calendar styling
                      calendarStyle: CalendarStyle(
                        outsideDaysVisible: false,
                        weekendTextStyle: const TextStyle(color: Colors.white70),
                        holidayTextStyle: const TextStyle(color: Colors.white70),
                        defaultTextStyle: const TextStyle(color: Colors.white),
                        selectedTextStyle: const TextStyle(color: Color(0xFFE92929), fontWeight: FontWeight.bold),
                        todayTextStyle: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                        selectedDecoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
                        todayDecoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        markerDecoration: const BoxDecoration(color: Colors.white),
                        markersMaxCount: 3,
                        markerSize: 6,
                      ),

                      // Header styling
                      headerStyle: HeaderStyle(
                        formatButtonVisible: false,
                        titleCentered: true,
                        titleTextStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                        leftChevronIcon: const Icon(Icons.chevron_left, color: Colors.white),
                        rightChevronIcon: const Icon(Icons.chevron_right, color: Colors.white),
                        headerPadding: const EdgeInsets.symmetric(vertical: 16),
                      ),

                      // Days of week styling
                      daysOfWeekStyle: const DaysOfWeekStyle(
                        weekdayStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
                        weekendStyle: TextStyle(color: Colors.white70, fontWeight: FontWeight.w600),
                      ),

                      onDaySelected: (selectedDay, focusedDay) {
                        if (!isSameDay(_selectedDay, selectedDay)) {
                          setState(() {
                            _selectedDay = selectedDay;
                            _focusedDay = focusedDay;
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
                  ),

                  const SizedBox(height: 20),

                  // Meeting Cards
                  Expanded(child: _buildMeetingsList()),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildMeetingsList() {
    final meetings = _getEventsForDay(_selectedDay ?? DateTime.now());

    if (meetings.isEmpty) {
      return Center(
        child: Text('No meetings for this day', style: TextStyle(color: Colors.white.withOpacity(0.7), fontSize: 16)),
      );
    }

    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: meetings.length,
      itemBuilder: (context, index) {
        final meeting = meetings[index];
        return _buildMeetingCard(meeting);
      },
    );
  }

  Widget _buildMeetingCard(Meeting meeting) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        // color: Colors.white.withOpacity(0.15),
        borderRadius: BorderRadius.circular(16),
        // border: Border.all(color: Colors.white.withOpacity(0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Text(
                      meeting.title,
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                    ),

                    const SizedBox(height: 8),

                    Text(meeting.description, style: context.bodyMedium.s10.regular.copyWith(color: Colors.white)),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8)),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AppIcons.edit2Ic.icon(color: AppColors.primary),
                    const SizedBox(width: 4),
                    Text(
                      LocaleKeys.edit.tr(),
                      style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: Colors.black),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          Row(
            children: [
              // Organizer profile image
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: Colors.white),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(image: NetworkImage(Constants.placeholderImage), fit: BoxFit.cover),
                  ),
                ),
              ),

              const SizedBox(width: 12),

              // Meeting details
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      meeting.organizer,
                      style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.white),
                    ),
                    Text(
                      DateFormat('MMM dd, yyyy | HH:mm').format(meeting.dateTime),
                      style: TextStyle(fontSize: 12, color: Colors.white.withOpacity(0.7)),
                    ),
                  ],
                ),
              ),

              // Participants with flutter_image_stack
              _buildParticipantsStack(meeting.participants),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildParticipantsStack(List<String> participants) {
    if (participants.isEmpty) {
      return const SizedBox.shrink();
    }

    // Log participants for debugging
    log('Participants count: ${participants.length}');
    log('Participant URLs: $participants');

    // Show max 3 images in stack
    final displayParticipants = participants.take(3).toList();
    log('Display participants: $displayParticipants');

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 100,
            height: 40,
            child: Stack(
              alignment: Alignment.centerLeft,
              children: displayParticipants.asMap().entries.map((entry) {
                final index = entry.key;
                final url = entry.value;
                return Positioned(
                  left: index * 25.0, // Offset each image
                  child: Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                    child: ClipOval(
                      child: Image.network(
                        url,
                        width: 36,
                        height: 36,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          log('Failed to load image: $url, error: $error');
                          return const Icon(Icons.error, size: 20, color: Colors.red);
                        },
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          if (participants.length > 3)
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(0.2),
                border: Border.all(color: Colors.white, width: 2),
              ),
              child: Center(
                child: Text(
                  '+${participants.length - 3}',
                  style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
