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
  static const VerificationMeta _diveSiteMeta = const VerificationMeta(
    'diveSite',
  );
  @override
  late final GeneratedColumn<String> diveSite = GeneratedColumn<String>(
    'dive_site',
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
  static const VerificationMeta _buddyMeta = const VerificationMeta('buddy');
  @override
  late final GeneratedColumn<String> buddy = GeneratedColumn<String>(
    'buddy',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
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
    diveSite,
    client,
    diveOperator,
    maxDepth,
    bottomTime,
    buddy,
    notes,
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
    if (data.containsKey('dive_site')) {
      context.handle(
        _diveSiteMeta,
        diveSite.isAcceptableOrUnknown(data['dive_site']!, _diveSiteMeta),
      );
    } else if (isInserting) {
      context.missing(_diveSiteMeta);
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
    if (data.containsKey('max_depth')) {
      context.handle(
        _maxDepthMeta,
        maxDepth.isAcceptableOrUnknown(data['max_depth']!, _maxDepthMeta),
      );
    } else if (isInserting) {
      context.missing(_maxDepthMeta);
    }
    if (data.containsKey('bottom_time')) {
      context.handle(
        _bottomTimeMeta,
        bottomTime.isAcceptableOrUnknown(data['bottom_time']!, _bottomTimeMeta),
      );
    } else if (isInserting) {
      context.missing(_bottomTimeMeta);
    }
    if (data.containsKey('buddy')) {
      context.handle(
        _buddyMeta,
        buddy.isAcceptableOrUnknown(data['buddy']!, _buddyMeta),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
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
      diveSite: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}dive_site'],
      )!,
      client: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}client'],
      ),
      diveOperator: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}dive_operator'],
      ),
      maxDepth: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}max_depth'],
      )!,
      bottomTime: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}bottom_time'],
      )!,
      buddy: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}buddy'],
      ),
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
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
  final String diveSite;
  final String? client;
  final String? diveOperator;
  final double maxDepth;
  final int bottomTime;
  final String? buddy;
  final String? notes;
  final String? localPdfPath;
  const DiveSession({
    required this.id,
    this.firestoreId,
    required this.syncStatus,
    required this.updatedAt,
    required this.date,
    required this.location,
    required this.diveSite,
    this.client,
    this.diveOperator,
    required this.maxDepth,
    required this.bottomTime,
    this.buddy,
    this.notes,
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
    map['dive_site'] = Variable<String>(diveSite);
    if (!nullToAbsent || client != null) {
      map['client'] = Variable<String>(client);
    }
    if (!nullToAbsent || diveOperator != null) {
      map['dive_operator'] = Variable<String>(diveOperator);
    }
    map['max_depth'] = Variable<double>(maxDepth);
    map['bottom_time'] = Variable<int>(bottomTime);
    if (!nullToAbsent || buddy != null) {
      map['buddy'] = Variable<String>(buddy);
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
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
      diveSite: Value(diveSite),
      client: client == null && nullToAbsent
          ? const Value.absent()
          : Value(client),
      diveOperator: diveOperator == null && nullToAbsent
          ? const Value.absent()
          : Value(diveOperator),
      maxDepth: Value(maxDepth),
      bottomTime: Value(bottomTime),
      buddy: buddy == null && nullToAbsent
          ? const Value.absent()
          : Value(buddy),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
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
      diveSite: serializer.fromJson<String>(json['diveSite']),
      client: serializer.fromJson<String?>(json['client']),
      diveOperator: serializer.fromJson<String?>(json['diveOperator']),
      maxDepth: serializer.fromJson<double>(json['maxDepth']),
      bottomTime: serializer.fromJson<int>(json['bottomTime']),
      buddy: serializer.fromJson<String?>(json['buddy']),
      notes: serializer.fromJson<String?>(json['notes']),
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
      'diveSite': serializer.toJson<String>(diveSite),
      'client': serializer.toJson<String?>(client),
      'diveOperator': serializer.toJson<String?>(diveOperator),
      'maxDepth': serializer.toJson<double>(maxDepth),
      'bottomTime': serializer.toJson<int>(bottomTime),
      'buddy': serializer.toJson<String?>(buddy),
      'notes': serializer.toJson<String?>(notes),
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
    String? diveSite,
    Value<String?> client = const Value.absent(),
    Value<String?> diveOperator = const Value.absent(),
    double? maxDepth,
    int? bottomTime,
    Value<String?> buddy = const Value.absent(),
    Value<String?> notes = const Value.absent(),
    Value<String?> localPdfPath = const Value.absent(),
  }) => DiveSession(
    id: id ?? this.id,
    firestoreId: firestoreId.present ? firestoreId.value : this.firestoreId,
    syncStatus: syncStatus ?? this.syncStatus,
    updatedAt: updatedAt ?? this.updatedAt,
    date: date ?? this.date,
    location: location ?? this.location,
    diveSite: diveSite ?? this.diveSite,
    client: client.present ? client.value : this.client,
    diveOperator: diveOperator.present ? diveOperator.value : this.diveOperator,
    maxDepth: maxDepth ?? this.maxDepth,
    bottomTime: bottomTime ?? this.bottomTime,
    buddy: buddy.present ? buddy.value : this.buddy,
    notes: notes.present ? notes.value : this.notes,
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
      diveSite: data.diveSite.present ? data.diveSite.value : this.diveSite,
      client: data.client.present ? data.client.value : this.client,
      diveOperator: data.diveOperator.present
          ? data.diveOperator.value
          : this.diveOperator,
      maxDepth: data.maxDepth.present ? data.maxDepth.value : this.maxDepth,
      bottomTime: data.bottomTime.present
          ? data.bottomTime.value
          : this.bottomTime,
      buddy: data.buddy.present ? data.buddy.value : this.buddy,
      notes: data.notes.present ? data.notes.value : this.notes,
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
          ..write('diveSite: $diveSite, ')
          ..write('client: $client, ')
          ..write('diveOperator: $diveOperator, ')
          ..write('maxDepth: $maxDepth, ')
          ..write('bottomTime: $bottomTime, ')
          ..write('buddy: $buddy, ')
          ..write('notes: $notes, ')
          ..write('localPdfPath: $localPdfPath')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    firestoreId,
    syncStatus,
    updatedAt,
    date,
    location,
    diveSite,
    client,
    diveOperator,
    maxDepth,
    bottomTime,
    buddy,
    notes,
    localPdfPath,
  );
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
          other.diveSite == this.diveSite &&
          other.client == this.client &&
          other.diveOperator == this.diveOperator &&
          other.maxDepth == this.maxDepth &&
          other.bottomTime == this.bottomTime &&
          other.buddy == this.buddy &&
          other.notes == this.notes &&
          other.localPdfPath == this.localPdfPath);
}

