import 'package:divelog2/src/features/data/database_service.dart';
import 'package:divelog2/src/features/data/local/app_database.dart';
import 'package:divelog2/src/features/data/local/tables/dive_sessions.dart';
import 'package:drift/drift.dart' hide isNotNull;
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late AppDatabase db;
  late DatabaseService service;

  setUp(() {
    // Use an in-memory database for testing
    db = AppDatabase.forTesting(NativeDatabase.memory());
    service = DatabaseService(db);
  });

  tearDown(() async {
    await db.close();
  });

  test('createDiveSession inserts a session with new schema', () async {
    final entry = DiveSessionsCompanion(
      date: Value(DateTime.now()),
      location: const Value('Test Location'),
      client: const Value('Test Client'),
      diveOperator: const Value('Test Operator'),
      maxDepth: const Value(20.5),
      bottomTime: const Value(45),
      diversNames: const Value('Diver 1, Diver 2'),
      workDescription: const Value('Inspection work'),
      accumulatedDiveTime: const Value(1200),
    );

    final id = await service.createDiveSession(entry);
    expect(id, isNotNull);

    final session = await service.getDiveSession(id);
    expect(session, isNotNull);
    expect(session!.location, 'Test Location');
    expect(session.diversNames, 'Diver 1, Diver 2');
    expect(session.workDescription, 'Inspection work');
    expect(session.accumulatedDiveTime, 1200);
    expect(session.syncStatus, SyncStatus.pending); // Default value
  });

  test('getAllDiveSessions returns sessions ordered by date desc', () async {
    final date1 = DateTime.now().subtract(const Duration(days: 1));
    final date2 = DateTime.now();

    await service.createDiveSession(DiveSessionsCompanion(
      date: Value(date1),
      location: const Value('Loc 1'),
      maxDepth: const Value(10),
      bottomTime: const Value(30),
    ));

    await service.createDiveSession(DiveSessionsCompanion(
      date: Value(date2),
      location: const Value('Loc 2'),
      maxDepth: const Value(20),
      bottomTime: const Value(40),
    ));

    final sessions = await service.getAllDiveSessions();
    expect(sessions.length, 2);
    expect(sessions.first.location, 'Loc 2'); // Newer date first
    expect(sessions.last.location, 'Loc 1');
  });

  test('markAsSynced updates status and firestoreId', () async {
    final id = await service.createDiveSession(DiveSessionsCompanion(
      date: Value(DateTime.now()),
      location: const Value('Loc'),
      maxDepth: const Value(10),
      bottomTime: const Value(30),
    ));

    await service.markAsSynced(id, 'remote-123');

    final session = await service.getDiveSession(id);
    expect(session!.syncStatus, SyncStatus.synced);
    expect(session.firestoreId, 'remote-123');
  });
}