import 'package:flutter/foundation.dart';

class Task {
  final String id;
  final String title;
  final DateTime scheduledTime;
  final bool isCompleted;

  Task({
    required this.id,
    required this.title,
    required this.scheduledTime,
    this.isCompleted = false,
  });

  Task copyWith({
    String? id,
    String? title,
    DateTime? scheduledTime,
    bool? isCompleted,
  }) {
    return Task(
      id: id ?? this.id,
      title: title ?? this.title,
      scheduledTime: scheduledTime ?? this.scheduledTime,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}
