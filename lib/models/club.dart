class Club {
  final int id;
  final String name;
  final String description;
  final String category;
  final String time;
  final String week;
  final String room;

  Club({
    required this.id,
    required this.name,
    required this.description,
    required this.category,
    required this.time,
    required this.week,
    required this.room,
  });

  factory Club.fromJson(Map<String, dynamic> json) {
    return Club(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      category: json['category'],
      time: json['time'],
      week: json['week'],
      room: json['room'],
    );
  }
}
