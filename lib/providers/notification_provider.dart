import 'package:flutter/foundation.dart';
import '../services/api_service.dart';

class NotificationProvider extends ChangeNotifier {
  List<dynamic> _notifications = [];
  bool _isLoading = false;

  List<dynamic> get notifications => _notifications;
  bool get isLoading => _isLoading;

  Future<void> fetchNotifications() async {
    _isLoading = true;
    notifyListeners();
    try {
      _notifications = await ApiService.getNotifications();
    } catch (e) {
      if (kDebugMode) print(e);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> markAsRead(String id) async {
    try {
      await ApiService.markNotificationRead(id);
      final index = _notifications.indexWhere((n) => n['_id'] == id);
      if (index != -1) {
        _notifications[index]['read'] = true;
        notifyListeners();
      }
    } catch (e) {
      if (kDebugMode) print(e);
    }
  }
}
