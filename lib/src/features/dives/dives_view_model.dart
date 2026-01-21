import 'package:divelog2/src/features/data/database_service.dart';
import 'package:divelog2/src/features/data/local/app_database.dart';
import 'package:flutter/material.dart';

class DivesViewModel extends ChangeNotifier {
  final DatabaseService _databaseService;

  DivesViewModel(this._databaseService);

  List<DiveSession> _dives = [];
  List<DiveSession> get dives => _dives;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _error;
  String? get error => _error;

  Future<void> fetchDives() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _dives = await _databaseService.getAllDiveSessions();
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> deleteDive(int id) async {
    try {
      await _databaseService.deleteDiveSession(id);
      await fetchDives();
    } catch (e) {
      _error = e.toString();
      notifyListeners();
    }
  }
}
