// calendar_widget.dart
import 'dart:developer';

import 'package:crm_app/core/extensions/string_to_icon.dart';
import 'package:crm_app/core/extensions/text_style_extension.dart';
import 'package:crm_app/core/extensions/theme_extension.dart';
import 'package:crm_app/core/static/constants.dart';
import 'package:crm_app/core/static/icons.dart';
import 'package:crm_app/core/theme/colors.dart';
import 'package:crm_app/core/translations/locale_keys.g.dart';
import 'package:crm_app/features/home/data/models/responses/meeting.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

// meeting_card_widget.dart
class MeetingCardWidget extends StatelessWidget {
  final Meeting meeting;

  const MeetingCardWidget({super.key, required this.meeting});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MeetingHeaderWidget(meeting: meeting),
          const SizedBox(height: 16),
          MeetingDetailsWidget(meeting: meeting),
        ],
      ),
    );
  }
}

// meeting_header_widget.dart
class MeetingHeaderWidget extends StatelessWidget {
  final Meeting meeting;

  const MeetingHeaderWidget({super.key, required this.meeting});

  @override
  Widget build(BuildContext context) {
    return Row(
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
        const EditButtonWidget(),
      ],
    );
  }
}

// edit_button_widget.dart
class EditButtonWidget extends StatelessWidget {
  const EditButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}

// meeting_details_widget.dart
class MeetingDetailsWidget extends StatelessWidget {
  final Meeting meeting;

  const MeetingDetailsWidget({super.key, required this.meeting});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const OrganizerAvatarWidget(),
        const SizedBox(width: 12),
        Expanded(child: MeetingInfoWidget(meeting: meeting)),
        ParticipantsStackWidget(participants: meeting.participants),
      ],
    );
  }
}

// organizer_avatar_widget.dart
class OrganizerAvatarWidget extends StatelessWidget {
  const OrganizerAvatarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: Colors.white),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          image: DecorationImage(image: NetworkImage(Constants.placeholderImage), fit: BoxFit.cover),
        ),
      ),
    );
  }
}

// meeting_info_widget.dart
class MeetingInfoWidget extends StatelessWidget {
  final Meeting meeting;

  const MeetingInfoWidget({super.key, required this.meeting});

  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}

// participants_stack_widget.dart
class ParticipantsStackWidget extends StatelessWidget {
  final List<String> participants;

  const ParticipantsStackWidget({super.key, required this.participants});

  @override
  Widget build(BuildContext context) {
    if (participants.isEmpty) {
      return const SizedBox.shrink();
    }

    log('Participants count: ${participants.length}');
    final displayParticipants = participants.take(3).toList();

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
              children: [
                ...displayParticipants.asMap().entries.map(
                  (entry) => ParticipantAvatarWidget(url: entry.value, position: entry.key * 25.0),
                ),
              ],
            ),
          ),
          if (participants.length > 3) MoreParticipantsWidget(additionalCount: participants.length - 3),
        ],
      ),
    );
  }
}

// participant_avatar_widget.dart
class ParticipantAvatarWidget extends StatelessWidget {
  final String url;
  final double position;

  const ParticipantAvatarWidget({super.key, required this.url, required this.position});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: position,
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
  }
}

// more_participants_widget.dart
class MoreParticipantsWidget extends StatelessWidget {
  final int additionalCount;

  const MoreParticipantsWidget({super.key, required this.additionalCount});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 36,
      height: 36,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white.withOpacity(0.2),
        border: Border.all(color: Colors.white, width: 2),
      ),
      child: Center(
        child: Text(
          '+$additionalCount',
          style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
