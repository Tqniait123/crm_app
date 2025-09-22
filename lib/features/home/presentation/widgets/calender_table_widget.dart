// calendar_widget.dart
import 'package:crm_app/features/home/data/models/responses/meeting.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

// calendar_table_widget.dart
class CalendarTableWidget extends StatelessWidget {
  final CalendarFormat calendarFormat;
  final DateTime focusedDay;
  final DateTime? selectedDay;
  final List<Meeting> Function(DateTime) eventLoader;
  final void Function(DateTime selectedDay, DateTime focusedDay) onDaySelected;
  final void Function(CalendarFormat format) onFormatChanged;
  final void Function(DateTime focusedDay) onPageChanged;

  const CalendarTableWidget({
    super.key,
    required this.calendarFormat,
    required this.focusedDay,
    required this.selectedDay,
    required this.eventLoader,
    required this.onDaySelected,
    required this.onFormatChanged,
    required this.onPageChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.transparent, borderRadius: BorderRadius.circular(16)),
      child: TableCalendar<Meeting>(
        firstDay: DateTime.utc(2020, 1, 1),
        lastDay: DateTime.utc(2030, 12, 31),
        focusedDay: focusedDay,
        calendarFormat: calendarFormat,
        eventLoader: eventLoader,
        startingDayOfWeek: StartingDayOfWeek.monday,
        selectedDayPredicate: (day) => isSameDay(selectedDay, day),
        calendarStyle: const CalendarStyle(
          outsideDaysVisible: false,
          weekendTextStyle: TextStyle(color: Colors.white70),
          holidayTextStyle: TextStyle(color: Colors.white70),
          defaultTextStyle: TextStyle(color: Colors.white),
          selectedTextStyle: TextStyle(color: Color(0xFFE92929), fontWeight: FontWeight.bold),
          todayTextStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),

          selectedDecoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(12)),
            shape: BoxShape.rectangle,
          ),
          todayDecoration: BoxDecoration(
            color: Colors.white30,
            borderRadius: BorderRadius.all(Radius.circular(12)),
            shape: BoxShape.rectangle,
          ),
          defaultDecoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.all(Radius.circular(12)),
            shape: BoxShape.rectangle,
          ),
          holidayDecoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.all(Radius.circular(12)),
            shape: BoxShape.rectangle,
          ),
          outsideDecoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.all(Radius.circular(12)),
            shape: BoxShape.rectangle,
          ),
          weekendDecoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.all(Radius.circular(12)),
            shape: BoxShape.rectangle,
          ),

          markerDecoration: BoxDecoration(color: Colors.white),
          markersMaxCount: 3,
          markerSize: 6,
        ),
        headerStyle: const HeaderStyle(
          formatButtonVisible: false,
          titleCentered: true,
          titleTextStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          leftChevronIcon: Icon(Icons.chevron_left, color: Colors.white),
          rightChevronIcon: Icon(Icons.chevron_right, color: Colors.white),
          headerPadding: EdgeInsets.symmetric(vertical: 16),
        ),
        daysOfWeekStyle: const DaysOfWeekStyle(
          weekdayStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
          weekendStyle: TextStyle(color: Colors.white70, fontWeight: FontWeight.w600),
        ),
        onDaySelected: onDaySelected,
        onFormatChanged: onFormatChanged,
        onPageChanged: onPageChanged,
      ),
    );
  }
}
