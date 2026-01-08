import 'package:flutter/foundation.dart';

class Task {
  final String id;
  final String title;
  final DateTime scheduledTime;
  final bool isCompleted;
  final String status; // 'pending', 'ongoing', 'completed'
  final int totalTime; // in seconds for stopwatch

  Task({
    required this.id,
    required this.title,
    required this.scheduledTime,
    this.isCompleted = false,
    this.status = 'pending',
    this.totalTime = 0,
  });

  Task copyWith({
    String? id,
    String? title,
    DateTime? scheduledTime,
    bool? isCompleted,
    String? status,
    int? totalTime,
  }) {
    return Task(
      id: id ?? this.id,
      title: title ?? this.title,
      scheduledTime: scheduledTime ?? this.scheduledTime,
      isCompleted: isCompleted ?? this.isCompleted,
      status: status ?? this.status,
      totalTime: totalTime ?? this.totalTime,
    );
  }

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['_id'] ?? json['id'] ?? '',
      title: json['title'] ?? '',
      scheduledTime: DateTime.parse(json['scheduledTime']),
      isCompleted: json['isCompleted'] ?? false,
      status: json['status'] ?? (json['isCompleted'] == true ? 'completed' : 'pending'),
      totalTime: json['totalTime'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'scheduledTime': scheduledTime.toIso8601String(),
      'isCompleted': isCompleted,
      'status': status,
      'totalTime': totalTime,
    };
  }
}
