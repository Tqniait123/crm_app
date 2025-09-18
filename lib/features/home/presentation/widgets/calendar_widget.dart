import 'dart:developer';

import 'package:crm_app/core/extensions/string_to_icon.dart';
import 'package:crm_app/core/static/constants.dart';
import 'package:crm_app/core/static/icons.dart';
import 'package:crm_app/core/translations/locale_keys.g.dart';
import 'package:crm_app/features/home/presentation/widgets/meeting_custom_painter.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_stack/flutter_image_stack.dart';
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
        description: "Our goal is ...",
        organizer: "Mohamed Yasser",
        // notice this is for yesterday
        dateTime: DateTime(today.year, today.month, today.day - 1, 10, 0),
        participants: [
          Constants.placeholderImage,
          Constants.placeholderImage,
          Constants.placeholderImage,
          Constants.placeholderImage,
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
                      color: Colors.white.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.white.withOpacity(0.2)),
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
              Expanded(
                child: Text(
                  meeting.title,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(color: Colors.white.withOpacity(0.2), borderRadius: BorderRadius.circular(8)),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AppIcons.editIc.icon(color: Colors.white),
                    const SizedBox(width: 4),
                    Text(
                      LocaleKeys.edit.tr(),
                      style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 8),

          Text(meeting.description, style: TextStyle(fontSize: 14, color: Colors.white.withOpacity(0.8))),

          const SizedBox(height: 16),

          Row(
            children: [
              // Organizer profile image
              CircleAvatar(
                radius: 20,
                backgroundColor: Colors.white,
                child: CircleAvatar(radius: 18, backgroundImage: NetworkImage(Constants.placeholderImage)),
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
    if (participants.isEmpty) return const SizedBox.shrink();

    // Show max 3 images in stack, then show count
    final displayParticipants = participants.take(3).toList();
    final extraCount = participants.length - displayParticipants.length;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(color: Colors.white.withOpacity(0.2), borderRadius: BorderRadius.circular(12)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          FlutterImageStack(
            imageList: displayParticipants,
            totalCount: displayParticipants.length,
            itemRadius: 16,
            itemCount: displayParticipants.length,
            itemBorderWidth: 2,
            itemBorderColor: Colors.white,
            backgroundColor: Colors.transparent,
          ),
          if (extraCount > 0) ...[
            const SizedBox(width: 8),
            Text(
              '+$extraCount',
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Colors.white),
            ),
          ],
        ],
      ),
    );
  }
}

// Meeting model class
class Meeting {
  final String title;
  final String description;
  final String organizer;
  final DateTime dateTime;
  final List<String> participants;

  Meeting({
    required this.title,
    required this.description,
    required this.organizer,
    required this.dateTime,
    required this.participants,
  });
}
