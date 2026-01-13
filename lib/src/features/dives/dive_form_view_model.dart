import 'package:divelog2/src/features/data/database_service.dart';
import 'package:divelog2/src/features/data/local/app_database.dart';
import 'package:divelog2/src/features/data/local/tables/dive_sessions.dart';
import 'package:drift/drift.dart';
import 'package:flutter/material.dart';

class DiveFormViewModel extends ChangeNotifier {
  final DatabaseService _databaseService;

  DiveFormViewModel(this._databaseService);

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _error;
  String? get error => _error;

  Future<void> saveDiveSession({
    required DateTime date,
    required String location,
    String? client,
    String? diveOperator,
    String? operatorAddress,
    String? diveType,
    String? diversNames,
    DateTime? entryTime,
    DateTime? exitTime,
    required double maxDepth,
    int? surfaceInterval,
    required int bottomTime,
    DateTime? decompressionStart,
    DateTime? decompressionComplete,
    int? totalDiveTime,
    String? gasMixture,
    String? workDescription,
    String? decompressionUsed,
    String? illnessOrInjury,
    String? diveSupervisor,
    int? accumulatedSupervisionTime,
    int? accumulatedDiveTime,
  }) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final entry = DiveSessionsCompanion(
        date: Value(date),
        location: Value(location),
        client: Value(client),
        diveOperator: Value(diveOperator),
        operatorAddress: Value(operatorAddress),
        diveType: Value(diveType),
        diversNames: Value(diversNames),
        entryTime: Value(entryTime),
        exitTime: Value(exitTime),
        maxDepth: Value(maxDepth),
        surfaceInterval: Value(surfaceInterval),
        bottomTime: Value(bottomTime),
        decompressionStart: Value(decompressionStart),
        decompressionComplete: Value(decompressionComplete),
        totalDiveTime: Value(totalDiveTime),
        gasMixture: Value(gasMixture),
        workDescription: Value(workDescription),
        decompressionUsed: Value(decompressionUsed),
        illnessOrInjury: Value(illnessOrInjury),
        diveSupervisor: Value(diveSupervisor),
        accumulatedSupervisionTime: Value(accumulatedSupervisionTime),
        accumulatedDiveTime: Value(accumulatedDiveTime),
        syncStatus: const Value(SyncStatus.pending),
        updatedAt: Value(DateTime.now()),
      );

      await _databaseService.createDiveSession(entry);
    } catch (e) {
      _error = e.toString();
      rethrow;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
