// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $DiveSessionsTable extends DiveSessions
    with TableInfo<$DiveSessionsTable, DiveSession> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DiveSessionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _firestoreIdMeta = const VerificationMeta(
    'firestoreId',
  );
  @override
  late final GeneratedColumn<String> firestoreId = GeneratedColumn<String>(
    'firestore_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  @override
  late final GeneratedColumnWithTypeConverter<SyncStatus, int> syncStatus =
      GeneratedColumn<int>(
        'sync_status',
        aliasedName,
        false,
        type: DriftSqlType.int,
        requiredDuringInsert: false,
        defaultValue: const Constant(1),
      ).withConverter<SyncStatus>($DiveSessionsTable.$convertersyncStatus);
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _locationMeta = const VerificationMeta(
    'location',
  );
  @override
  late final GeneratedColumn<String> location = GeneratedColumn<String>(
    'location',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _clientMeta = const VerificationMeta('client');
  @override
  late final GeneratedColumn<String> client = GeneratedColumn<String>(
    'client',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _diveOperatorMeta = const VerificationMeta(
    'diveOperator',
  );
  @override
  late final GeneratedColumn<String> diveOperator = GeneratedColumn<String>(
    'dive_operator',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _operatorAddressMeta = const VerificationMeta(
    'operatorAddress',
  );
  @override
  late final GeneratedColumn<String> operatorAddress = GeneratedColumn<String>(
    'operator_address',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _diveTypeMeta = const VerificationMeta(
    'diveType',
  );
  @override
  late final GeneratedColumn<String> diveType = GeneratedColumn<String>(
    'dive_type',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _diversNamesMeta = const VerificationMeta(
    'diversNames',
  );
  @override
  late final GeneratedColumn<String> diversNames = GeneratedColumn<String>(
    'divers_names',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _entryTimeMeta = const VerificationMeta(
    'entryTime',
  );
  @override
  late final GeneratedColumn<DateTime> entryTime = GeneratedColumn<DateTime>(
    'entry_time',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _exitTimeMeta = const VerificationMeta(
    'exitTime',
  );
  @override
  late final GeneratedColumn<DateTime> exitTime = GeneratedColumn<DateTime>(
    'exit_time',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _maxDepthMeta = const VerificationMeta(
    'maxDepth',
  );
  @override
  late final GeneratedColumn<double> maxDepth = GeneratedColumn<double>(
    'max_depth',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _surfaceIntervalMeta = const VerificationMeta(
    'surfaceInterval',
  );
  @override
  late final GeneratedColumn<int> surfaceInterval = GeneratedColumn<int>(
    'surface_interval',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _bottomTimeMeta = const VerificationMeta(
    'bottomTime',
  );
  @override
  late final GeneratedColumn<int> bottomTime = GeneratedColumn<int>(
    'bottom_time',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _decompressionStartMeta =
      const VerificationMeta('decompressionStart');
  @override
  late final GeneratedColumn<DateTime> decompressionStart =
      GeneratedColumn<DateTime>(
        'decompression_start',
        aliasedName,
        true,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _decompressionCompleteMeta =
      const VerificationMeta('decompressionComplete');
  @override
  late final GeneratedColumn<DateTime> decompressionComplete =
      GeneratedColumn<DateTime>(
        'decompression_complete',
        aliasedName,
        true,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _totalDiveTimeMeta = const VerificationMeta(
    'totalDiveTime',
  );
  @override
  late final GeneratedColumn<int> totalDiveTime = GeneratedColumn<int>(
    'total_dive_time',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _gasMixtureMeta = const VerificationMeta(
    'gasMixture',
  );
  @override
  late final GeneratedColumn<String> gasMixture = GeneratedColumn<String>(
    'gas_mixture',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _workDescriptionMeta = const VerificationMeta(
    'workDescription',
  );
  @override
  late final GeneratedColumn<String> workDescription = GeneratedColumn<String>(
    'work_description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _decompressionUsedMeta = const VerificationMeta(
    'decompressionUsed',
  );
  @override
  late final GeneratedColumn<String> decompressionUsed =
      GeneratedColumn<String>(
        'decompression_used',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _illnessOrInjuryMeta = const VerificationMeta(
    'illnessOrInjury',
  );
  @override
  late final GeneratedColumn<String> illnessOrInjury = GeneratedColumn<String>(
    'illness_or_injury',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _diveSupervisorMeta = const VerificationMeta(
    'diveSupervisor',
  );
  @override
  late final GeneratedColumn<String> diveSupervisor = GeneratedColumn<String>(
    'dive_supervisor',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _accumulatedSupervisionTimeMeta =
      const VerificationMeta('accumulatedSupervisionTime');
  @override
  late final GeneratedColumn<int> accumulatedSupervisionTime =
      GeneratedColumn<int>(
        'accumulated_supervision_time',
        aliasedName,
        true,
        type: DriftSqlType.int,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _accumulatedDiveTimeMeta =
      const VerificationMeta('accumulatedDiveTime');
  @override
  late final GeneratedColumn<int> accumulatedDiveTime = GeneratedColumn<int>(
    'accumulated_dive_time',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _localPdfPathMeta = const VerificationMeta(
    'localPdfPath',
  );
  @override
  late final GeneratedColumn<String> localPdfPath = GeneratedColumn<String>(
    'local_pdf_path',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    firestoreId,
    syncStatus,
    updatedAt,
    date,
    location,
    client,
    diveOperator,
    operatorAddress,
    diveType,
    diversNames,
    entryTime,
    exitTime,
    maxDepth,
    surfaceInterval,
    bottomTime,
    decompressionStart,
    decompressionComplete,
    totalDiveTime,
    gasMixture,
    workDescription,
    decompressionUsed,
    illnessOrInjury,
    diveSupervisor,
    accumulatedSupervisionTime,
    accumulatedDiveTime,
    localPdfPath,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'dive_sessions';
  @override
  VerificationContext validateIntegrity(
    Insertable<DiveSession> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('firestore_id')) {
      context.handle(
        _firestoreIdMeta,
        firestoreId.isAcceptableOrUnknown(
          data['firestore_id']!,
          _firestoreIdMeta,
        ),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('location')) {
      context.handle(
        _locationMeta,
        location.isAcceptableOrUnknown(data['location']!, _locationMeta),
      );
    } else if (isInserting) {
      context.missing(_locationMeta);
    }
    if (data.containsKey('client')) {
      context.handle(
        _clientMeta,
        client.isAcceptableOrUnknown(data['client']!, _clientMeta),
      );
    }
    if (data.containsKey('dive_operator')) {
      context.handle(
        _diveOperatorMeta,
        diveOperator.isAcceptableOrUnknown(
          data['dive_operator']!,
          _diveOperatorMeta,
        ),
      );
    }
    if (data.containsKey('operator_address')) {
      context.handle(
        _operatorAddressMeta,
        operatorAddress.isAcceptableOrUnknown(
          data['operator_address']!,
          _operatorAddressMeta,
        ),
      );
    }
    if (data.containsKey('dive_type')) {
      context.handle(
        _diveTypeMeta,
        diveType.isAcceptableOrUnknown(data['dive_type']!, _diveTypeMeta),
      );
    }
    if (data.containsKey('divers_names')) {
      context.handle(
        _diversNamesMeta,
        diversNames.isAcceptableOrUnknown(
          data['divers_names']!,
          _diversNamesMeta,
        ),
      );
    }
    if (data.containsKey('entry_time')) {
      context.handle(
        _entryTimeMeta,
        entryTime.isAcceptableOrUnknown(data['entry_time']!, _entryTimeMeta),
      );
    }
    if (data.containsKey('exit_time')) {
      context.handle(
        _exitTimeMeta,
        exitTime.isAcceptableOrUnknown(data['exit_time']!, _exitTimeMeta),
      );
    }
    if (data.containsKey('max_depth')) {
      context.handle(
        _maxDepthMeta,
        maxDepth.isAcceptableOrUnknown(data['max_depth']!, _maxDepthMeta),
      );
    } else if (isInserting) {
      context.missing(_maxDepthMeta);
    }
    if (data.containsKey('surface_interval')) {
      context.handle(
        _surfaceIntervalMeta,
        surfaceInterval.isAcceptableOrUnknown(
          data['surface_interval']!,
          _surfaceIntervalMeta,
        ),
      );
    }
    if (data.containsKey('bottom_time')) {
      context.handle(
        _bottomTimeMeta,
        bottomTime.isAcceptableOrUnknown(data['bottom_time']!, _bottomTimeMeta),
      );
    } else if (isInserting) {
      context.missing(_bottomTimeMeta);
    }
    if (data.containsKey('decompression_start')) {
      context.handle(
        _decompressionStartMeta,
        decompressionStart.isAcceptableOrUnknown(
          data['decompression_start']!,
          _decompressionStartMeta,
        ),
      );
    }
    if (data.containsKey('decompression_complete')) {
      context.handle(
        _decompressionCompleteMeta,
        decompressionComplete.isAcceptableOrUnknown(
          data['decompression_complete']!,
          _decompressionCompleteMeta,
        ),
      );
    }
    if (data.containsKey('total_dive_time')) {
      context.handle(
        _totalDiveTimeMeta,
        totalDiveTime.isAcceptableOrUnknown(
          data['total_dive_time']!,
          _totalDiveTimeMeta,
        ),
      );
    }
    if (data.containsKey('gas_mixture')) {
      context.handle(
        _gasMixtureMeta,
        gasMixture.isAcceptableOrUnknown(data['gas_mixture']!, _gasMixtureMeta),
      );
    }
    if (data.containsKey('work_description')) {
      context.handle(
        _workDescriptionMeta,
        workDescription.isAcceptableOrUnknown(
          data['work_description']!,
          _workDescriptionMeta,
        ),
      );
    }
    if (data.containsKey('decompression_used')) {
      context.handle(
        _decompressionUsedMeta,
        decompressionUsed.isAcceptableOrUnknown(
          data['decompression_used']!,
          _decompressionUsedMeta,
        ),
      );
    }
    if (data.containsKey('illness_or_injury')) {
      context.handle(
        _illnessOrInjuryMeta,
        illnessOrInjury.isAcceptableOrUnknown(
          data['illness_or_injury']!,
          _illnessOrInjuryMeta,
        ),
      );
    }
    if (data.containsKey('dive_supervisor')) {
      context.handle(
        _diveSupervisorMeta,
        diveSupervisor.isAcceptableOrUnknown(
          data['dive_supervisor']!,
          _diveSupervisorMeta,
        ),
      );
    }
    if (data.containsKey('accumulated_supervision_time')) {
      context.handle(
        _accumulatedSupervisionTimeMeta,
        accumulatedSupervisionTime.isAcceptableOrUnknown(
          data['accumulated_supervision_time']!,
          _accumulatedSupervisionTimeMeta,
        ),
      );
    }
    if (data.containsKey('accumulated_dive_time')) {
      context.handle(
        _accumulatedDiveTimeMeta,
        accumulatedDiveTime.isAcceptableOrUnknown(
          data['accumulated_dive_time']!,
          _accumulatedDiveTimeMeta,
        ),
      );
    }
    if (data.containsKey('local_pdf_path')) {
      context.handle(
        _localPdfPathMeta,
        localPdfPath.isAcceptableOrUnknown(
          data['local_pdf_path']!,
          _localPdfPathMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DiveSession map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DiveSession(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      firestoreId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}firestore_id'],
      ),
      syncStatus: $DiveSessionsTable.$convertersyncStatus.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}sync_status'],
        )!,
      ),
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}date'],
      )!,
      location: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}location'],
      )!,
      client: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}client'],
      ),
      diveOperator: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}dive_operator'],
      ),
      operatorAddress: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}operator_address'],
      ),
      diveType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}dive_type'],
      ),
      diversNames: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}divers_names'],
      ),
      entryTime: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}entry_time'],
      ),
      exitTime: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}exit_time'],
      ),
      maxDepth: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}max_depth'],
      )!,
      surfaceInterval: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}surface_interval'],
      ),
      bottomTime: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}bottom_time'],
      )!,
      decompressionStart: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}decompression_start'],
      ),
      decompressionComplete: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}decompression_complete'],
      ),
      totalDiveTime: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}total_dive_time'],
      ),
      gasMixture: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}gas_mixture'],
      ),
      workDescription: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}work_description'],
      ),
      decompressionUsed: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}decompression_used'],
      ),
      illnessOrInjury: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}illness_or_injury'],
      ),
      diveSupervisor: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}dive_supervisor'],
      ),
      accumulatedSupervisionTime: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}accumulated_supervision_time'],
      ),
      accumulatedDiveTime: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}accumulated_dive_time'],
      ),
      localPdfPath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}local_pdf_path'],
      ),
    );
  }

  @override
  $DiveSessionsTable createAlias(String alias) {
    return $DiveSessionsTable(attachedDatabase, alias);
  }

  static TypeConverter<SyncStatus, int> $convertersyncStatus =
      const SyncStatusConverter();
}

