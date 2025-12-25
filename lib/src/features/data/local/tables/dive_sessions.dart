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
  TextColumn get firestoreId => text().nullable().unique()(); // Firebase document ID
  
  // Sync status fields
  IntColumn get syncStatus => integer().map(const SyncStatusConverter()).withDefault(const Constant(1))(); // Default to 'pending' (index 1)
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
  
  // --- General Information (Información General) ---
  DateTimeColumn get date => dateTime()();
  TextColumn get location => text()(); // Lugar de Buceo
  TextColumn get client => text().nullable()(); // Cliente
  TextColumn get diveOperator => text().nullable()(); // Operadora de Buceo
  TextColumn get operatorAddress => text().nullable()(); // Direccion de la Operadora
  TextColumn get diveType => text().nullable()(); // Tipo de Buceo (Scuba, Asist. Superficie, Altura Geografica, Saturacion)
  TextColumn get diversNames => text().nullable()(); // Nombre de Buzos (Replaces 'buddy')
  
  // --- Session Details (Detalles de la sesión) ---
  DateTimeColumn get entryTime => dateTime().nullable()(); // Hora de entrada
  DateTimeColumn get exitTime => dateTime().nullable()(); // Hora de Salida
  RealColumn get maxDepth => real()(); // Maxima profundidad
  IntColumn get surfaceInterval => integer().nullable()(); // Tiempo de intervalo en superficie (minutes)
  IntColumn get bottomTime => integer()(); // Tiempo de fondo (minutes)
  DateTimeColumn get decompressionStart => dateTime().nullable()(); // Inicio de descompresion
  DateTimeColumn get decompressionComplete => dateTime().nullable()(); // Descompresion completa
  IntColumn get totalDiveTime => integer().nullable()(); // Tiempo Total de inmersion (minutes)
  
  // --- Technical & Work (Técnico y Trabajo) ---
  TextColumn get gasMixture => text().nullable()(); // Mezcla Utilizada
  TextColumn get workDescription => text().nullable()(); // Descripcion de trabajo (Replaces 'notes')
  TextColumn get decompressionUsed => text().nullable()(); // Descompresion utilizada
  TextColumn get illnessOrInjury => text().nullable()(); // Enfermedad o lesion
  TextColumn get diveSupervisor => text().nullable()(); // Supervisor de Buceo
  
  // --- Accumulated Times (Tiempos Acumulados) ---
  IntColumn get accumulatedSupervisionTime => integer().nullable()(); // Tiempo de supervision acumulado
  IntColumn get accumulatedDiveTime => integer().nullable()(); // Tiempo de Buceo Acumulado
  
  // --- PDF path for local storage ---
  TextColumn get localPdfPath => text().nullable()();
}