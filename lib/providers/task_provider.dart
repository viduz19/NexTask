import 'package:flutter/foundation.dart';
import '../models/task_model.dart';
import '../services/api_service.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:collection';

class TaskProvider extends ChangeNotifier {
  List<Task> _tasks = [];
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  Future<void> fetchTasks() async {
    _isLoading = true;
    notifyListeners();
    try {
      _tasks = await ApiService.getTasks();
      _sortTasks();
    } catch (e) {
      if (kDebugMode) print(e);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> addTask(String title, DateTime scheduledTime) async {
    try {
      final newTask = await ApiService.createTask(title, scheduledTime);
      _tasks.add(newTask);
      _sortTasks();
      notifyListeners();
    } catch (e) {
      if (kDebugMode) print(e);
    }
  }

  Future<void> removeTask(String id) async {
    try {
      await ApiService.deleteTask(id);
      _tasks.removeWhere((task) => task.id == id);
      notifyListeners();
    } catch (e) {
      if (kDebugMode) print(e);
    }
  }

  Future<void> toggleTaskStatus(String id) async {
    final taskIndex = _tasks.indexWhere((task) => task.id == id);
    if (taskIndex != -1) {
      final currentTask = _tasks[taskIndex];
      final newStatus = !currentTask.isCompleted;
      final newStatusText = newStatus ? 'completed' : 'pending';
      try {
        await ApiService.updateTask(id, newStatus); // Existing API update (completeness)
        // We might want a specialized status update API, but for now we'll use existing
        _tasks[taskIndex] = currentTask.copyWith(
          isCompleted: newStatus,
          status: newStatusText
        );
        notifyListeners();
      } catch (e) {
        if (kDebugMode) print(e);
      }
    }
  }

  Future<void> setTaskStatus(String id, String status) async {
    final taskIndex = _tasks.indexWhere((task) => task.id == id);
    if (taskIndex != -1) {
      final currentTask = _tasks[taskIndex];
      try {
        final isCompleted = (status == 'completed');
        await ApiService.updateTaskStatus(id, status, isCompleted);
        
        _tasks[taskIndex] = currentTask.copyWith(status: status, isCompleted: isCompleted);
        notifyListeners();
      } catch (e) {
        if (kDebugMode) print(e);
      }
    }
  }
  
  void _sortTasks() {
    _tasks.sort((a, b) => a.scheduledTime.compareTo(b.scheduledTime));
  }
}
