
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