class DiveSessionsCompanion extends UpdateCompanion<DiveSession> {
  final Value<int> id;
  final Value<String?> firestoreId;
  final Value<SyncStatus> syncStatus;
  final Value<DateTime> updatedAt;
  final Value<DateTime> date;
  final Value<String> location;
  final Value<String> diveSite;
  final Value<String?> client;
  final Value<String?> diveOperator;
  final Value<double> maxDepth;
  final Value<int> bottomTime;
  final Value<String?> buddy;
  final Value<String?> notes;
  final Value<String?> localPdfPath;
  const DiveSessionsCompanion({
    this.id = const Value.absent(),
    this.firestoreId = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.date = const Value.absent(),
    this.location = const Value.absent(),
    this.diveSite = const Value.absent(),
    this.client = const Value.absent(),
    this.diveOperator = const Value.absent(),
    this.maxDepth = const Value.absent(),
    this.bottomTime = const Value.absent(),
    this.buddy = const Value.absent(),
    this.notes = const Value.absent(),
    this.localPdfPath = const Value.absent(),
  });
  DiveSessionsCompanion.insert({
    this.id = const Value.absent(),
    this.firestoreId = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.updatedAt = const Value.absent(),
    required DateTime date,
    required String location,
    required String diveSite,
    this.client = const Value.absent(),
    this.diveOperator = const Value.absent(),
    required double maxDepth,
    required int bottomTime,
    this.buddy = const Value.absent(),
    this.notes = const Value.absent(),
    this.localPdfPath = const Value.absent(),
  }) : date = Value(date),
       location = Value(location),
       diveSite = Value(diveSite),
       maxDepth = Value(maxDepth),
       bottomTime = Value(bottomTime);
  static Insertable<DiveSession> custom({
    Expression<int>? id,
    Expression<String>? firestoreId,
    Expression<int>? syncStatus,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? date,
    Expression<String>? location,
    Expression<String>? diveSite,
    Expression<String>? client,
    Expression<String>? diveOperator,
    Expression<double>? maxDepth,
    Expression<int>? bottomTime,
    Expression<String>? buddy,
    Expression<String>? notes,
    Expression<String>? localPdfPath,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (firestoreId != null) 'firestore_id': firestoreId,
      if (syncStatus != null) 'sync_status': syncStatus,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (date != null) 'date': date,
      if (location != null) 'location': location,
      if (diveSite != null) 'dive_site': diveSite,
      if (client != null) 'client': client,
      if (diveOperator != null) 'dive_operator': diveOperator,
      if (maxDepth != null) 'max_depth': maxDepth,
      if (bottomTime != null) 'bottom_time': bottomTime,
      if (buddy != null) 'buddy': buddy,
      if (notes != null) 'notes': notes,
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
    Value<String>? diveSite,
    Value<String?>? client,
    Value<String?>? diveOperator,
    Value<double>? maxDepth,
    Value<int>? bottomTime,
    Value<String?>? buddy,
    Value<String?>? notes,
    Value<String?>? localPdfPath,
  }) {
    return DiveSessionsCompanion(
      id: id ?? this.id,
      firestoreId: firestoreId ?? this.firestoreId,
      syncStatus: syncStatus ?? this.syncStatus,
      updatedAt: updatedAt ?? this.updatedAt,
      date: date ?? this.date,
      location: location ?? this.location,
      diveSite: diveSite ?? this.diveSite,
      client: client ?? this.client,
      diveOperator: diveOperator ?? this.diveOperator,
      maxDepth: maxDepth ?? this.maxDepth,
      bottomTime: bottomTime ?? this.bottomTime,
      buddy: buddy ?? this.buddy,
      notes: notes ?? this.notes,
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
    if (diveSite.present) {
      map['dive_site'] = Variable<String>(diveSite.value);
    }
    if (client.present) {
      map['client'] = Variable<String>(client.value);
    }
    if (diveOperator.present) {
      map['dive_operator'] = Variable<String>(diveOperator.value);
    }
    if (maxDepth.present) {
      map['max_depth'] = Variable<double>(maxDepth.value);
    }
    if (bottomTime.present) {
      map['bottom_time'] = Variable<int>(bottomTime.value);
    }
    if (buddy.present) {
      map['buddy'] = Variable<String>(buddy.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
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
          ..write('diveSite: $diveSite, ')
          ..write('client: $client, ')
          ..write('diveOperator: $diveOperator, ')
          ..write('maxDepth: $maxDepth, ')
          ..write('bottomTime: $bottomTime, ')
          ..write('buddy: $buddy, ')
          ..write('notes: $notes, ')
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
      required String diveSite,
      Value<String?> client,
      Value<String?> diveOperator,
      required double maxDepth,
      required int bottomTime,
      Value<String?> buddy,
      Value<String?> notes,
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
      Value<String> diveSite,
      Value<String?> client,
      Value<String?> diveOperator,
      Value<double> maxDepth,
      Value<int> bottomTime,
      Value<String?> buddy,
      Value<String?> notes,
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

  ColumnFilters<String> get diveSite => $composableBuilder(
    column: $table.diveSite,
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

  ColumnFilters<double> get maxDepth => $composableBuilder(
    column: $table.maxDepth,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get bottomTime => $composableBuilder(
    column: $table.bottomTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get buddy => $composableBuilder(
    column: $table.buddy,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
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

  ColumnOrderings<String> get diveSite => $composableBuilder(
    column: $table.diveSite,
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

  ColumnOrderings<double> get maxDepth => $composableBuilder(
    column: $table.maxDepth,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get bottomTime => $composableBuilder(
    column: $table.bottomTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get buddy => $composableBuilder(
    column: $table.buddy,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
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

  GeneratedColumn<String> get diveSite =>
      $composableBuilder(column: $table.diveSite, builder: (column) => column);

  GeneratedColumn<String> get client =>
      $composableBuilder(column: $table.client, builder: (column) => column);

  GeneratedColumn<String> get diveOperator => $composableBuilder(
    column: $table.diveOperator,
    builder: (column) => column,
  );

  GeneratedColumn<double> get maxDepth =>
      $composableBuilder(column: $table.maxDepth, builder: (column) => column);

  GeneratedColumn<int> get bottomTime => $composableBuilder(
    column: $table.bottomTime,
    builder: (column) => column,
  );

  GeneratedColumn<String> get buddy =>
      $composableBuilder(column: $table.buddy, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

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
                Value<String> diveSite = const Value.absent(),
                Value<String?> client = const Value.absent(),
                Value<String?> diveOperator = const Value.absent(),
                Value<double> maxDepth = const Value.absent(),
                Value<int> bottomTime = const Value.absent(),
                Value<String?> buddy = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<String?> localPdfPath = const Value.absent(),
              }) => DiveSessionsCompanion(
                id: id,
                firestoreId: firestoreId,
                syncStatus: syncStatus,
                updatedAt: updatedAt,
                date: date,
                location: location,
                diveSite: diveSite,
                client: client,
                diveOperator: diveOperator,
                maxDepth: maxDepth,
                bottomTime: bottomTime,
                buddy: buddy,
                notes: notes,
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
                required String diveSite,
                Value<String?> client = const Value.absent(),
                Value<String?> diveOperator = const Value.absent(),
                required double maxDepth,
                required int bottomTime,
                Value<String?> buddy = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<String?> localPdfPath = const Value.absent(),
              }) => DiveSessionsCompanion.insert(
                id: id,
                firestoreId: firestoreId,
                syncStatus: syncStatus,
                updatedAt: updatedAt,
                date: date,
                location: location,
                diveSite: diveSite,
                client: client,
                diveOperator: diveOperator,
                maxDepth: maxDepth,
                bottomTime: bottomTime,
                buddy: buddy,
                notes: notes,
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
