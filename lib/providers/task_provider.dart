import 'package:flutter/foundation.dart';
import '../models/task_model.dart';
import 'dart:collection';

class TaskProvider extends ChangeNotifier {
  final List<Task> _tasks = [];

  UnmodifiableListView<Task> get tasks {
    // Return tasks sorted by scheduled time, with completed ones at the bottom?
    // For now, just simple list.
    return UnmodifiableListView(_tasks);
  }

  void addTask(String title, DateTime scheduledTime) {
    final newTask = Task(
      id: DateTime.now().toString(), // Simple ID generation
      title: title,
      scheduledTime: scheduledTime,
    );
    _tasks.add(newTask);
    // Sort logic could go here
    _sortTasks();
    notifyListeners();
  }

  void removeTask(String id) {
    _tasks.removeWhere((task) => task.id == id);
    notifyListeners();
  }

  void toggleTaskStatus(String id) {
    final taskIndex = _tasks.indexWhere((task) => task.id == id);
    if (taskIndex != -1) {
      final currentTask = _tasks[taskIndex];
      _tasks[taskIndex] = currentTask.copyWith(
        isCompleted: !currentTask.isCompleted,
      );
      notifyListeners();
    }
  }
  
  void _sortTasks() {
    _tasks.sort((a, b) => a.scheduledTime.compareTo(b.scheduledTime));
  }
}
