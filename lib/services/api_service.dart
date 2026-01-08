import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/task_model.dart';

class ApiService {
  // For Android Emulator use http://10.0.2.2:5000/api
  // For Windows/iOS/Web use http://localhost:5000/api
  static const String baseUrl = 'http://localhost:5000/api';
  
  static String? _token;

  static String? getToken() => _token;

  static void setToken(String token) {
    _token = token;
  }

  static Future<Map<String, dynamic>> login(String username, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/users/login'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'username': username, 'password': password}),
    );
    
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      _token = data['token'];
      return data;
    } else {
      throw Exception(jsonDecode(response.body)['message'] ?? 'Failed to login');
    }
  }

  static Future<Map<String, dynamic>> register(String username, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/users'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'username': username, 'password': password}),
    );
    
    if (response.statusCode == 201) {
      final data = jsonDecode(response.body);
      _token = data['token'];
      return data;
    } else {
      throw Exception(jsonDecode(response.body)['message'] ?? 'Failed to register');
    }
  }

  static Future<List<Task>> getTasks() async {
    final response = await http.get(
      Uri.parse('$baseUrl/tasks'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $_token',
      },
    );

    if (response.statusCode == 200) {
      List jsonResponse = jsonDecode(response.body);
      return jsonResponse.map((task) => Task.fromJson(task)).toList();
    } else {
      throw Exception('Failed to load tasks');
    }
  }

  static Future<Task> createTask(String title, DateTime scheduledTime) async {
    final response = await http.post(
      Uri.parse('$baseUrl/tasks'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $_token',
      },
      body: jsonEncode({
        'title': title,
        'scheduledTime': scheduledTime.toIso8601String(),
      }),
    );

    if (response.statusCode == 201) {
      return Task.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to create task');
    }
  }

  static Future<void> updateTask(String id, bool isCompleted) async {
    final response = await http.put(
      Uri.parse('$baseUrl/tasks/$id'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $_token',
      },
      body: jsonEncode({'isCompleted': isCompleted}),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to update task');
    }
  }

  static Future<void> updateTaskStatus(String id, String status, bool isCompleted, {int totalTime = 0}) async {
    final response = await http.put(
      Uri.parse('$baseUrl/tasks/$id'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $_token',
      },
      body: jsonEncode({
        'status': status,
        'isCompleted': isCompleted,
        'totalTime': totalTime,
      }),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to update task status');
    }
  }

  static Future<void> deleteTask(String id) async {
    final response = await http.delete(
      Uri.parse('$baseUrl/tasks/$id'),
      headers: {
        'Authorization': 'Bearer $_token',
      },
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to delete task');
    }
  }

  // --- Notification Methods ---

  static Future<List<dynamic>> getNotifications() async {
    final response = await http.get(
      Uri.parse('$baseUrl/notifications'),
      headers: {
        'Authorization': 'Bearer $_token',
      },
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load notifications');
    }
  }

  static Future<void> createNotification(String title, String body, String type) async {
    final response = await http.post(
      Uri.parse('$baseUrl/notifications'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $_token',
      },
      body: jsonEncode({
        'title': title,
        'body': body,
        'type': type,
      }),
    );

    if (response.statusCode != 201) {
      throw Exception('Failed to create notification');
    }
  }

  static Future<void> markNotificationRead(String id) async {
    final response = await http.put(
      Uri.parse('$baseUrl/notifications/$id'),
      headers: {
        'Authorization': 'Bearer $_token',
      },
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to mark notification as read');
    }
  }
}
