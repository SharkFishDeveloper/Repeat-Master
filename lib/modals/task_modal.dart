import 'dart:convert';

class TaskModal {
  final String title;
  final bool isDone;
  final String id;
  TaskModal({
    required this.title,
    required this.isDone,
    required this.id,
  });

  TaskModal copyWith({
    String? title,
    bool? isDone,
    String? id,
  }) {
    return TaskModal(
      title: title ?? this.title,
      isDone: isDone ?? this.isDone,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'isDone': isDone,
      'id': id,
    };
  }

  factory TaskModal.fromMap(Map<String, dynamic> map) {
    return TaskModal(
      title: map['title'] ?? '',
      isDone: map['isDone'] ?? false,
      id: map['id'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory TaskModal.fromJson(String source) =>
      TaskModal.fromMap(json.decode(source));

  @override
  String toString() => 'TaskModal(title: $title, isDone: $isDone, id: $id)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TaskModal &&
        other.title == title &&
        other.isDone == isDone &&
        other.id == id;
  }

  @override
  int get hashCode => title.hashCode ^ isDone.hashCode ^ id.hashCode;
}