class DiveSession extends DataClass implements Insertable<DiveSession> {
  final int id;
  final String? firestoreId;
  final SyncStatus syncStatus;
  final DateTime updatedAt;
  final DateTime date;
  final String location;
  final String? client;
  final String? diveOperator;
  final String? operatorAddress;
  final String? diveType;
  final String? diversNames;
  final DateTime? entryTime;
  final DateTime? exitTime;
  final double maxDepth;
  final int? surfaceInterval;
  final int bottomTime;
  final DateTime? decompressionStart;
  final DateTime? decompressionComplete;
  final int? totalDiveTime;
  final String? gasMixture;
  final String? workDescription;
  final String? decompressionUsed;
  final String? illnessOrInjury;
  final String? diveSupervisor;
  final int? accumulatedSupervisionTime;
  final int? accumulatedDiveTime;
  final String? localPdfPath;
  const DiveSession({
    required this.id,
    this.firestoreId,
    required this.syncStatus,
    required this.updatedAt,
    required this.date,
    required this.location,
    this.client,
    this.diveOperator,
    this.operatorAddress,
    this.diveType,
    this.diversNames,
    this.entryTime,
    this.exitTime,
    required this.maxDepth,
    this.surfaceInterval,
    required this.bottomTime,
    this.decompressionStart,
    this.decompressionComplete,
    this.totalDiveTime,
    this.gasMixture,
    this.workDescription,
    this.decompressionUsed,
    this.illnessOrInjury,
    this.diveSupervisor,
    this.accumulatedSupervisionTime,
    this.accumulatedDiveTime,
    this.localPdfPath,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || firestoreId != null) {
      map['firestore_id'] = Variable<String>(firestoreId);
    }
    {
      map['sync_status'] = Variable<int>(
        $DiveSessionsTable.$convertersyncStatus.toSql(syncStatus),
      );
    }
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['date'] = Variable<DateTime>(date);
    map['location'] = Variable<String>(location);
    if (!nullToAbsent || client != null) {
      map['client'] = Variable<String>(client);
    }
    if (!nullToAbsent || diveOperator != null) {
      map['dive_operator'] = Variable<String>(diveOperator);
    }
    if (!nullToAbsent || operatorAddress != null) {
      map['operator_address'] = Variable<String>(operatorAddress);
    }
    if (!nullToAbsent || diveType != null) {
      map['dive_type'] = Variable<String>(diveType);
    }
    if (!nullToAbsent || diversNames != null) {
      map['divers_names'] = Variable<String>(diversNames);
    }
    if (!nullToAbsent || entryTime != null) {
      map['entry_time'] = Variable<DateTime>(entryTime);
    }
    if (!nullToAbsent || exitTime != null) {
      map['exit_time'] = Variable<DateTime>(exitTime);
    }
    map['max_depth'] = Variable<double>(maxDepth);
    if (!nullToAbsent || surfaceInterval != null) {
      map['surface_interval'] = Variable<int>(surfaceInterval);
    }
    map['bottom_time'] = Variable<int>(bottomTime);
    if (!nullToAbsent || decompressionStart != null) {
      map['decompression_start'] = Variable<DateTime>(decompressionStart);
    }
    if (!nullToAbsent || decompressionComplete != null) {
      map['decompression_complete'] = Variable<DateTime>(decompressionComplete);
    }
    if (!nullToAbsent || totalDiveTime != null) {
      map['total_dive_time'] = Variable<int>(totalDiveTime);
    }
    if (!nullToAbsent || gasMixture != null) {
      map['gas_mixture'] = Variable<String>(gasMixture);
    }
    if (!nullToAbsent || workDescription != null) {
      map['work_description'] = Variable<String>(workDescription);
    }
    if (!nullToAbsent || decompressionUsed != null) {
      map['decompression_used'] = Variable<String>(decompressionUsed);
    }
    if (!nullToAbsent || illnessOrInjury != null) {
      map['illness_or_injury'] = Variable<String>(illnessOrInjury);
    }
    if (!nullToAbsent || diveSupervisor != null) {
      map['dive_supervisor'] = Variable<String>(diveSupervisor);
    }
    if (!nullToAbsent || accumulatedSupervisionTime != null) {
      map['accumulated_supervision_time'] = Variable<int>(
        accumulatedSupervisionTime,
      );
    }
    if (!nullToAbsent || accumulatedDiveTime != null) {
      map['accumulated_dive_time'] = Variable<int>(accumulatedDiveTime);
    }
    if (!nullToAbsent || localPdfPath != null) {
      map['local_pdf_path'] = Variable<String>(localPdfPath);
    }
    return map;
  }

