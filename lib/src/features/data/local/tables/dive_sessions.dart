import 'package:drift/drift.dart';

// Enum for sync status
enum SyncStatus { synced, pending, failed }

class SyncStatusConverter extends TypeConverter<SyncStatus, int> {
  const SyncStatusConverter();
  @override
  SyncStatus fromSql(int fromDb) => SyncStatus.values[fromDb];
  @override
  int toSql(SyncStatus value) => value.index;
}

@DataClassName('DiveSession')
class DiveSessions extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get firestoreId =>
      text().nullable().unique()(); // Firebase document ID

  // Sync status fields
  IntColumn get syncStatus => integer()
      .map(const SyncStatusConverter())
      .withDefault(const Constant(1))(); // Default to 'pending' (index 1)
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();

  // Dive Session Fields
  DateTimeColumn get date => dateTime()();
  TextColumn get location => text()(); // Lugar de Buceo (General Area)
  TextColumn get diveSite => text()(); // Sitio de Buceo (Specific Spot)

  TextColumn get client => text().nullable()(); // Cliente (if applicable)
  TextColumn get diveOperator => text().nullable()(); // Operador de Buceo

  RealColumn get maxDepth => real()(); // Profundidad Máxima (meters)
  IntColumn get bottomTime => integer()(); // Tiempo de Fondo (minutes)

  TextColumn get buddy => text().nullable()(); // Compañero
  TextColumn get notes => text().nullable()(); // Notas

  // PDF path for local storage
  TextColumn get localPdfPath => text().nullable()();
}
