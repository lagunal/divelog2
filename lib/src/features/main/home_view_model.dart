import 'package:divelog2/src/features/data/database_service.dart';
import 'package:flutter/material.dart';

class HomeViewModel extends ChangeNotifier {
  final DatabaseService _databaseService;

  HomeViewModel(this._databaseService);

  int _totalDives = 0;
  int get totalDives => _totalDives;

  int _totalBottomTime = 0;
  int get totalBottomTime => _totalBottomTime;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> loadStats() async {
    _isLoading = true;
    notifyListeners();

    try {
      final stats = await _databaseService.getDiveStats();
      _totalDives = stats['totalDives'] as int;
      _totalBottomTime = stats['totalBottomTime'] as int;
    } catch (e) {
      debugPrint('Error loading stats: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