  DiveSessionsCompanion toCompanion(bool nullToAbsent) {
    return DiveSessionsCompanion(
      id: Value(id),
      firestoreId: firestoreId == null && nullToAbsent
          ? const Value.absent()
          : Value(firestoreId),
      syncStatus: Value(syncStatus),
      updatedAt: Value(updatedAt),
      date: Value(date),
      location: Value(location),
      client: client == null && nullToAbsent
          ? const Value.absent()
          : Value(client),
      diveOperator: diveOperator == null && nullToAbsent
          ? const Value.absent()
          : Value(diveOperator),
      operatorAddress: operatorAddress == null && nullToAbsent
          ? const Value.absent()
          : Value(operatorAddress),
      diveType: diveType == null && nullToAbsent
          ? const Value.absent()
          : Value(diveType),
      diversNames: diversNames == null && nullToAbsent
          ? const Value.absent()
          : Value(diversNames),
      entryTime: entryTime == null && nullToAbsent
          ? const Value.absent()
          : Value(entryTime),
      exitTime: exitTime == null && nullToAbsent
          ? const Value.absent()
          : Value(exitTime),
      maxDepth: Value(maxDepth),
      surfaceInterval: surfaceInterval == null && nullToAbsent
          ? const Value.absent()
          : Value(surfaceInterval),
      bottomTime: Value(bottomTime),
      decompressionStart: decompressionStart == null && nullToAbsent
          ? const Value.absent()
          : Value(decompressionStart),
      decompressionComplete: decompressionComplete == null && nullToAbsent
          ? const Value.absent()
          : Value(decompressionComplete),
      totalDiveTime: totalDiveTime == null && nullToAbsent
          ? const Value.absent()
          : Value(totalDiveTime),
      gasMixture: gasMixture == null && nullToAbsent
          ? const Value.absent()
          : Value(gasMixture),
      workDescription: workDescription == null && nullToAbsent
          ? const Value.absent()
          : Value(workDescription),
      decompressionUsed: decompressionUsed == null && nullToAbsent
          ? const Value.absent()
          : Value(decompressionUsed),
      illnessOrInjury: illnessOrInjury == null && nullToAbsent
          ? const Value.absent()
          : Value(illnessOrInjury),
      diveSupervisor: diveSupervisor == null && nullToAbsent
          ? const Value.absent()
          : Value(diveSupervisor),
      accumulatedSupervisionTime:
          accumulatedSupervisionTime == null && nullToAbsent
          ? const Value.absent()
          : Value(accumulatedSupervisionTime),
      accumulatedDiveTime: accumulatedDiveTime == null && nullToAbsent
          ? const Value.absent()
          : Value(accumulatedDiveTime),
      localPdfPath: localPdfPath == null && nullToAbsent
          ? const Value.absent()
          : Value(localPdfPath),
    );
  }

