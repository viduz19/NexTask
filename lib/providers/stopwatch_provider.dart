import 'dart:async';
import 'package:flutter/material.dart';

class StopwatchProvider extends ChangeNotifier {
  int _seconds = 0;
  bool _isRunning = false;
  Timer? _timer;

  int get seconds => _seconds;
  bool get isRunning => _isRunning;

  String get formattedTime {
    int hours = _seconds ~/ 3600;
    int minutes = (_seconds % 3600) ~/ 60;
    int seconds = _seconds % 60;
    return "${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}";
  }

  void start() {
    if (!_isRunning) {
      _isRunning = true;
      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        _seconds++;
        notifyListeners();
      });
      notifyListeners();
    }
  }

  void pause() {
    if (_isRunning) {
      _isRunning = false;
      _timer?.cancel();
      notifyListeners();
    }
  }

  void stop() {
    _isRunning = false;
    _timer?.cancel();
    _seconds = 0;
    notifyListeners();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
