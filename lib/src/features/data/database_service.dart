import 'dart:developer' as developer;
import 'package:drift/drift.dart';
import 'local/app_database.dart';
import 'local/tables/dive_sessions.dart';

class DatabaseService {
  final AppDatabase _db;

  DatabaseService(this._db);

  // Create
  Future<int> createDiveSession(DiveSessionsCompanion entry) async {
    developer.log('Creating dive session', name: 'DatabaseService');
    final id = await _db.into(_db.diveSessions).insert(entry);
    developer.log('Dive session created with ID: $id', name: 'DatabaseService');
    return id;
  }

  // Read All
  Future<List<DiveSession>> getAllDiveSessions() async {
    developer.log('Fetching all dive sessions', name: 'DatabaseService');
    final sessions = await (_db.select(_db.diveSessions)..orderBy([
          (t) => OrderingTerm(expression: t.date, mode: OrderingMode.desc),
        ]))
        .get();
    developer.log('Fetched ${sessions.length} dive sessions', name: 'DatabaseService');
    return sessions;
  }

  // Read One
  Future<DiveSession?> getDiveSession(int id) async {
    developer.log('Fetching dive session with ID: $id', name: 'DatabaseService');
    return (_db.select(
      _db.diveSessions,
    )..where((t) => t.id.equals(id))).getSingleOrNull();
  }

  // Update
  Future<bool> updateDiveSession(DiveSession session) async {
    developer.log('Updating dive session with ID: ${session.id}', name: 'DatabaseService');
    final result = await _db.update(_db.diveSessions).replace(session);
    developer.log('Dive session update result: $result', name: 'DatabaseService');
    return result;
  }

  // Delete
  Future<int> deleteDiveSession(int id) async {
    developer.log('Deleting dive session with ID: $id', name: 'DatabaseService');
    final rowsDeleted = await (_db.delete(_db.diveSessions)..where((t) => t.id.equals(id))).go();
    developer.log('Deleted $rowsDeleted rows', name: 'DatabaseService');
    return rowsDeleted;
  }

  // --- Stats Methods ---
  
  Future<Map<String, dynamic>> getDiveStats() async {
    developer.log('Fetching dive stats', name: 'DatabaseService');
    
    final countExp = _db.diveSessions.id.count();
    final timeExp = _db.diveSessions.bottomTime.sum();
    
    final query = _db.selectOnly(_db.diveSessions)
      ..addColumns([countExp, timeExp]);
      
    final result = await query.getSingle();
    
    final totalDives = result.read(countExp) ?? 0;
    final totalTime = result.read(timeExp) ?? 0;
    
    return {
      'totalDives': totalDives,
      'totalBottomTime': totalTime,
    };
  }

  // --- Sync Related Methods ---

  // Get Pending Sessions
  Future<List<DiveSession>> getPendingDiveSessions() {
    return (_db.select(
      _db.diveSessions,
    )..where((t) => t.syncStatus.equals(SyncStatus.pending.index))).get();
  }

  // Mark as Synced
  Future<void> markAsSynced(int id, String firestoreId) {
    return (_db.update(_db.diveSessions)..where((t) => t.id.equals(id))).write(
      DiveSessionsCompanion(
        syncStatus: Value(SyncStatus.synced),
        firestoreId: Value(firestoreId),
      ),
    );
  }
}