  factory DiveSession.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DiveSession(
      id: serializer.fromJson<int>(json['id']),
      firestoreId: serializer.fromJson<String?>(json['firestoreId']),
      syncStatus: serializer.fromJson<SyncStatus>(json['syncStatus']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      date: serializer.fromJson<DateTime>(json['date']),
      location: serializer.fromJson<String>(json['location']),
      client: serializer.fromJson<String?>(json['client']),
      diveOperator: serializer.fromJson<String?>(json['diveOperator']),
      operatorAddress: serializer.fromJson<String?>(json['operatorAddress']),
      diveType: serializer.fromJson<String?>(json['diveType']),
      diversNames: serializer.fromJson<String?>(json['diversNames']),
      entryTime: serializer.fromJson<DateTime?>(json['entryTime']),
      exitTime: serializer.fromJson<DateTime?>(json['exitTime']),
      maxDepth: serializer.fromJson<double>(json['maxDepth']),
      surfaceInterval: serializer.fromJson<int?>(json['surfaceInterval']),
      bottomTime: serializer.fromJson<int>(json['bottomTime']),
      decompressionStart: serializer.fromJson<DateTime?>(
        json['decompressionStart'],
      ),
      decompressionComplete: serializer.fromJson<DateTime?>(
        json['decompressionComplete'],
      ),
      totalDiveTime: serializer.fromJson<int?>(json['totalDiveTime']),
      gasMixture: serializer.fromJson<String?>(json['gasMixture']),
      workDescription: serializer.fromJson<String?>(json['workDescription']),
      decompressionUsed: serializer.fromJson<String?>(
        json['decompressionUsed'],
      ),
      illnessOrInjury: serializer.fromJson<String?>(json['illnessOrInjury']),
      diveSupervisor: serializer.fromJson<String?>(json['diveSupervisor']),
      accumulatedSupervisionTime: serializer.fromJson<int?>(
        json['accumulatedSupervisionTime'],
      ),
      accumulatedDiveTime: serializer.fromJson<int?>(
        json['accumulatedDiveTime'],
      ),
      localPdfPath: serializer.fromJson<String?>(json['localPdfPath']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'firestoreId': serializer.toJson<String?>(firestoreId),
      'syncStatus': serializer.toJson<SyncStatus>(syncStatus),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'date': serializer.toJson<DateTime>(date),
      'location': serializer.toJson<String>(location),
      'client': serializer.toJson<String?>(client),
      'diveOperator': serializer.toJson<String?>(diveOperator),
      'operatorAddress': serializer.toJson<String?>(operatorAddress),
      'diveType': serializer.toJson<String?>(diveType),
      'diversNames': serializer.toJson<String?>(diversNames),
      'entryTime': serializer.toJson<DateTime?>(entryTime),
      'exitTime': serializer.toJson<DateTime?>(exitTime),
      'maxDepth': serializer.toJson<double>(maxDepth),
      'surfaceInterval': serializer.toJson<int?>(surfaceInterval),
      'bottomTime': serializer.toJson<int>(bottomTime),
      'decompressionStart': serializer.toJson<DateTime?>(decompressionStart),
      'decompressionComplete': serializer.toJson<DateTime?>(
        decompressionComplete,
      ),
      'totalDiveTime': serializer.toJson<int?>(totalDiveTime),
      'gasMixture': serializer.toJson<String?>(gasMixture),
      'workDescription': serializer.toJson<String?>(workDescription),
      'decompressionUsed': serializer.toJson<String?>(decompressionUsed),
      'illnessOrInjury': serializer.toJson<String?>(illnessOrInjury),
      'diveSupervisor': serializer.toJson<String?>(diveSupervisor),
      'accumulatedSupervisionTime': serializer.toJson<int?>(
        accumulatedSupervisionTime,
      ),
      'accumulatedDiveTime': serializer.toJson<int?>(accumulatedDiveTime),
      'localPdfPath': serializer.toJson<String?>(localPdfPath),
    };
  }

  DiveSession copyWith({
    int? id,
    Value<String?> firestoreId = const Value.absent(),
    SyncStatus? syncStatus,
    DateTime? updatedAt,
    DateTime? date,
    String? location,
    Value<String?> client = const Value.absent(),
    Value<String?> diveOperator = const Value.absent(),
    Value<String?> operatorAddress = const Value.absent(),
    Value<String?> diveType = const Value.absent(),
    Value<String?> diversNames = const Value.absent(),
    Value<DateTime?> entryTime = const Value.absent(),
    Value<DateTime?> exitTime = const Value.absent(),
    double? maxDepth,
    Value<int?> surfaceInterval = const Value.absent(),
    int? bottomTime,
    Value<DateTime?> decompressionStart = const Value.absent(),
    Value<DateTime?> decompressionComplete = const Value.absent(),
    Value<int?> totalDiveTime = const Value.absent(),
    Value<String?> gasMixture = const Value.absent(),
    Value<String?> workDescription = const Value.absent(),
    Value<String?> decompressionUsed = const Value.absent(),
    Value<String?> illnessOrInjury = const Value.absent(),
    Value<String?> diveSupervisor = const Value.absent(),
    Value<int?> accumulatedSupervisionTime = const Value.absent(),
    Value<int?> accumulatedDiveTime = const Value.absent(),
    Value<String?> localPdfPath = const Value.absent(),
  }) => DiveSession(
    id: id ?? this.id,
    firestoreId: firestoreId.present ? firestoreId.value : this.firestoreId,
    syncStatus: syncStatus ?? this.syncStatus,
    updatedAt: updatedAt ?? this.updatedAt,
    date: date ?? this.date,
    location: location ?? this.location,
    client: client.present ? client.value : this.client,
    diveOperator: diveOperator.present ? diveOperator.value : this.diveOperator,
    operatorAddress: operatorAddress.present
        ? operatorAddress.value
        : this.operatorAddress,
    diveType: diveType.present ? diveType.value : this.diveType,
    diversNames: diversNames.present ? diversNames.value : this.diversNames,
    entryTime: entryTime.present ? entryTime.value : this.entryTime,
    exitTime: exitTime.present ? exitTime.value : this.exitTime,
    maxDepth: maxDepth ?? this.maxDepth,
    surfaceInterval: surfaceInterval.present
        ? surfaceInterval.value
        : this.surfaceInterval,
    bottomTime: bottomTime ?? this.bottomTime,
    decompressionStart: decompressionStart.present
        ? decompressionStart.value
        : this.decompressionStart,
    decompressionComplete: decompressionComplete.present
        ? decompressionComplete.value
        : this.decompressionComplete,
    totalDiveTime: totalDiveTime.present
        ? totalDiveTime.value
        : this.totalDiveTime,
    gasMixture: gasMixture.present ? gasMixture.value : this.gasMixture,
    workDescription: workDescription.present
        ? workDescription.value
        : this.workDescription,
    decompressionUsed: decompressionUsed.present
        ? decompressionUsed.value
        : this.decompressionUsed,
    illnessOrInjury: illnessOrInjury.present
        ? illnessOrInjury.value
        : this.illnessOrInjury,
    diveSupervisor: diveSupervisor.present
        ? diveSupervisor.value
        : this.diveSupervisor,
    accumulatedSupervisionTime: accumulatedSupervisionTime.present
        ? accumulatedSupervisionTime.value
        : this.accumulatedSupervisionTime,
    accumulatedDiveTime: accumulatedDiveTime.present
        ? accumulatedDiveTime.value
        : this.accumulatedDiveTime,
    localPdfPath: localPdfPath.present ? localPdfPath.value : this.localPdfPath,
  );
  DiveSession copyWithCompanion(DiveSessionsCompanion data) {
    return DiveSession(
      id: data.id.present ? data.id.value : this.id,
      firestoreId: data.firestoreId.present
          ? data.firestoreId.value
          : this.firestoreId,
      syncStatus: data.syncStatus.present
          ? data.syncStatus.value
          : this.syncStatus,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      date: data.date.present ? data.date.value : this.date,
      location: data.location.present ? data.location.value : this.location,
      client: data.client.present ? data.client.value : this.client,
      diveOperator: data.diveOperator.present
          ? data.diveOperator.value
          : this.diveOperator,
      operatorAddress: data.operatorAddress.present
          ? data.operatorAddress.value
          : this.operatorAddress,
      diveType: data.diveType.present ? data.diveType.value : this.diveType,
      diversNames: data.diversNames.present
          ? data.diversNames.value
          : this.diversNames,
      entryTime: data.entryTime.present ? data.entryTime.value : this.entryTime,
      exitTime: data.exitTime.present ? data.exitTime.value : this.exitTime,
      maxDepth: data.maxDepth.present ? data.maxDepth.value : this.maxDepth,
      surfaceInterval: data.surfaceInterval.present
          ? data.surfaceInterval.value
          : this.surfaceInterval,
      bottomTime: data.bottomTime.present
          ? data.bottomTime.value
          : this.bottomTime,
      decompressionStart: data.decompressionStart.present
          ? data.decompressionStart.value
          : this.decompressionStart,
      decompressionComplete: data.decompressionComplete.present
          ? data.decompressionComplete.value
          : this.decompressionComplete,
      totalDiveTime: data.totalDiveTime.present
          ? data.totalDiveTime.value
          : this.totalDiveTime,
      gasMixture: data.gasMixture.present
          ? data.gasMixture.value
          : this.gasMixture,
      workDescription: data.workDescription.present
          ? data.workDescription.value
          : this.workDescription,
      decompressionUsed: data.decompressionUsed.present
          ? data.decompressionUsed.value
          : this.decompressionUsed,
      illnessOrInjury: data.illnessOrInjury.present
          ? data.illnessOrInjury.value
          : this.illnessOrInjury,
      diveSupervisor: data.diveSupervisor.present
          ? data.diveSupervisor.value
          : this.diveSupervisor,
      accumulatedSupervisionTime: data.accumulatedSupervisionTime.present
          ? data.accumulatedSupervisionTime.value
          : this.accumulatedSupervisionTime,
      accumulatedDiveTime: data.accumulatedDiveTime.present
          ? data.accumulatedDiveTime.value
          : this.accumulatedDiveTime,
      localPdfPath: data.localPdfPath.present
          ? data.localPdfPath.value
          : this.localPdfPath,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DiveSession(')
          ..write('id: $id, ')
          ..write('firestoreId: $firestoreId, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('date: $date, ')
          ..write('location: $location, ')
          ..write('client: $client, ')
          ..write('diveOperator: $diveOperator, ')
          ..write('operatorAddress: $operatorAddress, ')
          ..write('diveType: $diveType, ')
          ..write('diversNames: $diversNames, ')
          ..write('entryTime: $entryTime, ')
          ..write('exitTime: $exitTime, ')
          ..write('maxDepth: $maxDepth, ')
          ..write('surfaceInterval: $surfaceInterval, ')
          ..write('bottomTime: $bottomTime, ')
          ..write('decompressionStart: $decompressionStart, ')
          ..write('decompressionComplete: $decompressionComplete, ')
          ..write('totalDiveTime: $totalDiveTime, ')
          ..write('gasMixture: $gasMixture, ')
          ..write('workDescription: $workDescription, ')
          ..write('decompressionUsed: $decompressionUsed, ')
          ..write('illnessOrInjury: $illnessOrInjury, ')
          ..write('diveSupervisor: $diveSupervisor, ')
          ..write('accumulatedSupervisionTime: $accumulatedSupervisionTime, ')
          ..write('accumulatedDiveTime: $accumulatedDiveTime, ')
          ..write('localPdfPath: $localPdfPath')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    firestoreId,
    syncStatus,
    updatedAt,
    date,
    location,
    client,
    diveOperator,
    operatorAddress,
    diveType,
    diversNames,
    entryTime,
    exitTime,
    maxDepth,
    surfaceInterval,
    bottomTime,
    decompressionStart,
    decompressionComplete,
    totalDiveTime,
    gasMixture,
    workDescription,
    decompressionUsed,
    illnessOrInjury,
    diveSupervisor,
    accumulatedSupervisionTime,
    accumulatedDiveTime,
    localPdfPath,
  ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DiveSession &&
          other.id == this.id &&
          other.firestoreId == this.firestoreId &&
          other.syncStatus == this.syncStatus &&
          other.updatedAt == this.updatedAt &&
          other.date == this.date &&
          other.location == this.location &&
          other.client == this.client &&
          other.diveOperator == this.diveOperator &&
          other.operatorAddress == this.operatorAddress &&
          other.diveType == this.diveType &&
          other.diversNames == this.diversNames &&
          other.entryTime == this.entryTime &&
          other.exitTime == this.exitTime &&
          other.maxDepth == this.maxDepth &&
          other.surfaceInterval == this.surfaceInterval &&
          other.bottomTime == this.bottomTime &&
          other.decompressionStart == this.decompressionStart &&
          other.decompressionComplete == this.decompressionComplete &&
          other.totalDiveTime == this.totalDiveTime &&
          other.gasMixture == this.gasMixture &&
          other.workDescription == this.workDescription &&
          other.decompressionUsed == this.decompressionUsed &&
          other.illnessOrInjury == this.illnessOrInjury &&
          other.diveSupervisor == this.diveSupervisor &&
          other.accumulatedSupervisionTime == this.accumulatedSupervisionTime &&
          other.accumulatedDiveTime == this.accumulatedDiveTime &&
          other.localPdfPath == this.localPdfPath);
}

class DiveSessionsCompanion extends UpdateCompanion<DiveSession> {
  final Value<int> id;
  final Value<String?> firestoreId;
  final Value<SyncStatus> syncStatus;
  final Value<DateTime> updatedAt;
  final Value<DateTime> date;
  final Value<String> location;
  final Value<String?> client;
  final Value<String?> diveOperator;
  final Value<String?> operatorAddress;
  final Value<String?> diveType;
  final Value<String?> diversNames;
  final Value<DateTime?> entryTime;
  final Value<DateTime?> exitTime;
  final Value<double> maxDepth;
  final Value<int?> surfaceInterval;
  final Value<int> bottomTime;
  final Value<DateTime?> decompressionStart;
  final Value<DateTime?> decompressionComplete;
  final Value<int?> totalDiveTime;
  final Value<String?> gasMixture;
  final Value<String?> workDescription;
  final Value<String?> decompressionUsed;
  final Value<String?> illnessOrInjury;
  final Value<String?> diveSupervisor;
  final Value<int?> accumulatedSupervisionTime;
  final Value<int?> accumulatedDiveTime;
  final Value<String?> localPdfPath;
  const DiveSessionsCompanion({
    this.id = const Value.absent(),
    this.firestoreId = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.date = const Value.absent(),
    this.location = const Value.absent(),
    this.client = const Value.absent(),
    this.diveOperator = const Value.absent(),
    this.operatorAddress = const Value.absent(),
    this.diveType = const Value.absent(),
    this.diversNames = const Value.absent(),
    this.entryTime = const Value.absent(),
    this.exitTime = const Value.absent(),
    this.maxDepth = const Value.absent(),
    this.surfaceInterval = const Value.absent(),
    this.bottomTime = const Value.absent(),
    this.decompressionStart = const Value.absent(),
    this.decompressionComplete = const Value.absent(),
    this.totalDiveTime = const Value.absent(),
    this.gasMixture = const Value.absent(),
    this.workDescription = const Value.absent(),
    this.decompressionUsed = const Value.absent(),
    this.illnessOrInjury = const Value.absent(),
    this.diveSupervisor = const Value.absent(),
    this.accumulatedSupervisionTime = const Value.absent(),
    this.accumulatedDiveTime = const Value.absent(),
    this.localPdfPath = const Value.absent(),
  });
  DiveSessionsCompanion.insert({
    this.id = const Value.absent(),
    this.firestoreId = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.updatedAt = const Value.absent(),
    required DateTime date,
    required String location,
    this.client = const Value.absent(),
    this.diveOperator = const Value.absent(),
    this.operatorAddress = const Value.absent(),
    this.diveType = const Value.absent(),
    this.diversNames = const Value.absent(),
    this.entryTime = const Value.absent(),
    this.exitTime = const Value.absent(),
    required double maxDepth,
    this.surfaceInterval = const Value.absent(),
    required int bottomTime,
    this.decompressionStart = const Value.absent(),
    this.decompressionComplete = const Value.absent(),
    this.totalDiveTime = const Value.absent(),
    this.gasMixture = const Value.absent(),
    this.workDescription = const Value.absent(),
    this.decompressionUsed = const Value.absent(),
    this.illnessOrInjury = const Value.absent(),
    this.diveSupervisor = const Value.absent(),
    this.accumulatedSupervisionTime = const Value.absent(),
    this.accumulatedDiveTime = const Value.absent(),
    this.localPdfPath = const Value.absent(),
  }) : date = Value(date),
       location = Value(location),
       maxDepth = Value(maxDepth),
       bottomTime = Value(bottomTime);
  static Insertable<DiveSession> custom({
    Expression<int>? id,
    Expression<String>? firestoreId,
    Expression<int>? syncStatus,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? date,
    Expression<String>? location,
    Expression<String>? client,
    Expression<String>? diveOperator,
    Expression<String>? operatorAddress,
    Expression<String>? diveType,
    Expression<String>? diversNames,
    Expression<DateTime>? entryTime,
    Expression<DateTime>? exitTime,
    Expression<double>? maxDepth,
    Expression<int>? surfaceInterval,
    Expression<int>? bottomTime,
    Expression<DateTime>? decompressionStart,
    Expression<DateTime>? decompressionComplete,
    Expression<int>? totalDiveTime,
    Expression<String>? gasMixture,
    Expression<String>? workDescription,
    Expression<String>? decompressionUsed,
    Expression<String>? illnessOrInjury,
    Expression<String>? diveSupervisor,
    Expression<int>? accumulatedSupervisionTime,
    Expression<int>? accumulatedDiveTime,
    Expression<String>? localPdfPath,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (firestoreId != null) 'firestore_id': firestoreId,
      if (syncStatus != null) 'sync_status': syncStatus,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (date != null) 'date': date,
      if (location != null) 'location': location,
      if (client != null) 'client': client,
      if (diveOperator != null) 'dive_operator': diveOperator,
      if (operatorAddress != null) 'operator_address': operatorAddress,
      if (diveType != null) 'dive_type': diveType,
      if (diversNames != null) 'divers_names': diversNames,
      if (entryTime != null) 'entry_time': entryTime,
      if (exitTime != null) 'exit_time': exitTime,
      if (maxDepth != null) 'max_depth': maxDepth,
      if (surfaceInterval != null) 'surface_interval': surfaceInterval,
      if (bottomTime != null) 'bottom_time': bottomTime,
      if (decompressionStart != null) 'decompression_start': decompressionStart,
      if (decompressionComplete != null)
        'decompression_complete': decompressionComplete,
      if (totalDiveTime != null) 'total_dive_time': totalDiveTime,
      if (gasMixture != null) 'gas_mixture': gasMixture,
      if (workDescription != null) 'work_description': workDescription,
      if (decompressionUsed != null) 'decompression_used': decompressionUsed,
      if (illnessOrInjury != null) 'illness_or_injury': illnessOrInjury,
      if (diveSupervisor != null) 'dive_supervisor': diveSupervisor,
      if (accumulatedSupervisionTime != null)
        'accumulated_supervision_time': accumulatedSupervisionTime,
      if (accumulatedDiveTime != null)
        'accumulated_dive_time': accumulatedDiveTime,
      if (localPdfPath != null) 'local_pdf_path': localPdfPath,
    });
  }

  DiveSessionsCompanion copyWith({
    Value<int>? id,
    Value<String?>? firestoreId,
    Value<SyncStatus>? syncStatus,
    Value<DateTime>? updatedAt,
    Value<DateTime>? date,
    Value<String>? location,
    Value<String?>? client,
    Value<String?>? diveOperator,
    Value<String?>? operatorAddress,
    Value<String?>? diveType,
    Value<String?>? diversNames,
    Value<DateTime?>? entryTime,
    Value<DateTime?>? exitTime,
    Value<double>? maxDepth,
    Value<int?>? surfaceInterval,
    Value<int>? bottomTime,
    Value<DateTime?>? decompressionStart,
    Value<DateTime?>? decompressionComplete,
    Value<int?>? totalDiveTime,
    Value<String?>? gasMixture,
    Value<String?>? workDescription,
    Value<String?>? decompressionUsed,
    Value<String?>? illnessOrInjury,
    Value<String?>? diveSupervisor,
    Value<int?>? accumulatedSupervisionTime,
    Value<int?>? accumulatedDiveTime,
    Value<String?>? localPdfPath,
  }) {
    return DiveSessionsCompanion(
      id: id ?? this.id,
      firestoreId: firestoreId ?? this.firestoreId,
      syncStatus: syncStatus ?? this.syncStatus,
      updatedAt: updatedAt ?? this.updatedAt,
      date: date ?? this.date,
      location: location ?? this.location,
      client: client ?? this.client,
      diveOperator: diveOperator ?? this.diveOperator,
      operatorAddress: operatorAddress ?? this.operatorAddress,
      diveType: diveType ?? this.diveType,
      diversNames: diversNames ?? this.diversNames,
      entryTime: entryTime ?? this.entryTime,
      exitTime: exitTime ?? this.exitTime,
      maxDepth: maxDepth ?? this.maxDepth,
      surfaceInterval: surfaceInterval ?? this.surfaceInterval,
      bottomTime: bottomTime ?? this.bottomTime,
      decompressionStart: decompressionStart ?? this.decompressionStart,
      decompressionComplete:
          decompressionComplete ?? this.decompressionComplete,
      totalDiveTime: totalDiveTime ?? this.totalDiveTime,
      gasMixture: gasMixture ?? this.gasMixture,
      workDescription: workDescription ?? this.workDescription,
      decompressionUsed: decompressionUsed ?? this.decompressionUsed,
      illnessOrInjury: illnessOrInjury ?? this.illnessOrInjury,
      diveSupervisor: diveSupervisor ?? this.diveSupervisor,
      accumulatedSupervisionTime:
          accumulatedSupervisionTime ?? this.accumulatedSupervisionTime,
      accumulatedDiveTime: accumulatedDiveTime ?? this.accumulatedDiveTime,
      localPdfPath: localPdfPath ?? this.localPdfPath,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (firestoreId.present) {
      map['firestore_id'] = Variable<String>(firestoreId.value);
    }
    if (syncStatus.present) {
      map['sync_status'] = Variable<int>(
        $DiveSessionsTable.$convertersyncStatus.toSql(syncStatus.value),
      );
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (location.present) {
      map['location'] = Variable<String>(location.value);
    }
    if (client.present) {
      map['client'] = Variable<String>(client.value);
    }
    if (diveOperator.present) {
      map['dive_operator'] = Variable<String>(diveOperator.value);
    }
    if (operatorAddress.present) {
      map['operator_address'] = Variable<String>(operatorAddress.value);
    }
    if (diveType.present) {
      map['dive_type'] = Variable<String>(diveType.value);
    }
    if (diversNames.present) {
      map['divers_names'] = Variable<String>(diversNames.value);
    }
    if (entryTime.present) {
      map['entry_time'] = Variable<DateTime>(entryTime.value);
    }
    if (exitTime.present) {
      map['exit_time'] = Variable<DateTime>(exitTime.value);
    }
    if (maxDepth.present) {
      map['max_depth'] = Variable<double>(maxDepth.value);
    }
    if (surfaceInterval.present) {
      map['surface_interval'] = Variable<int>(surfaceInterval.value);
    }
    if (bottomTime.present) {
      map['bottom_time'] = Variable<int>(bottomTime.value);
    }
    if (decompressionStart.present) {
      map['decompression_start'] = Variable<DateTime>(decompressionStart.value);
    }
    if (decompressionComplete.present) {
      map['decompression_complete'] = Variable<DateTime>(
        decompressionComplete.value,
      );
    }
    if (totalDiveTime.present) {
      map['total_dive_time'] = Variable<int>(totalDiveTime.value);
    }
    if (gasMixture.present) {
      map['gas_mixture'] = Variable<String>(gasMixture.value);
    }
    if (workDescription.present) {
      map['work_description'] = Variable<String>(workDescription.value);
    }
    if (decompressionUsed.present) {
      map['decompression_used'] = Variable<String>(decompressionUsed.value);
    }
    if (illnessOrInjury.present) {
      map['illness_or_injury'] = Variable<String>(illnessOrInjury.value);
    }
    if (diveSupervisor.present) {
      map['dive_supervisor'] = Variable<String>(diveSupervisor.value);
    }
    if (accumulatedSupervisionTime.present) {
      map['accumulated_supervision_time'] = Variable<int>(
        accumulatedSupervisionTime.value,
      );
    }
    if (accumulatedDiveTime.present) {
      map['accumulated_dive_time'] = Variable<int>(accumulatedDiveTime.value);
    }
    if (localPdfPath.present) {
      map['local_pdf_path'] = Variable<String>(localPdfPath.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DiveSessionsCompanion(')
          ..write('id: $id, ')
          ..write('firestoreId: $firestoreId, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('date: $date, ')
          ..write('location: $location, ')
          ..write('client: $client, ')
          ..write('diveOperator: $diveOperator, ')
          ..write('operatorAddress: $operatorAddress, ')
          ..write('diveType: $diveType, ')
          ..write('diversNames: $diversNames, ')
          ..write('entryTime: $entryTime, ')
          ..write('exitTime: $exitTime, ')
          ..write('maxDepth: $maxDepth, ')
          ..write('surfaceInterval: $surfaceInterval, ')
          ..write('bottomTime: $bottomTime, ')
          ..write('decompressionStart: $decompressionStart, ')
          ..write('decompressionComplete: $decompressionComplete, ')
          ..write('totalDiveTime: $totalDiveTime, ')
          ..write('gasMixture: $gasMixture, ')
          ..write('workDescription: $workDescription, ')
          ..write('decompressionUsed: $decompressionUsed, ')
          ..write('illnessOrInjury: $illnessOrInjury, ')
          ..write('diveSupervisor: $diveSupervisor, ')
          ..write('accumulatedSupervisionTime: $accumulatedSupervisionTime, ')
          ..write('accumulatedDiveTime: $accumulatedDiveTime, ')
          ..write('localPdfPath: $localPdfPath')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $DiveSessionsTable diveSessions = $DiveSessionsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [diveSessions];
}

typedef $$DiveSessionsTableCreateCompanionBuilder =
    DiveSessionsCompanion Function({
      Value<int> id,
      Value<String?> firestoreId,
      Value<SyncStatus> syncStatus,
      Value<DateTime> updatedAt,
      required DateTime date,
      required String location,
      Value<String?> client,
      Value<String?> diveOperator,
      Value<String?> operatorAddress,
      Value<String?> diveType,
      Value<String?> diversNames,
      Value<DateTime?> entryTime,
      Value<DateTime?> exitTime,
      required double maxDepth,
      Value<int?> surfaceInterval,
      required int bottomTime,
      Value<DateTime?> decompressionStart,
      Value<DateTime?> decompressionComplete,
      Value<int?> totalDiveTime,
      Value<String?> gasMixture,
      Value<String?> workDescription,
      Value<String?> decompressionUsed,
      Value<String?> illnessOrInjury,
      Value<String?> diveSupervisor,
      Value<int?> accumulatedSupervisionTime,
      Value<int?> accumulatedDiveTime,
      Value<String?> localPdfPath,
    });
typedef $$DiveSessionsTableUpdateCompanionBuilder =
    DiveSessionsCompanion Function({
      Value<int> id,
      Value<String?> firestoreId,
      Value<SyncStatus> syncStatus,
      Value<DateTime> updatedAt,
      Value<DateTime> date,
      Value<String> location,
      Value<String?> client,
      Value<String?> diveOperator,
      Value<String?> operatorAddress,
      Value<String?> diveType,
      Value<String?> diversNames,
      Value<DateTime?> entryTime,
      Value<DateTime?> exitTime,
      Value<double> maxDepth,
      Value<int?> surfaceInterval,
      Value<int> bottomTime,
      Value<DateTime?> decompressionStart,
      Value<DateTime?> decompressionComplete,
      Value<int?> totalDiveTime,
      Value<String?> gasMixture,
      Value<String?> workDescription,
      Value<String?> decompressionUsed,
      Value<String?> illnessOrInjury,
      Value<String?> diveSupervisor,
      Value<int?> accumulatedSupervisionTime,
      Value<int?> accumulatedDiveTime,
      Value<String?> localPdfPath,
    });

class $$DiveSessionsTableFilterComposer
    extends Composer<_$AppDatabase, $DiveSessionsTable> {
  $$DiveSessionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get firestoreId => $composableBuilder(
    column: $table.firestoreId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<SyncStatus, SyncStatus, int> get syncStatus =>
      $composableBuilder(
        column: $table.syncStatus,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get location => $composableBuilder(
    column: $table.location,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get client => $composableBuilder(
    column: $table.client,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get diveOperator => $composableBuilder(
    column: $table.diveOperator,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get operatorAddress => $composableBuilder(
    column: $table.operatorAddress,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get diveType => $composableBuilder(
    column: $table.diveType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get diversNames => $composableBuilder(
    column: $table.diversNames,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get entryTime => $composableBuilder(
    column: $table.entryTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get exitTime => $composableBuilder(
    column: $table.exitTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get maxDepth => $composableBuilder(
    column: $table.maxDepth,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get surfaceInterval => $composableBuilder(
    column: $table.surfaceInterval,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get bottomTime => $composableBuilder(
    column: $table.bottomTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get decompressionStart => $composableBuilder(
    column: $table.decompressionStart,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get decompressionComplete => $composableBuilder(
    column: $table.decompressionComplete,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get totalDiveTime => $composableBuilder(
    column: $table.totalDiveTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get gasMixture => $composableBuilder(
    column: $table.gasMixture,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get workDescription => $composableBuilder(
    column: $table.workDescription,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get decompressionUsed => $composableBuilder(
    column: $table.decompressionUsed,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get illnessOrInjury => $composableBuilder(
    column: $table.illnessOrInjury,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get diveSupervisor => $composableBuilder(
    column: $table.diveSupervisor,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get accumulatedSupervisionTime => $composableBuilder(
    column: $table.accumulatedSupervisionTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get accumulatedDiveTime => $composableBuilder(
    column: $table.accumulatedDiveTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get localPdfPath => $composableBuilder(
    column: $table.localPdfPath,
    builder: (column) => ColumnFilters(column),
  );
}

class $$DiveSessionsTableOrderingComposer
    extends Composer<_$AppDatabase, $DiveSessionsTable> {
  $$DiveSessionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get firestoreId => $composableBuilder(
    column: $table.firestoreId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get location => $composableBuilder(
    column: $table.location,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get client => $composableBuilder(
    column: $table.client,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get diveOperator => $composableBuilder(
    column: $table.diveOperator,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get operatorAddress => $composableBuilder(
    column: $table.operatorAddress,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get diveType => $composableBuilder(
    column: $table.diveType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get diversNames => $composableBuilder(
    column: $table.diversNames,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get entryTime => $composableBuilder(
    column: $table.entryTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get exitTime => $composableBuilder(
    column: $table.exitTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get maxDepth => $composableBuilder(
    column: $table.maxDepth,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get surfaceInterval => $composableBuilder(
    column: $table.surfaceInterval,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get bottomTime => $composableBuilder(
    column: $table.bottomTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get decompressionStart => $composableBuilder(
    column: $table.decompressionStart,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get decompressionComplete => $composableBuilder(
    column: $table.decompressionComplete,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get totalDiveTime => $composableBuilder(
    column: $table.totalDiveTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get gasMixture => $composableBuilder(
    column: $table.gasMixture,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get workDescription => $composableBuilder(
    column: $table.workDescription,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get decompressionUsed => $composableBuilder(
    column: $table.decompressionUsed,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get illnessOrInjury => $composableBuilder(
    column: $table.illnessOrInjury,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get diveSupervisor => $composableBuilder(
    column: $table.diveSupervisor,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get accumulatedSupervisionTime => $composableBuilder(
    column: $table.accumulatedSupervisionTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get accumulatedDiveTime => $composableBuilder(
    column: $table.accumulatedDiveTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get localPdfPath => $composableBuilder(
    column: $table.localPdfPath,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$DiveSessionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $DiveSessionsTable> {
  $$DiveSessionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get firestoreId => $composableBuilder(
    column: $table.firestoreId,
    builder: (column) => column,
  );

  GeneratedColumnWithTypeConverter<SyncStatus, int> get syncStatus =>
      $composableBuilder(
        column: $table.syncStatus,
        builder: (column) => column,
      );

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<String> get location =>
      $composableBuilder(column: $table.location, builder: (column) => column);

  GeneratedColumn<String> get client =>
      $composableBuilder(column: $table.client, builder: (column) => column);

  GeneratedColumn<String> get diveOperator => $composableBuilder(
    column: $table.diveOperator,
    builder: (column) => column,
  );

  GeneratedColumn<String> get operatorAddress => $composableBuilder(
    column: $table.operatorAddress,
    builder: (column) => column,
  );

  GeneratedColumn<String> get diveType =>
      $composableBuilder(column: $table.diveType, builder: (column) => column);

  GeneratedColumn<String> get diversNames => $composableBuilder(
    column: $table.diversNames,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get entryTime =>
      $composableBuilder(column: $table.entryTime, builder: (column) => column);

  GeneratedColumn<DateTime> get exitTime =>
      $composableBuilder(column: $table.exitTime, builder: (column) => column);

  GeneratedColumn<double> get maxDepth =>
      $composableBuilder(column: $table.maxDepth, builder: (column) => column);

  GeneratedColumn<int> get surfaceInterval => $composableBuilder(
    column: $table.surfaceInterval,
    builder: (column) => column,
  );

  GeneratedColumn<int> get bottomTime => $composableBuilder(
    column: $table.bottomTime,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get decompressionStart => $composableBuilder(
    column: $table.decompressionStart,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get decompressionComplete => $composableBuilder(
    column: $table.decompressionComplete,
    builder: (column) => column,
  );

  GeneratedColumn<int> get totalDiveTime => $composableBuilder(
    column: $table.totalDiveTime,
    builder: (column) => column,
  );

  GeneratedColumn<String> get gasMixture => $composableBuilder(
    column: $table.gasMixture,
    builder: (column) => column,
  );

  GeneratedColumn<String> get workDescription => $composableBuilder(
    column: $table.workDescription,
    builder: (column) => column,
  );

  GeneratedColumn<String> get decompressionUsed => $composableBuilder(
    column: $table.decompressionUsed,
    builder: (column) => column,
  );

  GeneratedColumn<String> get illnessOrInjury => $composableBuilder(
    column: $table.illnessOrInjury,
    builder: (column) => column,
  );

  GeneratedColumn<String> get diveSupervisor => $composableBuilder(
    column: $table.diveSupervisor,
    builder: (column) => column,
  );

  GeneratedColumn<int> get accumulatedSupervisionTime => $composableBuilder(
    column: $table.accumulatedSupervisionTime,
    builder: (column) => column,
  );

  GeneratedColumn<int> get accumulatedDiveTime => $composableBuilder(
    column: $table.accumulatedDiveTime,
    builder: (column) => column,
  );

  GeneratedColumn<String> get localPdfPath => $composableBuilder(
    column: $table.localPdfPath,
    builder: (column) => column,
  );
}

class $$DiveSessionsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DiveSessionsTable,
          DiveSession,
          $$DiveSessionsTableFilterComposer,
          $$DiveSessionsTableOrderingComposer,
          $$DiveSessionsTableAnnotationComposer,
          $$DiveSessionsTableCreateCompanionBuilder,
          $$DiveSessionsTableUpdateCompanionBuilder,
          (
            DiveSession,
            BaseReferences<_$AppDatabase, $DiveSessionsTable, DiveSession>,
          ),
          DiveSession,
          PrefetchHooks Function()
        > {
  $$DiveSessionsTableTableManager(_$AppDatabase db, $DiveSessionsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DiveSessionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DiveSessionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DiveSessionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String?> firestoreId = const Value.absent(),
                Value<SyncStatus> syncStatus = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime> date = const Value.absent(),
                Value<String> location = const Value.absent(),
                Value<String?> client = const Value.absent(),
                Value<String?> diveOperator = const Value.absent(),
                Value<String?> operatorAddress = const Value.absent(),
                Value<String?> diveType = const Value.absent(),
                Value<String?> diversNames = const Value.absent(),
                Value<DateTime?> entryTime = const Value.absent(),
                Value<DateTime?> exitTime = const Value.absent(),
                Value<double> maxDepth = const Value.absent(),
                Value<int?> surfaceInterval = const Value.absent(),
                Value<int> bottomTime = const Value.absent(),
                Value<DateTime?> decompressionStart = const Value.absent(),
                Value<DateTime?> decompressionComplete = const Value.absent(),
                Value<int?> totalDiveTime = const Value.absent(),
                Value<String?> gasMixture = const Value.absent(),
                Value<String?> workDescription = const Value.absent(),
                Value<String?> decompressionUsed = const Value.absent(),
                Value<String?> illnessOrInjury = const Value.absent(),
                Value<String?> diveSupervisor = const Value.absent(),
                Value<int?> accumulatedSupervisionTime = const Value.absent(),
                Value<int?> accumulatedDiveTime = const Value.absent(),
                Value<String?> localPdfPath = const Value.absent(),
              }) => DiveSessionsCompanion(
                id: id,
                firestoreId: firestoreId,
                syncStatus: syncStatus,
                updatedAt: updatedAt,
                date: date,
                location: location,
                client: client,
                diveOperator: diveOperator,
                operatorAddress: operatorAddress,
                diveType: diveType,
                diversNames: diversNames,
                entryTime: entryTime,
                exitTime: exitTime,
                maxDepth: maxDepth,
                surfaceInterval: surfaceInterval,
                bottomTime: bottomTime,
                decompressionStart: decompressionStart,
                decompressionComplete: decompressionComplete,
                totalDiveTime: totalDiveTime,
                gasMixture: gasMixture,
                workDescription: workDescription,
                decompressionUsed: decompressionUsed,
                illnessOrInjury: illnessOrInjury,
                diveSupervisor: diveSupervisor,
                accumulatedSupervisionTime: accumulatedSupervisionTime,
                accumulatedDiveTime: accumulatedDiveTime,
                localPdfPath: localPdfPath,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String?> firestoreId = const Value.absent(),
                Value<SyncStatus> syncStatus = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                required DateTime date,
                required String location,
                Value<String?> client = const Value.absent(),
                Value<String?> diveOperator = const Value.absent(),
                Value<String?> operatorAddress = const Value.absent(),
                Value<String?> diveType = const Value.absent(),
                Value<String?> diversNames = const Value.absent(),
                Value<DateTime?> entryTime = const Value.absent(),
                Value<DateTime?> exitTime = const Value.absent(),
                required double maxDepth,
                Value<int?> surfaceInterval = const Value.absent(),
                required int bottomTime,
                Value<DateTime?> decompressionStart = const Value.absent(),
                Value<DateTime?> decompressionComplete = const Value.absent(),
                Value<int?> totalDiveTime = const Value.absent(),
                Value<String?> gasMixture = const Value.absent(),
                Value<String?> workDescription = const Value.absent(),
                Value<String?> decompressionUsed = const Value.absent(),
                Value<String?> illnessOrInjury = const Value.absent(),
                Value<String?> diveSupervisor = const Value.absent(),
                Value<int?> accumulatedSupervisionTime = const Value.absent(),
                Value<int?> accumulatedDiveTime = const Value.absent(),
                Value<String?> localPdfPath = const Value.absent(),
              }) => DiveSessionsCompanion.insert(
                id: id,
                firestoreId: firestoreId,
                syncStatus: syncStatus,
                updatedAt: updatedAt,
                date: date,
                location: location,
                client: client,
                diveOperator: diveOperator,
                operatorAddress: operatorAddress,
                diveType: diveType,
                diversNames: diversNames,
                entryTime: entryTime,
                exitTime: exitTime,
                maxDepth: maxDepth,
                surfaceInterval: surfaceInterval,
                bottomTime: bottomTime,
                decompressionStart: decompressionStart,
                decompressionComplete: decompressionComplete,
                totalDiveTime: totalDiveTime,
                gasMixture: gasMixture,
                workDescription: workDescription,
                decompressionUsed: decompressionUsed,
                illnessOrInjury: illnessOrInjury,
                diveSupervisor: diveSupervisor,
                accumulatedSupervisionTime: accumulatedSupervisionTime,
                accumulatedDiveTime: accumulatedDiveTime,
                localPdfPath: localPdfPath,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$DiveSessionsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DiveSessionsTable,
      DiveSession,
      $$DiveSessionsTableFilterComposer,
      $$DiveSessionsTableOrderingComposer,
      $$DiveSessionsTableAnnotationComposer,
      $$DiveSessionsTableCreateCompanionBuilder,
      $$DiveSessionsTableUpdateCompanionBuilder,
      (
        DiveSession,
        BaseReferences<_$AppDatabase, $DiveSessionsTable, DiveSession>,
      ),
      DiveSession,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$DiveSessionsTableTableManager get diveSessions =>
      $$DiveSessionsTableTableManager(_db, _db.diveSessions);
}
