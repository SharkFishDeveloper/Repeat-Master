import 'dart:convert';

import 'package:equatable/equatable.dart';

import '../features/do_after_feature/do_after_logic.dart';

enum Rating { low, medium, high, highest }

class TaskModal extends Equatable {
  final String title;
  final bool isDone;
  final String description;
  final DateTime dateTime;
  final String id;
  final Rating rating;
  final int remainingDaysToRevise;

  const TaskModal({
    required this.title,
    required this.isDone,
    required this.description,
    required this.dateTime,
    required this.id,
    required this.rating,
    required this.remainingDaysToRevise
  });

  TaskModal copyWith({
    String? title,
    bool? isDone,
    String? description,
    DateTime? dateTime,
    String? id,
    Rating? rating,
    int? remainingDaysToRevise
  }) {
    return TaskModal(
      title: title ?? this.title,
      isDone: isDone ?? this.isDone,
      description: description ?? this.description,
      dateTime: dateTime ?? this.dateTime,
      id: id ?? this.id,
      rating: rating ?? this.rating,
      remainingDaysToRevise : remainingDaysToRevise??this.remainingDaysToRevise
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
      "remainingDaysToRevise": remainingDaysToRevise
    };
  }

  factory TaskModal.fromMap(Map<String, dynamic> map) {
    return TaskModal(
      title: map['title'] ?? '',
      isDone: map['isDone'] ?? false,
      description: map['description'] ?? '',
      dateTime: DateTime.fromMillisecondsSinceEpoch(map['dateTime']),
      id: map['id'] ?? '',
      rating: map['rating'] ?? Rating.low,
      remainingDaysToRevise: map['remainingDaysToRevise'] //TODO : some changes
    );
  }

  String toJson() => json.encode(toMap());

  factory TaskModal.fromJson(String source) =>
      TaskModal.fromMap(json.decode(source));

  @override
  String toString() {
    return 'TaskModal(title: $title, isDone: $isDone, description: $description, dateTime: $dateTime, id: $id, rating: $rating,remainingDays: $remainingDaysToRevise,)';
  }

  // @override
  // bool operator ==(Object other) {
  //   if (identical(this, other)) return true;

  //   return other is TaskModal &&
  //       other.title == title &&
  //       other.isDone == isDone &&
  //       other.description == description &&
  //       other.dateTime == dateTime &&
  //       other.id == id &&
  //       other.rating == rating;
  // }

  // @override
  // int get hashCode {
  //   return title.hashCode ^
  //       isDone.hashCode ^
  //       description.hashCode ^
  //       dateTime.hashCode ^
  //       id.hashCode ^
  //       rating.hashCode;
  // }

int ratingToInt(Rating rating) {
  switch (rating) {
    case Rating.low:
      return 3;
    case Rating.medium:
      return 2;
    case Rating.high:
      return 1;
    default:
      return 0;
  }
}

Rating intToRating(int ratingInt) {
  switch (ratingInt) {
    case 3:
      return Rating.low;
    case 2:
      return Rating.medium;
    case 1:
      return Rating.high;
    default:
      // Handle any unrecognized string, such as returning a default value or throwing an exception.
      // In this example, we return Rating.low as a default value.
      return Rating.low;
  }
}
  @override
  // TODO: implement props
  List<Object?> get props => [id, title, rating, dateTime, isDone, description,remainingDaysToRevise];
}
