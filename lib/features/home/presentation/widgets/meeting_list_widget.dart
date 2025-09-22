import 'package:crm_app/features/home/data/models/responses/meeting.dart';
import 'package:crm_app/features/home/presentation/widgets/meeting_card_widget.dart';
import 'package:flutter/material.dart';

class MeetingsListWidget extends StatefulWidget {
  final List<Meeting> meetings;
  final ValueChanged<int>? onPageChanged;

  const MeetingsListWidget({super.key, required this.meetings, this.onPageChanged});

  @override
  State<MeetingsListWidget> createState() => _MeetingsListWidgetState();
}

class _MeetingsListWidgetState extends State<MeetingsListWidget> {
  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.meetings.isEmpty) {
      return const EmptyMeetingsWidget();
    }

    return PageView.builder(
      controller: _pageController,
      itemCount: widget.meetings.length,
      onPageChanged: (index) {
        setState(() {
          _currentPage = index;
        });
        widget.onPageChanged?.call(index);
      },
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: MeetingCardWidget(meeting: widget.meetings[index]),
        );
      },
    );
  }
}

// empty_meetings_widget.dart
class EmptyMeetingsWidget extends StatelessWidget {
  const EmptyMeetingsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('No meetings for this day', style: TextStyle(color: Colors.white.withOpacity(0.7), fontSize: 16)),
    );
  }
}
