import 'dart:convert';

class TaskModal {
  final String title;
  final bool isDone;
  final String description;
  final DateTime dateTime;
  final String id;
  final int rating;

  TaskModal({
    required this.title,
    required this.isDone,
    required this.description,
    required this.dateTime,
    required this.id,
    required this.rating,
  });

  TaskModal copyWith({
    String? title,
    bool? isDone,
    String? description,
    DateTime? dateTime,
    String? id,
    int? rating,
  }) {
    return TaskModal(
      title: title ?? this.title,
      isDone: isDone ?? this.isDone,
      description: description ?? this.description,
      dateTime: dateTime ?? this.dateTime,
      id: id ?? this.id,
      rating: rating ?? this.rating,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'isDone': isDone,
      'description': description,
      'dateTime': dateTime.millisecondsSinceEpoch,
      'id': id,
      'rating': rating,
    };
  }

  factory TaskModal.fromMap(Map<String, dynamic> map) {
    return TaskModal(
      title: map['title'] ?? '',
      isDone: map['isDone'] ?? false,
      description: map['description'] ?? '',
      dateTime: DateTime.fromMillisecondsSinceEpoch(map['dateTime']),
      id: map['id'] ?? '',
      rating: map['rating']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory TaskModal.fromJson(String source) =>
      TaskModal.fromMap(json.decode(source));

  @override
  String toString() {
    return 'TaskModal(title: $title, isDone: $isDone, description: $description, dateTime: $dateTime, id: $id, rating: $rating)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TaskModal &&
        other.title == title &&
        other.isDone == isDone &&
        other.description == description &&
        other.dateTime == dateTime &&
        other.id == id &&
        other.rating == rating;
  }

  @override
  int get hashCode {
    return title.hashCode ^
        isDone.hashCode ^
        description.hashCode ^
        dateTime.hashCode ^
        id.hashCode ^
        rating.hashCode;
  }
}
