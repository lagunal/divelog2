import 'package:drift/drift.dart';
import 'local/app_database.dart';
import 'local/tables/dive_sessions.dart';

class DatabaseService {
  final AppDatabase _db;

  DatabaseService(this._db);

  // Create
  Future<int> createDiveSession(DiveSessionsCompanion entry) {
    return _db.into(_db.diveSessions).insert(entry);
  }

  // Read All
  Future<List<DiveSession>> getAllDiveSessions() {
    return (_db.select(_db.diveSessions)..orderBy([
          (t) => OrderingTerm(expression: t.date, mode: OrderingMode.desc),
        ]))
        .get();
  }

  // Read One
  Future<DiveSession?> getDiveSession(int id) {
    return (_db.select(
      _db.diveSessions,
    )..where((t) => t.id.equals(id))).getSingleOrNull();
  }

  // Update
  Future<bool> updateDiveSession(DiveSession session) {
    return _db.update(_db.diveSessions).replace(session);
  }

  // Delete
  Future<int> deleteDiveSession(int id) {
    return (_db.delete(_db.diveSessions)..where((t) => t.id.equals(id))).go();
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
