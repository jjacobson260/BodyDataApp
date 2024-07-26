// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drift_database.dart';

// ignore_for_file: type=lint
class $PoopDataTable extends PoopData
    with TableInfo<$PoopDataTable, PoopDataData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PoopDataTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _timestampMeta =
      const VerificationMeta('timestamp');
  @override
  late final GeneratedColumn<DateTime> timestamp = GeneratedColumn<DateTime>(
      'timestamp', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _bristol_ratingMeta =
      const VerificationMeta('bristol_rating');
  @override
  late final GeneratedColumn<int> bristol_rating = GeneratedColumn<int>(
      'bristol_rating', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _urgencyMeta =
      const VerificationMeta('urgency');
  @override
  late final GeneratedColumn<int> urgency = GeneratedColumn<int>(
      'urgency', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _bloodMeta = const VerificationMeta('blood');
  @override
  late final GeneratedColumn<bool> blood = GeneratedColumn<bool>(
      'blood', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("blood" IN (0, 1))'));
  @override
  List<GeneratedColumn> get $columns =>
      [id, timestamp, bristol_rating, urgency, blood];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'poop_data';
  @override
  VerificationContext validateIntegrity(Insertable<PoopDataData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('timestamp')) {
      context.handle(_timestampMeta,
          timestamp.isAcceptableOrUnknown(data['timestamp']!, _timestampMeta));
    } else if (isInserting) {
      context.missing(_timestampMeta);
    }
    if (data.containsKey('bristol_rating')) {
      context.handle(
          _bristol_ratingMeta,
          bristol_rating.isAcceptableOrUnknown(
              data['bristol_rating']!, _bristol_ratingMeta));
    } else if (isInserting) {
      context.missing(_bristol_ratingMeta);
    }
    if (data.containsKey('urgency')) {
      context.handle(_urgencyMeta,
          urgency.isAcceptableOrUnknown(data['urgency']!, _urgencyMeta));
    } else if (isInserting) {
      context.missing(_urgencyMeta);
    }
    if (data.containsKey('blood')) {
      context.handle(
          _bloodMeta, blood.isAcceptableOrUnknown(data['blood']!, _bloodMeta));
    } else if (isInserting) {
      context.missing(_bloodMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PoopDataData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PoopDataData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      timestamp: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}timestamp'])!,
      bristol_rating: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}bristol_rating'])!,
      urgency: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}urgency'])!,
      blood: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}blood'])!,
    );
  }

  @override
  $PoopDataTable createAlias(String alias) {
    return $PoopDataTable(attachedDatabase, alias);
  }
}

class PoopDataData extends DataClass implements Insertable<PoopDataData> {
  final int id;
  final DateTime timestamp;
  final int bristol_rating;
  final int urgency;
  final bool blood;
  const PoopDataData(
      {required this.id,
      required this.timestamp,
      required this.bristol_rating,
      required this.urgency,
      required this.blood});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['timestamp'] = Variable<DateTime>(timestamp);
    map['bristol_rating'] = Variable<int>(bristol_rating);
    map['urgency'] = Variable<int>(urgency);
    map['blood'] = Variable<bool>(blood);
    return map;
  }

  PoopDataCompanion toCompanion(bool nullToAbsent) {
    return PoopDataCompanion(
      id: Value(id),
      timestamp: Value(timestamp),
      bristol_rating: Value(bristol_rating),
      urgency: Value(urgency),
      blood: Value(blood),
    );
  }

  factory PoopDataData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PoopDataData(
      id: serializer.fromJson<int>(json['id']),
      timestamp: serializer.fromJson<DateTime>(json['timestamp']),
      bristol_rating: serializer.fromJson<int>(json['bristol_rating']),
      urgency: serializer.fromJson<int>(json['urgency']),
      blood: serializer.fromJson<bool>(json['blood']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'timestamp': serializer.toJson<DateTime>(timestamp),
      'bristol_rating': serializer.toJson<int>(bristol_rating),
      'urgency': serializer.toJson<int>(urgency),
      'blood': serializer.toJson<bool>(blood),
    };
  }

  PoopDataData copyWith(
          {int? id,
          DateTime? timestamp,
          int? bristol_rating,
          int? urgency,
          bool? blood}) =>
      PoopDataData(
        id: id ?? this.id,
        timestamp: timestamp ?? this.timestamp,
        bristol_rating: bristol_rating ?? this.bristol_rating,
        urgency: urgency ?? this.urgency,
        blood: blood ?? this.blood,
      );
  PoopDataData copyWithCompanion(PoopDataCompanion data) {
    return PoopDataData(
      id: data.id.present ? data.id.value : this.id,
      timestamp: data.timestamp.present ? data.timestamp.value : this.timestamp,
      bristol_rating: data.bristol_rating.present
          ? data.bristol_rating.value
          : this.bristol_rating,
      urgency: data.urgency.present ? data.urgency.value : this.urgency,
      blood: data.blood.present ? data.blood.value : this.blood,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PoopDataData(')
          ..write('id: $id, ')
          ..write('timestamp: $timestamp, ')
          ..write('bristol_rating: $bristol_rating, ')
          ..write('urgency: $urgency, ')
          ..write('blood: $blood')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, timestamp, bristol_rating, urgency, blood);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PoopDataData &&
          other.id == this.id &&
          other.timestamp == this.timestamp &&
          other.bristol_rating == this.bristol_rating &&
          other.urgency == this.urgency &&
          other.blood == this.blood);
}

class PoopDataCompanion extends UpdateCompanion<PoopDataData> {
  final Value<int> id;
  final Value<DateTime> timestamp;
  final Value<int> bristol_rating;
  final Value<int> urgency;
  final Value<bool> blood;
  const PoopDataCompanion({
    this.id = const Value.absent(),
    this.timestamp = const Value.absent(),
    this.bristol_rating = const Value.absent(),
    this.urgency = const Value.absent(),
    this.blood = const Value.absent(),
  });
  PoopDataCompanion.insert({
    this.id = const Value.absent(),
    required DateTime timestamp,
    required int bristol_rating,
    required int urgency,
    required bool blood,
  })  : timestamp = Value(timestamp),
        bristol_rating = Value(bristol_rating),
        urgency = Value(urgency),
        blood = Value(blood);
  static Insertable<PoopDataData> custom({
    Expression<int>? id,
    Expression<DateTime>? timestamp,
    Expression<int>? bristol_rating,
    Expression<int>? urgency,
    Expression<bool>? blood,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (timestamp != null) 'timestamp': timestamp,
      if (bristol_rating != null) 'bristol_rating': bristol_rating,
      if (urgency != null) 'urgency': urgency,
      if (blood != null) 'blood': blood,
    });
  }

  PoopDataCompanion copyWith(
      {Value<int>? id,
      Value<DateTime>? timestamp,
      Value<int>? bristol_rating,
      Value<int>? urgency,
      Value<bool>? blood}) {
    return PoopDataCompanion(
      id: id ?? this.id,
      timestamp: timestamp ?? this.timestamp,
      bristol_rating: bristol_rating ?? this.bristol_rating,
      urgency: urgency ?? this.urgency,
      blood: blood ?? this.blood,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (timestamp.present) {
      map['timestamp'] = Variable<DateTime>(timestamp.value);
    }
    if (bristol_rating.present) {
      map['bristol_rating'] = Variable<int>(bristol_rating.value);
    }
    if (urgency.present) {
      map['urgency'] = Variable<int>(urgency.value);
    }
    if (blood.present) {
      map['blood'] = Variable<bool>(blood.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PoopDataCompanion(')
          ..write('id: $id, ')
          ..write('timestamp: $timestamp, ')
          ..write('bristol_rating: $bristol_rating, ')
          ..write('urgency: $urgency, ')
          ..write('blood: $blood')
          ..write(')'))
        .toString();
  }
}

class $MedicineDataTable extends MedicineData
    with TableInfo<$MedicineDataTable, MedicineDataData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MedicineDataTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _timestampMeta =
      const VerificationMeta('timestamp');
  @override
  late final GeneratedColumn<DateTime> timestamp = GeneratedColumn<DateTime>(
      'timestamp', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _medicine_nameMeta =
      const VerificationMeta('medicine_name');
  @override
  late final GeneratedColumn<String> medicine_name = GeneratedColumn<String>(
      'medicine_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _dosageMeta = const VerificationMeta('dosage');
  @override
  late final GeneratedColumn<double> dosage = GeneratedColumn<double>(
      'dosage', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _unitMeta = const VerificationMeta('unit');
  @override
  late final GeneratedColumn<String> unit = GeneratedColumn<String>(
      'unit', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, timestamp, medicine_name, dosage, unit];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'medicine_data';
  @override
  VerificationContext validateIntegrity(Insertable<MedicineDataData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('timestamp')) {
      context.handle(_timestampMeta,
          timestamp.isAcceptableOrUnknown(data['timestamp']!, _timestampMeta));
    } else if (isInserting) {
      context.missing(_timestampMeta);
    }
    if (data.containsKey('medicine_name')) {
      context.handle(
          _medicine_nameMeta,
          medicine_name.isAcceptableOrUnknown(
              data['medicine_name']!, _medicine_nameMeta));
    } else if (isInserting) {
      context.missing(_medicine_nameMeta);
    }
    if (data.containsKey('dosage')) {
      context.handle(_dosageMeta,
          dosage.isAcceptableOrUnknown(data['dosage']!, _dosageMeta));
    } else if (isInserting) {
      context.missing(_dosageMeta);
    }
    if (data.containsKey('unit')) {
      context.handle(
          _unitMeta, unit.isAcceptableOrUnknown(data['unit']!, _unitMeta));
    } else if (isInserting) {
      context.missing(_unitMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MedicineDataData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MedicineDataData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      timestamp: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}timestamp'])!,
      medicine_name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}medicine_name'])!,
      dosage: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}dosage'])!,
      unit: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}unit'])!,
    );
  }

  @override
  $MedicineDataTable createAlias(String alias) {
    return $MedicineDataTable(attachedDatabase, alias);
  }
}

class MedicineDataData extends DataClass
    implements Insertable<MedicineDataData> {
  final int id;
  final DateTime timestamp;
  final String medicine_name;
  final double dosage;
  final String unit;
  const MedicineDataData(
      {required this.id,
      required this.timestamp,
      required this.medicine_name,
      required this.dosage,
      required this.unit});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['timestamp'] = Variable<DateTime>(timestamp);
    map['medicine_name'] = Variable<String>(medicine_name);
    map['dosage'] = Variable<double>(dosage);
    map['unit'] = Variable<String>(unit);
    return map;
  }

  MedicineDataCompanion toCompanion(bool nullToAbsent) {
    return MedicineDataCompanion(
      id: Value(id),
      timestamp: Value(timestamp),
      medicine_name: Value(medicine_name),
      dosage: Value(dosage),
      unit: Value(unit),
    );
  }

  factory MedicineDataData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MedicineDataData(
      id: serializer.fromJson<int>(json['id']),
      timestamp: serializer.fromJson<DateTime>(json['timestamp']),
      medicine_name: serializer.fromJson<String>(json['medicine_name']),
      dosage: serializer.fromJson<double>(json['dosage']),
      unit: serializer.fromJson<String>(json['unit']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'timestamp': serializer.toJson<DateTime>(timestamp),
      'medicine_name': serializer.toJson<String>(medicine_name),
      'dosage': serializer.toJson<double>(dosage),
      'unit': serializer.toJson<String>(unit),
    };
  }

  MedicineDataData copyWith(
          {int? id,
          DateTime? timestamp,
          String? medicine_name,
          double? dosage,
          String? unit}) =>
      MedicineDataData(
        id: id ?? this.id,
        timestamp: timestamp ?? this.timestamp,
        medicine_name: medicine_name ?? this.medicine_name,
        dosage: dosage ?? this.dosage,
        unit: unit ?? this.unit,
      );
  MedicineDataData copyWithCompanion(MedicineDataCompanion data) {
    return MedicineDataData(
      id: data.id.present ? data.id.value : this.id,
      timestamp: data.timestamp.present ? data.timestamp.value : this.timestamp,
      medicine_name: data.medicine_name.present
          ? data.medicine_name.value
          : this.medicine_name,
      dosage: data.dosage.present ? data.dosage.value : this.dosage,
      unit: data.unit.present ? data.unit.value : this.unit,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MedicineDataData(')
          ..write('id: $id, ')
          ..write('timestamp: $timestamp, ')
          ..write('medicine_name: $medicine_name, ')
          ..write('dosage: $dosage, ')
          ..write('unit: $unit')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, timestamp, medicine_name, dosage, unit);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MedicineDataData &&
          other.id == this.id &&
          other.timestamp == this.timestamp &&
          other.medicine_name == this.medicine_name &&
          other.dosage == this.dosage &&
          other.unit == this.unit);
}

class MedicineDataCompanion extends UpdateCompanion<MedicineDataData> {
  final Value<int> id;
  final Value<DateTime> timestamp;
  final Value<String> medicine_name;
  final Value<double> dosage;
  final Value<String> unit;
  const MedicineDataCompanion({
    this.id = const Value.absent(),
    this.timestamp = const Value.absent(),
    this.medicine_name = const Value.absent(),
    this.dosage = const Value.absent(),
    this.unit = const Value.absent(),
  });
  MedicineDataCompanion.insert({
    this.id = const Value.absent(),
    required DateTime timestamp,
    required String medicine_name,
    required double dosage,
    required String unit,
  })  : timestamp = Value(timestamp),
        medicine_name = Value(medicine_name),
        dosage = Value(dosage),
        unit = Value(unit);
  static Insertable<MedicineDataData> custom({
    Expression<int>? id,
    Expression<DateTime>? timestamp,
    Expression<String>? medicine_name,
    Expression<double>? dosage,
    Expression<String>? unit,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (timestamp != null) 'timestamp': timestamp,
      if (medicine_name != null) 'medicine_name': medicine_name,
      if (dosage != null) 'dosage': dosage,
      if (unit != null) 'unit': unit,
    });
  }

  MedicineDataCompanion copyWith(
      {Value<int>? id,
      Value<DateTime>? timestamp,
      Value<String>? medicine_name,
      Value<double>? dosage,
      Value<String>? unit}) {
    return MedicineDataCompanion(
      id: id ?? this.id,
      timestamp: timestamp ?? this.timestamp,
      medicine_name: medicine_name ?? this.medicine_name,
      dosage: dosage ?? this.dosage,
      unit: unit ?? this.unit,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (timestamp.present) {
      map['timestamp'] = Variable<DateTime>(timestamp.value);
    }
    if (medicine_name.present) {
      map['medicine_name'] = Variable<String>(medicine_name.value);
    }
    if (dosage.present) {
      map['dosage'] = Variable<double>(dosage.value);
    }
    if (unit.present) {
      map['unit'] = Variable<String>(unit.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MedicineDataCompanion(')
          ..write('id: $id, ')
          ..write('timestamp: $timestamp, ')
          ..write('medicine_name: $medicine_name, ')
          ..write('dosage: $dosage, ')
          ..write('unit: $unit')
          ..write(')'))
        .toString();
  }
}

class $RecipesTable extends Recipes with TableInfo<$RecipesTable, Recipe> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RecipesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _timestampMeta =
      const VerificationMeta('timestamp');
  @override
  late final GeneratedColumn<DateTime> timestamp = GeneratedColumn<DateTime>(
      'timestamp', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _created_byMeta =
      const VerificationMeta('created_by');
  @override
  late final GeneratedColumn<String> created_by = GeneratedColumn<String>(
      'created_by', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _ingredients_jsonMeta =
      const VerificationMeta('ingredients_json');
  @override
  late final GeneratedColumn<String> ingredients_json = GeneratedColumn<String>(
      'ingredients_json', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _steps_jsonMeta =
      const VerificationMeta('steps_json');
  @override
  late final GeneratedColumn<String> steps_json = GeneratedColumn<String>(
      'steps_json', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        timestamp,
        created_by,
        name,
        description,
        ingredients_json,
        steps_json
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'recipes';
  @override
  VerificationContext validateIntegrity(Insertable<Recipe> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('timestamp')) {
      context.handle(_timestampMeta,
          timestamp.isAcceptableOrUnknown(data['timestamp']!, _timestampMeta));
    } else if (isInserting) {
      context.missing(_timestampMeta);
    }
    if (data.containsKey('created_by')) {
      context.handle(
          _created_byMeta,
          created_by.isAcceptableOrUnknown(
              data['created_by']!, _created_byMeta));
    } else if (isInserting) {
      context.missing(_created_byMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('ingredients_json')) {
      context.handle(
          _ingredients_jsonMeta,
          ingredients_json.isAcceptableOrUnknown(
              data['ingredients_json']!, _ingredients_jsonMeta));
    } else if (isInserting) {
      context.missing(_ingredients_jsonMeta);
    }
    if (data.containsKey('steps_json')) {
      context.handle(
          _steps_jsonMeta,
          steps_json.isAcceptableOrUnknown(
              data['steps_json']!, _steps_jsonMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Recipe map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Recipe(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      timestamp: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}timestamp'])!,
      created_by: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}created_by'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      ingredients_json: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}ingredients_json'])!,
      steps_json: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}steps_json']),
    );
  }

  @override
  $RecipesTable createAlias(String alias) {
    return $RecipesTable(attachedDatabase, alias);
  }
}

class Recipe extends DataClass implements Insertable<Recipe> {
  final int id;
  final DateTime timestamp;
  final String created_by;
  final String name;
  final String description;
  final String ingredients_json;
  final String? steps_json;
  const Recipe(
      {required this.id,
      required this.timestamp,
      required this.created_by,
      required this.name,
      required this.description,
      required this.ingredients_json,
      this.steps_json});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['timestamp'] = Variable<DateTime>(timestamp);
    map['created_by'] = Variable<String>(created_by);
    map['name'] = Variable<String>(name);
    map['description'] = Variable<String>(description);
    map['ingredients_json'] = Variable<String>(ingredients_json);
    if (!nullToAbsent || steps_json != null) {
      map['steps_json'] = Variable<String>(steps_json);
    }
    return map;
  }

  RecipesCompanion toCompanion(bool nullToAbsent) {
    return RecipesCompanion(
      id: Value(id),
      timestamp: Value(timestamp),
      created_by: Value(created_by),
      name: Value(name),
      description: Value(description),
      ingredients_json: Value(ingredients_json),
      steps_json: steps_json == null && nullToAbsent
          ? const Value.absent()
          : Value(steps_json),
    );
  }

  factory Recipe.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Recipe(
      id: serializer.fromJson<int>(json['id']),
      timestamp: serializer.fromJson<DateTime>(json['timestamp']),
      created_by: serializer.fromJson<String>(json['created_by']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String>(json['description']),
      ingredients_json: serializer.fromJson<String>(json['ingredients_json']),
      steps_json: serializer.fromJson<String?>(json['steps_json']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'timestamp': serializer.toJson<DateTime>(timestamp),
      'created_by': serializer.toJson<String>(created_by),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String>(description),
      'ingredients_json': serializer.toJson<String>(ingredients_json),
      'steps_json': serializer.toJson<String?>(steps_json),
    };
  }

  Recipe copyWith(
          {int? id,
          DateTime? timestamp,
          String? created_by,
          String? name,
          String? description,
          String? ingredients_json,
          Value<String?> steps_json = const Value.absent()}) =>
      Recipe(
        id: id ?? this.id,
        timestamp: timestamp ?? this.timestamp,
        created_by: created_by ?? this.created_by,
        name: name ?? this.name,
        description: description ?? this.description,
        ingredients_json: ingredients_json ?? this.ingredients_json,
        steps_json: steps_json.present ? steps_json.value : this.steps_json,
      );
  Recipe copyWithCompanion(RecipesCompanion data) {
    return Recipe(
      id: data.id.present ? data.id.value : this.id,
      timestamp: data.timestamp.present ? data.timestamp.value : this.timestamp,
      created_by:
          data.created_by.present ? data.created_by.value : this.created_by,
      name: data.name.present ? data.name.value : this.name,
      description:
          data.description.present ? data.description.value : this.description,
      ingredients_json: data.ingredients_json.present
          ? data.ingredients_json.value
          : this.ingredients_json,
      steps_json:
          data.steps_json.present ? data.steps_json.value : this.steps_json,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Recipe(')
          ..write('id: $id, ')
          ..write('timestamp: $timestamp, ')
          ..write('created_by: $created_by, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('ingredients_json: $ingredients_json, ')
          ..write('steps_json: $steps_json')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, timestamp, created_by, name, description,
      ingredients_json, steps_json);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Recipe &&
          other.id == this.id &&
          other.timestamp == this.timestamp &&
          other.created_by == this.created_by &&
          other.name == this.name &&
          other.description == this.description &&
          other.ingredients_json == this.ingredients_json &&
          other.steps_json == this.steps_json);
}

class RecipesCompanion extends UpdateCompanion<Recipe> {
  final Value<int> id;
  final Value<DateTime> timestamp;
  final Value<String> created_by;
  final Value<String> name;
  final Value<String> description;
  final Value<String> ingredients_json;
  final Value<String?> steps_json;
  const RecipesCompanion({
    this.id = const Value.absent(),
    this.timestamp = const Value.absent(),
    this.created_by = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.ingredients_json = const Value.absent(),
    this.steps_json = const Value.absent(),
  });
  RecipesCompanion.insert({
    this.id = const Value.absent(),
    required DateTime timestamp,
    required String created_by,
    required String name,
    required String description,
    required String ingredients_json,
    this.steps_json = const Value.absent(),
  })  : timestamp = Value(timestamp),
        created_by = Value(created_by),
        name = Value(name),
        description = Value(description),
        ingredients_json = Value(ingredients_json);
  static Insertable<Recipe> custom({
    Expression<int>? id,
    Expression<DateTime>? timestamp,
    Expression<String>? created_by,
    Expression<String>? name,
    Expression<String>? description,
    Expression<String>? ingredients_json,
    Expression<String>? steps_json,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (timestamp != null) 'timestamp': timestamp,
      if (created_by != null) 'created_by': created_by,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (ingredients_json != null) 'ingredients_json': ingredients_json,
      if (steps_json != null) 'steps_json': steps_json,
    });
  }

  RecipesCompanion copyWith(
      {Value<int>? id,
      Value<DateTime>? timestamp,
      Value<String>? created_by,
      Value<String>? name,
      Value<String>? description,
      Value<String>? ingredients_json,
      Value<String?>? steps_json}) {
    return RecipesCompanion(
      id: id ?? this.id,
      timestamp: timestamp ?? this.timestamp,
      created_by: created_by ?? this.created_by,
      name: name ?? this.name,
      description: description ?? this.description,
      ingredients_json: ingredients_json ?? this.ingredients_json,
      steps_json: steps_json ?? this.steps_json,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (timestamp.present) {
      map['timestamp'] = Variable<DateTime>(timestamp.value);
    }
    if (created_by.present) {
      map['created_by'] = Variable<String>(created_by.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (ingredients_json.present) {
      map['ingredients_json'] = Variable<String>(ingredients_json.value);
    }
    if (steps_json.present) {
      map['steps_json'] = Variable<String>(steps_json.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RecipesCompanion(')
          ..write('id: $id, ')
          ..write('timestamp: $timestamp, ')
          ..write('created_by: $created_by, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('ingredients_json: $ingredients_json, ')
          ..write('steps_json: $steps_json')
          ..write(')'))
        .toString();
  }
}

class $FoodDataTable extends FoodData
    with TableInfo<$FoodDataTable, FoodDataData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FoodDataTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _timestampMeta =
      const VerificationMeta('timestamp');
  @override
  late final GeneratedColumn<DateTime> timestamp = GeneratedColumn<DateTime>(
      'timestamp', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _ingredients_jsonMeta =
      const VerificationMeta('ingredients_json');
  @override
  late final GeneratedColumn<String> ingredients_json = GeneratedColumn<String>(
      'ingredients_json', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _image_pathMeta =
      const VerificationMeta('image_path');
  @override
  late final GeneratedColumn<String> image_path = GeneratedColumn<String>(
      'image_path', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _recipe_idMeta =
      const VerificationMeta('recipe_id');
  @override
  late final GeneratedColumn<int> recipe_id = GeneratedColumn<int>(
      'recipe_id', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES recipes (id)'));
  static const VerificationMeta _locationMeta =
      const VerificationMeta('location');
  @override
  late final GeneratedColumn<String> location = GeneratedColumn<String>(
      'location', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        timestamp,
        description,
        ingredients_json,
        image_path,
        recipe_id,
        location
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'food_data';
  @override
  VerificationContext validateIntegrity(Insertable<FoodDataData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('timestamp')) {
      context.handle(_timestampMeta,
          timestamp.isAcceptableOrUnknown(data['timestamp']!, _timestampMeta));
    } else if (isInserting) {
      context.missing(_timestampMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('ingredients_json')) {
      context.handle(
          _ingredients_jsonMeta,
          ingredients_json.isAcceptableOrUnknown(
              data['ingredients_json']!, _ingredients_jsonMeta));
    }
    if (data.containsKey('image_path')) {
      context.handle(
          _image_pathMeta,
          image_path.isAcceptableOrUnknown(
              data['image_path']!, _image_pathMeta));
    }
    if (data.containsKey('recipe_id')) {
      context.handle(_recipe_idMeta,
          recipe_id.isAcceptableOrUnknown(data['recipe_id']!, _recipe_idMeta));
    }
    if (data.containsKey('location')) {
      context.handle(_locationMeta,
          location.isAcceptableOrUnknown(data['location']!, _locationMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  FoodDataData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FoodDataData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      timestamp: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}timestamp'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      ingredients_json: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}ingredients_json']),
      image_path: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}image_path']),
      recipe_id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}recipe_id']),
      location: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}location']),
    );
  }

  @override
  $FoodDataTable createAlias(String alias) {
    return $FoodDataTable(attachedDatabase, alias);
  }
}

class FoodDataData extends DataClass implements Insertable<FoodDataData> {
  final int id;
  final DateTime timestamp;
  final String description;
  final String? ingredients_json;
  final String? image_path;
  final int? recipe_id;
  final String? location;
  const FoodDataData(
      {required this.id,
      required this.timestamp,
      required this.description,
      this.ingredients_json,
      this.image_path,
      this.recipe_id,
      this.location});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['timestamp'] = Variable<DateTime>(timestamp);
    map['description'] = Variable<String>(description);
    if (!nullToAbsent || ingredients_json != null) {
      map['ingredients_json'] = Variable<String>(ingredients_json);
    }
    if (!nullToAbsent || image_path != null) {
      map['image_path'] = Variable<String>(image_path);
    }
    if (!nullToAbsent || recipe_id != null) {
      map['recipe_id'] = Variable<int>(recipe_id);
    }
    if (!nullToAbsent || location != null) {
      map['location'] = Variable<String>(location);
    }
    return map;
  }

  FoodDataCompanion toCompanion(bool nullToAbsent) {
    return FoodDataCompanion(
      id: Value(id),
      timestamp: Value(timestamp),
      description: Value(description),
      ingredients_json: ingredients_json == null && nullToAbsent
          ? const Value.absent()
          : Value(ingredients_json),
      image_path: image_path == null && nullToAbsent
          ? const Value.absent()
          : Value(image_path),
      recipe_id: recipe_id == null && nullToAbsent
          ? const Value.absent()
          : Value(recipe_id),
      location: location == null && nullToAbsent
          ? const Value.absent()
          : Value(location),
    );
  }

  factory FoodDataData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FoodDataData(
      id: serializer.fromJson<int>(json['id']),
      timestamp: serializer.fromJson<DateTime>(json['timestamp']),
      description: serializer.fromJson<String>(json['description']),
      ingredients_json: serializer.fromJson<String?>(json['ingredients_json']),
      image_path: serializer.fromJson<String?>(json['image_path']),
      recipe_id: serializer.fromJson<int?>(json['recipe_id']),
      location: serializer.fromJson<String?>(json['location']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'timestamp': serializer.toJson<DateTime>(timestamp),
      'description': serializer.toJson<String>(description),
      'ingredients_json': serializer.toJson<String?>(ingredients_json),
      'image_path': serializer.toJson<String?>(image_path),
      'recipe_id': serializer.toJson<int?>(recipe_id),
      'location': serializer.toJson<String?>(location),
    };
  }

  FoodDataData copyWith(
          {int? id,
          DateTime? timestamp,
          String? description,
          Value<String?> ingredients_json = const Value.absent(),
          Value<String?> image_path = const Value.absent(),
          Value<int?> recipe_id = const Value.absent(),
          Value<String?> location = const Value.absent()}) =>
      FoodDataData(
        id: id ?? this.id,
        timestamp: timestamp ?? this.timestamp,
        description: description ?? this.description,
        ingredients_json: ingredients_json.present
            ? ingredients_json.value
            : this.ingredients_json,
        image_path: image_path.present ? image_path.value : this.image_path,
        recipe_id: recipe_id.present ? recipe_id.value : this.recipe_id,
        location: location.present ? location.value : this.location,
      );
  FoodDataData copyWithCompanion(FoodDataCompanion data) {
    return FoodDataData(
      id: data.id.present ? data.id.value : this.id,
      timestamp: data.timestamp.present ? data.timestamp.value : this.timestamp,
      description:
          data.description.present ? data.description.value : this.description,
      ingredients_json: data.ingredients_json.present
          ? data.ingredients_json.value
          : this.ingredients_json,
      image_path:
          data.image_path.present ? data.image_path.value : this.image_path,
      recipe_id: data.recipe_id.present ? data.recipe_id.value : this.recipe_id,
      location: data.location.present ? data.location.value : this.location,
    );
  }

  @override
  String toString() {
    return (StringBuffer('FoodDataData(')
          ..write('id: $id, ')
          ..write('timestamp: $timestamp, ')
          ..write('description: $description, ')
          ..write('ingredients_json: $ingredients_json, ')
          ..write('image_path: $image_path, ')
          ..write('recipe_id: $recipe_id, ')
          ..write('location: $location')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, timestamp, description, ingredients_json,
      image_path, recipe_id, location);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FoodDataData &&
          other.id == this.id &&
          other.timestamp == this.timestamp &&
          other.description == this.description &&
          other.ingredients_json == this.ingredients_json &&
          other.image_path == this.image_path &&
          other.recipe_id == this.recipe_id &&
          other.location == this.location);
}

class FoodDataCompanion extends UpdateCompanion<FoodDataData> {
  final Value<int> id;
  final Value<DateTime> timestamp;
  final Value<String> description;
  final Value<String?> ingredients_json;
  final Value<String?> image_path;
  final Value<int?> recipe_id;
  final Value<String?> location;
  const FoodDataCompanion({
    this.id = const Value.absent(),
    this.timestamp = const Value.absent(),
    this.description = const Value.absent(),
    this.ingredients_json = const Value.absent(),
    this.image_path = const Value.absent(),
    this.recipe_id = const Value.absent(),
    this.location = const Value.absent(),
  });
  FoodDataCompanion.insert({
    this.id = const Value.absent(),
    required DateTime timestamp,
    required String description,
    this.ingredients_json = const Value.absent(),
    this.image_path = const Value.absent(),
    this.recipe_id = const Value.absent(),
    this.location = const Value.absent(),
  })  : timestamp = Value(timestamp),
        description = Value(description);
  static Insertable<FoodDataData> custom({
    Expression<int>? id,
    Expression<DateTime>? timestamp,
    Expression<String>? description,
    Expression<String>? ingredients_json,
    Expression<String>? image_path,
    Expression<int>? recipe_id,
    Expression<String>? location,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (timestamp != null) 'timestamp': timestamp,
      if (description != null) 'description': description,
      if (ingredients_json != null) 'ingredients_json': ingredients_json,
      if (image_path != null) 'image_path': image_path,
      if (recipe_id != null) 'recipe_id': recipe_id,
      if (location != null) 'location': location,
    });
  }

  FoodDataCompanion copyWith(
      {Value<int>? id,
      Value<DateTime>? timestamp,
      Value<String>? description,
      Value<String?>? ingredients_json,
      Value<String?>? image_path,
      Value<int?>? recipe_id,
      Value<String?>? location}) {
    return FoodDataCompanion(
      id: id ?? this.id,
      timestamp: timestamp ?? this.timestamp,
      description: description ?? this.description,
      ingredients_json: ingredients_json ?? this.ingredients_json,
      image_path: image_path ?? this.image_path,
      recipe_id: recipe_id ?? this.recipe_id,
      location: location ?? this.location,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (timestamp.present) {
      map['timestamp'] = Variable<DateTime>(timestamp.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (ingredients_json.present) {
      map['ingredients_json'] = Variable<String>(ingredients_json.value);
    }
    if (image_path.present) {
      map['image_path'] = Variable<String>(image_path.value);
    }
    if (recipe_id.present) {
      map['recipe_id'] = Variable<int>(recipe_id.value);
    }
    if (location.present) {
      map['location'] = Variable<String>(location.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FoodDataCompanion(')
          ..write('id: $id, ')
          ..write('timestamp: $timestamp, ')
          ..write('description: $description, ')
          ..write('ingredients_json: $ingredients_json, ')
          ..write('image_path: $image_path, ')
          ..write('recipe_id: $recipe_id, ')
          ..write('location: $location')
          ..write(')'))
        .toString();
  }
}

class $MoodDataTable extends MoodData
    with TableInfo<$MoodDataTable, MoodDataData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MoodDataTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _timestampMeta =
      const VerificationMeta('timestamp');
  @override
  late final GeneratedColumn<DateTime> timestamp = GeneratedColumn<DateTime>(
      'timestamp', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _ratingMeta = const VerificationMeta('rating');
  @override
  late final GeneratedColumn<int> rating = GeneratedColumn<int>(
      'rating', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _moods_jsonMeta =
      const VerificationMeta('moods_json');
  @override
  late final GeneratedColumn<String> moods_json = GeneratedColumn<String>(
      'moods_json', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _noteMeta = const VerificationMeta('note');
  @override
  late final GeneratedColumn<String> note = GeneratedColumn<String>(
      'note', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, timestamp, rating, moods_json, note];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'mood_data';
  @override
  VerificationContext validateIntegrity(Insertable<MoodDataData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('timestamp')) {
      context.handle(_timestampMeta,
          timestamp.isAcceptableOrUnknown(data['timestamp']!, _timestampMeta));
    } else if (isInserting) {
      context.missing(_timestampMeta);
    }
    if (data.containsKey('rating')) {
      context.handle(_ratingMeta,
          rating.isAcceptableOrUnknown(data['rating']!, _ratingMeta));
    } else if (isInserting) {
      context.missing(_ratingMeta);
    }
    if (data.containsKey('moods_json')) {
      context.handle(
          _moods_jsonMeta,
          moods_json.isAcceptableOrUnknown(
              data['moods_json']!, _moods_jsonMeta));
    } else if (isInserting) {
      context.missing(_moods_jsonMeta);
    }
    if (data.containsKey('note')) {
      context.handle(
          _noteMeta, note.isAcceptableOrUnknown(data['note']!, _noteMeta));
    } else if (isInserting) {
      context.missing(_noteMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MoodDataData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MoodDataData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      timestamp: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}timestamp'])!,
      rating: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}rating'])!,
      moods_json: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}moods_json'])!,
      note: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}note'])!,
    );
  }

  @override
  $MoodDataTable createAlias(String alias) {
    return $MoodDataTable(attachedDatabase, alias);
  }
}

class MoodDataData extends DataClass implements Insertable<MoodDataData> {
  final int id;
  final DateTime timestamp;
  final int rating;
  final String moods_json;
  final String note;
  const MoodDataData(
      {required this.id,
      required this.timestamp,
      required this.rating,
      required this.moods_json,
      required this.note});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['timestamp'] = Variable<DateTime>(timestamp);
    map['rating'] = Variable<int>(rating);
    map['moods_json'] = Variable<String>(moods_json);
    map['note'] = Variable<String>(note);
    return map;
  }

  MoodDataCompanion toCompanion(bool nullToAbsent) {
    return MoodDataCompanion(
      id: Value(id),
      timestamp: Value(timestamp),
      rating: Value(rating),
      moods_json: Value(moods_json),
      note: Value(note),
    );
  }

  factory MoodDataData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MoodDataData(
      id: serializer.fromJson<int>(json['id']),
      timestamp: serializer.fromJson<DateTime>(json['timestamp']),
      rating: serializer.fromJson<int>(json['rating']),
      moods_json: serializer.fromJson<String>(json['moods_json']),
      note: serializer.fromJson<String>(json['note']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'timestamp': serializer.toJson<DateTime>(timestamp),
      'rating': serializer.toJson<int>(rating),
      'moods_json': serializer.toJson<String>(moods_json),
      'note': serializer.toJson<String>(note),
    };
  }

  MoodDataData copyWith(
          {int? id,
          DateTime? timestamp,
          int? rating,
          String? moods_json,
          String? note}) =>
      MoodDataData(
        id: id ?? this.id,
        timestamp: timestamp ?? this.timestamp,
        rating: rating ?? this.rating,
        moods_json: moods_json ?? this.moods_json,
        note: note ?? this.note,
      );
  MoodDataData copyWithCompanion(MoodDataCompanion data) {
    return MoodDataData(
      id: data.id.present ? data.id.value : this.id,
      timestamp: data.timestamp.present ? data.timestamp.value : this.timestamp,
      rating: data.rating.present ? data.rating.value : this.rating,
      moods_json:
          data.moods_json.present ? data.moods_json.value : this.moods_json,
      note: data.note.present ? data.note.value : this.note,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MoodDataData(')
          ..write('id: $id, ')
          ..write('timestamp: $timestamp, ')
          ..write('rating: $rating, ')
          ..write('moods_json: $moods_json, ')
          ..write('note: $note')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, timestamp, rating, moods_json, note);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MoodDataData &&
          other.id == this.id &&
          other.timestamp == this.timestamp &&
          other.rating == this.rating &&
          other.moods_json == this.moods_json &&
          other.note == this.note);
}

class MoodDataCompanion extends UpdateCompanion<MoodDataData> {
  final Value<int> id;
  final Value<DateTime> timestamp;
  final Value<int> rating;
  final Value<String> moods_json;
  final Value<String> note;
  const MoodDataCompanion({
    this.id = const Value.absent(),
    this.timestamp = const Value.absent(),
    this.rating = const Value.absent(),
    this.moods_json = const Value.absent(),
    this.note = const Value.absent(),
  });
  MoodDataCompanion.insert({
    this.id = const Value.absent(),
    required DateTime timestamp,
    required int rating,
    required String moods_json,
    required String note,
  })  : timestamp = Value(timestamp),
        rating = Value(rating),
        moods_json = Value(moods_json),
        note = Value(note);
  static Insertable<MoodDataData> custom({
    Expression<int>? id,
    Expression<DateTime>? timestamp,
    Expression<int>? rating,
    Expression<String>? moods_json,
    Expression<String>? note,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (timestamp != null) 'timestamp': timestamp,
      if (rating != null) 'rating': rating,
      if (moods_json != null) 'moods_json': moods_json,
      if (note != null) 'note': note,
    });
  }

  MoodDataCompanion copyWith(
      {Value<int>? id,
      Value<DateTime>? timestamp,
      Value<int>? rating,
      Value<String>? moods_json,
      Value<String>? note}) {
    return MoodDataCompanion(
      id: id ?? this.id,
      timestamp: timestamp ?? this.timestamp,
      rating: rating ?? this.rating,
      moods_json: moods_json ?? this.moods_json,
      note: note ?? this.note,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (timestamp.present) {
      map['timestamp'] = Variable<DateTime>(timestamp.value);
    }
    if (rating.present) {
      map['rating'] = Variable<int>(rating.value);
    }
    if (moods_json.present) {
      map['moods_json'] = Variable<String>(moods_json.value);
    }
    if (note.present) {
      map['note'] = Variable<String>(note.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MoodDataCompanion(')
          ..write('id: $id, ')
          ..write('timestamp: $timestamp, ')
          ..write('rating: $rating, ')
          ..write('moods_json: $moods_json, ')
          ..write('note: $note')
          ..write(')'))
        .toString();
  }
}

class $JournalDataTable extends JournalData
    with TableInfo<$JournalDataTable, JournalDataData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $JournalDataTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _timestampMeta =
      const VerificationMeta('timestamp');
  @override
  late final GeneratedColumn<DateTime> timestamp = GeneratedColumn<DateTime>(
      'timestamp', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _entryMeta = const VerificationMeta('entry');
  @override
  late final GeneratedColumn<String> entry = GeneratedColumn<String>(
      'entry', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, timestamp, entry];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'journal_data';
  @override
  VerificationContext validateIntegrity(Insertable<JournalDataData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('timestamp')) {
      context.handle(_timestampMeta,
          timestamp.isAcceptableOrUnknown(data['timestamp']!, _timestampMeta));
    } else if (isInserting) {
      context.missing(_timestampMeta);
    }
    if (data.containsKey('entry')) {
      context.handle(
          _entryMeta, entry.isAcceptableOrUnknown(data['entry']!, _entryMeta));
    } else if (isInserting) {
      context.missing(_entryMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  JournalDataData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return JournalDataData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      timestamp: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}timestamp'])!,
      entry: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}entry'])!,
    );
  }

  @override
  $JournalDataTable createAlias(String alias) {
    return $JournalDataTable(attachedDatabase, alias);
  }
}

class JournalDataData extends DataClass implements Insertable<JournalDataData> {
  final int id;
  final DateTime timestamp;
  final String entry;
  const JournalDataData(
      {required this.id, required this.timestamp, required this.entry});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['timestamp'] = Variable<DateTime>(timestamp);
    map['entry'] = Variable<String>(entry);
    return map;
  }

  JournalDataCompanion toCompanion(bool nullToAbsent) {
    return JournalDataCompanion(
      id: Value(id),
      timestamp: Value(timestamp),
      entry: Value(entry),
    );
  }

  factory JournalDataData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return JournalDataData(
      id: serializer.fromJson<int>(json['id']),
      timestamp: serializer.fromJson<DateTime>(json['timestamp']),
      entry: serializer.fromJson<String>(json['entry']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'timestamp': serializer.toJson<DateTime>(timestamp),
      'entry': serializer.toJson<String>(entry),
    };
  }

  JournalDataData copyWith({int? id, DateTime? timestamp, String? entry}) =>
      JournalDataData(
        id: id ?? this.id,
        timestamp: timestamp ?? this.timestamp,
        entry: entry ?? this.entry,
      );
  JournalDataData copyWithCompanion(JournalDataCompanion data) {
    return JournalDataData(
      id: data.id.present ? data.id.value : this.id,
      timestamp: data.timestamp.present ? data.timestamp.value : this.timestamp,
      entry: data.entry.present ? data.entry.value : this.entry,
    );
  }

  @override
  String toString() {
    return (StringBuffer('JournalDataData(')
          ..write('id: $id, ')
          ..write('timestamp: $timestamp, ')
          ..write('entry: $entry')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, timestamp, entry);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is JournalDataData &&
          other.id == this.id &&
          other.timestamp == this.timestamp &&
          other.entry == this.entry);
}

class JournalDataCompanion extends UpdateCompanion<JournalDataData> {
  final Value<int> id;
  final Value<DateTime> timestamp;
  final Value<String> entry;
  const JournalDataCompanion({
    this.id = const Value.absent(),
    this.timestamp = const Value.absent(),
    this.entry = const Value.absent(),
  });
  JournalDataCompanion.insert({
    this.id = const Value.absent(),
    required DateTime timestamp,
    required String entry,
  })  : timestamp = Value(timestamp),
        entry = Value(entry);
  static Insertable<JournalDataData> custom({
    Expression<int>? id,
    Expression<DateTime>? timestamp,
    Expression<String>? entry,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (timestamp != null) 'timestamp': timestamp,
      if (entry != null) 'entry': entry,
    });
  }

  JournalDataCompanion copyWith(
      {Value<int>? id, Value<DateTime>? timestamp, Value<String>? entry}) {
    return JournalDataCompanion(
      id: id ?? this.id,
      timestamp: timestamp ?? this.timestamp,
      entry: entry ?? this.entry,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (timestamp.present) {
      map['timestamp'] = Variable<DateTime>(timestamp.value);
    }
    if (entry.present) {
      map['entry'] = Variable<String>(entry.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('JournalDataCompanion(')
          ..write('id: $id, ')
          ..write('timestamp: $timestamp, ')
          ..write('entry: $entry')
          ..write(')'))
        .toString();
  }
}

class $ExportLogTable extends ExportLog
    with TableInfo<$ExportLogTable, ExportLogData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ExportLogTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _timestampMeta =
      const VerificationMeta('timestamp');
  @override
  late final GeneratedColumn<DateTime> timestamp = GeneratedColumn<DateTime>(
      'timestamp', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _export_typeMeta =
      const VerificationMeta('export_type');
  @override
  late final GeneratedColumn<String> export_type = GeneratedColumn<String>(
      'export_type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _last_exportMeta =
      const VerificationMeta('last_export');
  @override
  late final GeneratedColumn<DateTime> last_export = GeneratedColumn<DateTime>(
      'last_export', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, timestamp, export_type, last_export];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'export_log';
  @override
  VerificationContext validateIntegrity(Insertable<ExportLogData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('timestamp')) {
      context.handle(_timestampMeta,
          timestamp.isAcceptableOrUnknown(data['timestamp']!, _timestampMeta));
    } else if (isInserting) {
      context.missing(_timestampMeta);
    }
    if (data.containsKey('export_type')) {
      context.handle(
          _export_typeMeta,
          export_type.isAcceptableOrUnknown(
              data['export_type']!, _export_typeMeta));
    } else if (isInserting) {
      context.missing(_export_typeMeta);
    }
    if (data.containsKey('last_export')) {
      context.handle(
          _last_exportMeta,
          last_export.isAcceptableOrUnknown(
              data['last_export']!, _last_exportMeta));
    } else if (isInserting) {
      context.missing(_last_exportMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ExportLogData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ExportLogData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      timestamp: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}timestamp'])!,
      export_type: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}export_type'])!,
      last_export: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}last_export'])!,
    );
  }

  @override
  $ExportLogTable createAlias(String alias) {
    return $ExportLogTable(attachedDatabase, alias);
  }
}

class ExportLogData extends DataClass implements Insertable<ExportLogData> {
  final int id;
  final DateTime timestamp;
  final String export_type;
  final DateTime last_export;
  const ExportLogData(
      {required this.id,
      required this.timestamp,
      required this.export_type,
      required this.last_export});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['timestamp'] = Variable<DateTime>(timestamp);
    map['export_type'] = Variable<String>(export_type);
    map['last_export'] = Variable<DateTime>(last_export);
    return map;
  }

  ExportLogCompanion toCompanion(bool nullToAbsent) {
    return ExportLogCompanion(
      id: Value(id),
      timestamp: Value(timestamp),
      export_type: Value(export_type),
      last_export: Value(last_export),
    );
  }

  factory ExportLogData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ExportLogData(
      id: serializer.fromJson<int>(json['id']),
      timestamp: serializer.fromJson<DateTime>(json['timestamp']),
      export_type: serializer.fromJson<String>(json['export_type']),
      last_export: serializer.fromJson<DateTime>(json['last_export']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'timestamp': serializer.toJson<DateTime>(timestamp),
      'export_type': serializer.toJson<String>(export_type),
      'last_export': serializer.toJson<DateTime>(last_export),
    };
  }

  ExportLogData copyWith(
          {int? id,
          DateTime? timestamp,
          String? export_type,
          DateTime? last_export}) =>
      ExportLogData(
        id: id ?? this.id,
        timestamp: timestamp ?? this.timestamp,
        export_type: export_type ?? this.export_type,
        last_export: last_export ?? this.last_export,
      );
  ExportLogData copyWithCompanion(ExportLogCompanion data) {
    return ExportLogData(
      id: data.id.present ? data.id.value : this.id,
      timestamp: data.timestamp.present ? data.timestamp.value : this.timestamp,
      export_type:
          data.export_type.present ? data.export_type.value : this.export_type,
      last_export:
          data.last_export.present ? data.last_export.value : this.last_export,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ExportLogData(')
          ..write('id: $id, ')
          ..write('timestamp: $timestamp, ')
          ..write('export_type: $export_type, ')
          ..write('last_export: $last_export')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, timestamp, export_type, last_export);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ExportLogData &&
          other.id == this.id &&
          other.timestamp == this.timestamp &&
          other.export_type == this.export_type &&
          other.last_export == this.last_export);
}

class ExportLogCompanion extends UpdateCompanion<ExportLogData> {
  final Value<int> id;
  final Value<DateTime> timestamp;
  final Value<String> export_type;
  final Value<DateTime> last_export;
  const ExportLogCompanion({
    this.id = const Value.absent(),
    this.timestamp = const Value.absent(),
    this.export_type = const Value.absent(),
    this.last_export = const Value.absent(),
  });
  ExportLogCompanion.insert({
    this.id = const Value.absent(),
    required DateTime timestamp,
    required String export_type,
    required DateTime last_export,
  })  : timestamp = Value(timestamp),
        export_type = Value(export_type),
        last_export = Value(last_export);
  static Insertable<ExportLogData> custom({
    Expression<int>? id,
    Expression<DateTime>? timestamp,
    Expression<String>? export_type,
    Expression<DateTime>? last_export,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (timestamp != null) 'timestamp': timestamp,
      if (export_type != null) 'export_type': export_type,
      if (last_export != null) 'last_export': last_export,
    });
  }

  ExportLogCompanion copyWith(
      {Value<int>? id,
      Value<DateTime>? timestamp,
      Value<String>? export_type,
      Value<DateTime>? last_export}) {
    return ExportLogCompanion(
      id: id ?? this.id,
      timestamp: timestamp ?? this.timestamp,
      export_type: export_type ?? this.export_type,
      last_export: last_export ?? this.last_export,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (timestamp.present) {
      map['timestamp'] = Variable<DateTime>(timestamp.value);
    }
    if (export_type.present) {
      map['export_type'] = Variable<String>(export_type.value);
    }
    if (last_export.present) {
      map['last_export'] = Variable<DateTime>(last_export.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ExportLogCompanion(')
          ..write('id: $id, ')
          ..write('timestamp: $timestamp, ')
          ..write('export_type: $export_type, ')
          ..write('last_export: $last_export')
          ..write(')'))
        .toString();
  }
}

class $SleepDataTable extends SleepData
    with TableInfo<$SleepDataTable, SleepDataData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SleepDataTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _timestampMeta =
      const VerificationMeta('timestamp');
  @override
  late final GeneratedColumn<DateTime> timestamp = GeneratedColumn<DateTime>(
      'timestamp', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _sleep_timeMeta =
      const VerificationMeta('sleep_time');
  @override
  late final GeneratedColumn<DateTime> sleep_time = GeneratedColumn<DateTime>(
      'sleep_time', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _wake_timeMeta =
      const VerificationMeta('wake_time');
  @override
  late final GeneratedColumn<DateTime> wake_time = GeneratedColumn<DateTime>(
      'wake_time', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _dream_logMeta =
      const VerificationMeta('dream_log');
  @override
  late final GeneratedColumn<String> dream_log = GeneratedColumn<String>(
      'dream_log', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _STILL_ASLEEPMeta =
      const VerificationMeta('STILL_ASLEEP');
  @override
  late final GeneratedColumn<bool> STILL_ASLEEP = GeneratedColumn<bool>(
      'still_asleep', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("still_asleep" IN (0, 1))'));
  @override
  List<GeneratedColumn> get $columns =>
      [id, timestamp, sleep_time, wake_time, dream_log, STILL_ASLEEP];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'sleep_data';
  @override
  VerificationContext validateIntegrity(Insertable<SleepDataData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('timestamp')) {
      context.handle(_timestampMeta,
          timestamp.isAcceptableOrUnknown(data['timestamp']!, _timestampMeta));
    } else if (isInserting) {
      context.missing(_timestampMeta);
    }
    if (data.containsKey('sleep_time')) {
      context.handle(
          _sleep_timeMeta,
          sleep_time.isAcceptableOrUnknown(
              data['sleep_time']!, _sleep_timeMeta));
    } else if (isInserting) {
      context.missing(_sleep_timeMeta);
    }
    if (data.containsKey('wake_time')) {
      context.handle(_wake_timeMeta,
          wake_time.isAcceptableOrUnknown(data['wake_time']!, _wake_timeMeta));
    }
    if (data.containsKey('dream_log')) {
      context.handle(_dream_logMeta,
          dream_log.isAcceptableOrUnknown(data['dream_log']!, _dream_logMeta));
    }
    if (data.containsKey('still_asleep')) {
      context.handle(
          _STILL_ASLEEPMeta,
          STILL_ASLEEP.isAcceptableOrUnknown(
              data['still_asleep']!, _STILL_ASLEEPMeta));
    } else if (isInserting) {
      context.missing(_STILL_ASLEEPMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SleepDataData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SleepDataData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      timestamp: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}timestamp'])!,
      sleep_time: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}sleep_time'])!,
      wake_time: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}wake_time']),
      dream_log: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}dream_log']),
      STILL_ASLEEP: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}still_asleep'])!,
    );
  }

  @override
  $SleepDataTable createAlias(String alias) {
    return $SleepDataTable(attachedDatabase, alias);
  }
}

class SleepDataData extends DataClass implements Insertable<SleepDataData> {
  final int id;
  final DateTime timestamp;
  final DateTime sleep_time;
  final DateTime? wake_time;
  final String? dream_log;
  final bool STILL_ASLEEP;
  const SleepDataData(
      {required this.id,
      required this.timestamp,
      required this.sleep_time,
      this.wake_time,
      this.dream_log,
      required this.STILL_ASLEEP});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['timestamp'] = Variable<DateTime>(timestamp);
    map['sleep_time'] = Variable<DateTime>(sleep_time);
    if (!nullToAbsent || wake_time != null) {
      map['wake_time'] = Variable<DateTime>(wake_time);
    }
    if (!nullToAbsent || dream_log != null) {
      map['dream_log'] = Variable<String>(dream_log);
    }
    map['still_asleep'] = Variable<bool>(STILL_ASLEEP);
    return map;
  }

  SleepDataCompanion toCompanion(bool nullToAbsent) {
    return SleepDataCompanion(
      id: Value(id),
      timestamp: Value(timestamp),
      sleep_time: Value(sleep_time),
      wake_time: wake_time == null && nullToAbsent
          ? const Value.absent()
          : Value(wake_time),
      dream_log: dream_log == null && nullToAbsent
          ? const Value.absent()
          : Value(dream_log),
      STILL_ASLEEP: Value(STILL_ASLEEP),
    );
  }

  factory SleepDataData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SleepDataData(
      id: serializer.fromJson<int>(json['id']),
      timestamp: serializer.fromJson<DateTime>(json['timestamp']),
      sleep_time: serializer.fromJson<DateTime>(json['sleep_time']),
      wake_time: serializer.fromJson<DateTime?>(json['wake_time']),
      dream_log: serializer.fromJson<String?>(json['dream_log']),
      STILL_ASLEEP: serializer.fromJson<bool>(json['STILL_ASLEEP']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'timestamp': serializer.toJson<DateTime>(timestamp),
      'sleep_time': serializer.toJson<DateTime>(sleep_time),
      'wake_time': serializer.toJson<DateTime?>(wake_time),
      'dream_log': serializer.toJson<String?>(dream_log),
      'STILL_ASLEEP': serializer.toJson<bool>(STILL_ASLEEP),
    };
  }

  SleepDataData copyWith(
          {int? id,
          DateTime? timestamp,
          DateTime? sleep_time,
          Value<DateTime?> wake_time = const Value.absent(),
          Value<String?> dream_log = const Value.absent(),
          bool? STILL_ASLEEP}) =>
      SleepDataData(
        id: id ?? this.id,
        timestamp: timestamp ?? this.timestamp,
        sleep_time: sleep_time ?? this.sleep_time,
        wake_time: wake_time.present ? wake_time.value : this.wake_time,
        dream_log: dream_log.present ? dream_log.value : this.dream_log,
        STILL_ASLEEP: STILL_ASLEEP ?? this.STILL_ASLEEP,
      );
  SleepDataData copyWithCompanion(SleepDataCompanion data) {
    return SleepDataData(
      id: data.id.present ? data.id.value : this.id,
      timestamp: data.timestamp.present ? data.timestamp.value : this.timestamp,
      sleep_time:
          data.sleep_time.present ? data.sleep_time.value : this.sleep_time,
      wake_time: data.wake_time.present ? data.wake_time.value : this.wake_time,
      dream_log: data.dream_log.present ? data.dream_log.value : this.dream_log,
      STILL_ASLEEP: data.STILL_ASLEEP.present
          ? data.STILL_ASLEEP.value
          : this.STILL_ASLEEP,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SleepDataData(')
          ..write('id: $id, ')
          ..write('timestamp: $timestamp, ')
          ..write('sleep_time: $sleep_time, ')
          ..write('wake_time: $wake_time, ')
          ..write('dream_log: $dream_log, ')
          ..write('STILL_ASLEEP: $STILL_ASLEEP')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, timestamp, sleep_time, wake_time, dream_log, STILL_ASLEEP);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SleepDataData &&
          other.id == this.id &&
          other.timestamp == this.timestamp &&
          other.sleep_time == this.sleep_time &&
          other.wake_time == this.wake_time &&
          other.dream_log == this.dream_log &&
          other.STILL_ASLEEP == this.STILL_ASLEEP);
}

class SleepDataCompanion extends UpdateCompanion<SleepDataData> {
  final Value<int> id;
  final Value<DateTime> timestamp;
  final Value<DateTime> sleep_time;
  final Value<DateTime?> wake_time;
  final Value<String?> dream_log;
  final Value<bool> STILL_ASLEEP;
  const SleepDataCompanion({
    this.id = const Value.absent(),
    this.timestamp = const Value.absent(),
    this.sleep_time = const Value.absent(),
    this.wake_time = const Value.absent(),
    this.dream_log = const Value.absent(),
    this.STILL_ASLEEP = const Value.absent(),
  });
  SleepDataCompanion.insert({
    this.id = const Value.absent(),
    required DateTime timestamp,
    required DateTime sleep_time,
    this.wake_time = const Value.absent(),
    this.dream_log = const Value.absent(),
    required bool STILL_ASLEEP,
  })  : timestamp = Value(timestamp),
        sleep_time = Value(sleep_time),
        STILL_ASLEEP = Value(STILL_ASLEEP);
  static Insertable<SleepDataData> custom({
    Expression<int>? id,
    Expression<DateTime>? timestamp,
    Expression<DateTime>? sleep_time,
    Expression<DateTime>? wake_time,
    Expression<String>? dream_log,
    Expression<bool>? STILL_ASLEEP,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (timestamp != null) 'timestamp': timestamp,
      if (sleep_time != null) 'sleep_time': sleep_time,
      if (wake_time != null) 'wake_time': wake_time,
      if (dream_log != null) 'dream_log': dream_log,
      if (STILL_ASLEEP != null) 'still_asleep': STILL_ASLEEP,
    });
  }

  SleepDataCompanion copyWith(
      {Value<int>? id,
      Value<DateTime>? timestamp,
      Value<DateTime>? sleep_time,
      Value<DateTime?>? wake_time,
      Value<String?>? dream_log,
      Value<bool>? STILL_ASLEEP}) {
    return SleepDataCompanion(
      id: id ?? this.id,
      timestamp: timestamp ?? this.timestamp,
      sleep_time: sleep_time ?? this.sleep_time,
      wake_time: wake_time ?? this.wake_time,
      dream_log: dream_log ?? this.dream_log,
      STILL_ASLEEP: STILL_ASLEEP ?? this.STILL_ASLEEP,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (timestamp.present) {
      map['timestamp'] = Variable<DateTime>(timestamp.value);
    }
    if (sleep_time.present) {
      map['sleep_time'] = Variable<DateTime>(sleep_time.value);
    }
    if (wake_time.present) {
      map['wake_time'] = Variable<DateTime>(wake_time.value);
    }
    if (dream_log.present) {
      map['dream_log'] = Variable<String>(dream_log.value);
    }
    if (STILL_ASLEEP.present) {
      map['still_asleep'] = Variable<bool>(STILL_ASLEEP.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SleepDataCompanion(')
          ..write('id: $id, ')
          ..write('timestamp: $timestamp, ')
          ..write('sleep_time: $sleep_time, ')
          ..write('wake_time: $wake_time, ')
          ..write('dream_log: $dream_log, ')
          ..write('STILL_ASLEEP: $STILL_ASLEEP')
          ..write(')'))
        .toString();
  }
}

class $ThoughtDataTable extends ThoughtData
    with TableInfo<$ThoughtDataTable, ThoughtDataData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ThoughtDataTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _timestampMeta =
      const VerificationMeta('timestamp');
  @override
  late final GeneratedColumn<DateTime> timestamp = GeneratedColumn<DateTime>(
      'timestamp', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _start_timeMeta =
      const VerificationMeta('start_time');
  @override
  late final GeneratedColumn<DateTime> start_time = GeneratedColumn<DateTime>(
      'start_time', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _end_timeMeta =
      const VerificationMeta('end_time');
  @override
  late final GeneratedColumn<DateTime> end_time = GeneratedColumn<DateTime>(
      'end_time', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _lengthMeta = const VerificationMeta('length');
  @override
  late final GeneratedColumn<int> length = GeneratedColumn<int>(
      'length', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _depthMeta = const VerificationMeta('depth');
  @override
  late final GeneratedColumn<int> depth = GeneratedColumn<int>(
      'depth', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _thought_logMeta =
      const VerificationMeta('thought_log');
  @override
  late final GeneratedColumn<String> thought_log = GeneratedColumn<String>(
      'thought_log', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _STILL_THINKINGMeta =
      const VerificationMeta('STILL_THINKING');
  @override
  late final GeneratedColumn<bool> STILL_THINKING = GeneratedColumn<bool>(
      'still_thinking', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("still_thinking" IN (0, 1))'));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        timestamp,
        start_time,
        end_time,
        length,
        depth,
        thought_log,
        STILL_THINKING
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'thought_data';
  @override
  VerificationContext validateIntegrity(Insertable<ThoughtDataData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('timestamp')) {
      context.handle(_timestampMeta,
          timestamp.isAcceptableOrUnknown(data['timestamp']!, _timestampMeta));
    } else if (isInserting) {
      context.missing(_timestampMeta);
    }
    if (data.containsKey('start_time')) {
      context.handle(
          _start_timeMeta,
          start_time.isAcceptableOrUnknown(
              data['start_time']!, _start_timeMeta));
    } else if (isInserting) {
      context.missing(_start_timeMeta);
    }
    if (data.containsKey('end_time')) {
      context.handle(_end_timeMeta,
          end_time.isAcceptableOrUnknown(data['end_time']!, _end_timeMeta));
    } else if (isInserting) {
      context.missing(_end_timeMeta);
    }
    if (data.containsKey('length')) {
      context.handle(_lengthMeta,
          length.isAcceptableOrUnknown(data['length']!, _lengthMeta));
    } else if (isInserting) {
      context.missing(_lengthMeta);
    }
    if (data.containsKey('depth')) {
      context.handle(
          _depthMeta, depth.isAcceptableOrUnknown(data['depth']!, _depthMeta));
    } else if (isInserting) {
      context.missing(_depthMeta);
    }
    if (data.containsKey('thought_log')) {
      context.handle(
          _thought_logMeta,
          thought_log.isAcceptableOrUnknown(
              data['thought_log']!, _thought_logMeta));
    } else if (isInserting) {
      context.missing(_thought_logMeta);
    }
    if (data.containsKey('still_thinking')) {
      context.handle(
          _STILL_THINKINGMeta,
          STILL_THINKING.isAcceptableOrUnknown(
              data['still_thinking']!, _STILL_THINKINGMeta));
    } else if (isInserting) {
      context.missing(_STILL_THINKINGMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ThoughtDataData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ThoughtDataData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      timestamp: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}timestamp'])!,
      start_time: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}start_time'])!,
      end_time: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}end_time'])!,
      length: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}length'])!,
      depth: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}depth'])!,
      thought_log: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}thought_log'])!,
      STILL_THINKING: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}still_thinking'])!,
    );
  }

  @override
  $ThoughtDataTable createAlias(String alias) {
    return $ThoughtDataTable(attachedDatabase, alias);
  }
}

class ThoughtDataData extends DataClass implements Insertable<ThoughtDataData> {
  final int id;
  final DateTime timestamp;
  final DateTime start_time;
  final DateTime end_time;
  final int length;
  final int depth;
  final String thought_log;
  final bool STILL_THINKING;
  const ThoughtDataData(
      {required this.id,
      required this.timestamp,
      required this.start_time,
      required this.end_time,
      required this.length,
      required this.depth,
      required this.thought_log,
      required this.STILL_THINKING});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['timestamp'] = Variable<DateTime>(timestamp);
    map['start_time'] = Variable<DateTime>(start_time);
    map['end_time'] = Variable<DateTime>(end_time);
    map['length'] = Variable<int>(length);
    map['depth'] = Variable<int>(depth);
    map['thought_log'] = Variable<String>(thought_log);
    map['still_thinking'] = Variable<bool>(STILL_THINKING);
    return map;
  }

  ThoughtDataCompanion toCompanion(bool nullToAbsent) {
    return ThoughtDataCompanion(
      id: Value(id),
      timestamp: Value(timestamp),
      start_time: Value(start_time),
      end_time: Value(end_time),
      length: Value(length),
      depth: Value(depth),
      thought_log: Value(thought_log),
      STILL_THINKING: Value(STILL_THINKING),
    );
  }

  factory ThoughtDataData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ThoughtDataData(
      id: serializer.fromJson<int>(json['id']),
      timestamp: serializer.fromJson<DateTime>(json['timestamp']),
      start_time: serializer.fromJson<DateTime>(json['start_time']),
      end_time: serializer.fromJson<DateTime>(json['end_time']),
      length: serializer.fromJson<int>(json['length']),
      depth: serializer.fromJson<int>(json['depth']),
      thought_log: serializer.fromJson<String>(json['thought_log']),
      STILL_THINKING: serializer.fromJson<bool>(json['STILL_THINKING']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'timestamp': serializer.toJson<DateTime>(timestamp),
      'start_time': serializer.toJson<DateTime>(start_time),
      'end_time': serializer.toJson<DateTime>(end_time),
      'length': serializer.toJson<int>(length),
      'depth': serializer.toJson<int>(depth),
      'thought_log': serializer.toJson<String>(thought_log),
      'STILL_THINKING': serializer.toJson<bool>(STILL_THINKING),
    };
  }

  ThoughtDataData copyWith(
          {int? id,
          DateTime? timestamp,
          DateTime? start_time,
          DateTime? end_time,
          int? length,
          int? depth,
          String? thought_log,
          bool? STILL_THINKING}) =>
      ThoughtDataData(
        id: id ?? this.id,
        timestamp: timestamp ?? this.timestamp,
        start_time: start_time ?? this.start_time,
        end_time: end_time ?? this.end_time,
        length: length ?? this.length,
        depth: depth ?? this.depth,
        thought_log: thought_log ?? this.thought_log,
        STILL_THINKING: STILL_THINKING ?? this.STILL_THINKING,
      );
  ThoughtDataData copyWithCompanion(ThoughtDataCompanion data) {
    return ThoughtDataData(
      id: data.id.present ? data.id.value : this.id,
      timestamp: data.timestamp.present ? data.timestamp.value : this.timestamp,
      start_time:
          data.start_time.present ? data.start_time.value : this.start_time,
      end_time: data.end_time.present ? data.end_time.value : this.end_time,
      length: data.length.present ? data.length.value : this.length,
      depth: data.depth.present ? data.depth.value : this.depth,
      thought_log:
          data.thought_log.present ? data.thought_log.value : this.thought_log,
      STILL_THINKING: data.STILL_THINKING.present
          ? data.STILL_THINKING.value
          : this.STILL_THINKING,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ThoughtDataData(')
          ..write('id: $id, ')
          ..write('timestamp: $timestamp, ')
          ..write('start_time: $start_time, ')
          ..write('end_time: $end_time, ')
          ..write('length: $length, ')
          ..write('depth: $depth, ')
          ..write('thought_log: $thought_log, ')
          ..write('STILL_THINKING: $STILL_THINKING')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, timestamp, start_time, end_time, length,
      depth, thought_log, STILL_THINKING);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ThoughtDataData &&
          other.id == this.id &&
          other.timestamp == this.timestamp &&
          other.start_time == this.start_time &&
          other.end_time == this.end_time &&
          other.length == this.length &&
          other.depth == this.depth &&
          other.thought_log == this.thought_log &&
          other.STILL_THINKING == this.STILL_THINKING);
}

class ThoughtDataCompanion extends UpdateCompanion<ThoughtDataData> {
  final Value<int> id;
  final Value<DateTime> timestamp;
  final Value<DateTime> start_time;
  final Value<DateTime> end_time;
  final Value<int> length;
  final Value<int> depth;
  final Value<String> thought_log;
  final Value<bool> STILL_THINKING;
  const ThoughtDataCompanion({
    this.id = const Value.absent(),
    this.timestamp = const Value.absent(),
    this.start_time = const Value.absent(),
    this.end_time = const Value.absent(),
    this.length = const Value.absent(),
    this.depth = const Value.absent(),
    this.thought_log = const Value.absent(),
    this.STILL_THINKING = const Value.absent(),
  });
  ThoughtDataCompanion.insert({
    this.id = const Value.absent(),
    required DateTime timestamp,
    required DateTime start_time,
    required DateTime end_time,
    required int length,
    required int depth,
    required String thought_log,
    required bool STILL_THINKING,
  })  : timestamp = Value(timestamp),
        start_time = Value(start_time),
        end_time = Value(end_time),
        length = Value(length),
        depth = Value(depth),
        thought_log = Value(thought_log),
        STILL_THINKING = Value(STILL_THINKING);
  static Insertable<ThoughtDataData> custom({
    Expression<int>? id,
    Expression<DateTime>? timestamp,
    Expression<DateTime>? start_time,
    Expression<DateTime>? end_time,
    Expression<int>? length,
    Expression<int>? depth,
    Expression<String>? thought_log,
    Expression<bool>? STILL_THINKING,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (timestamp != null) 'timestamp': timestamp,
      if (start_time != null) 'start_time': start_time,
      if (end_time != null) 'end_time': end_time,
      if (length != null) 'length': length,
      if (depth != null) 'depth': depth,
      if (thought_log != null) 'thought_log': thought_log,
      if (STILL_THINKING != null) 'still_thinking': STILL_THINKING,
    });
  }

  ThoughtDataCompanion copyWith(
      {Value<int>? id,
      Value<DateTime>? timestamp,
      Value<DateTime>? start_time,
      Value<DateTime>? end_time,
      Value<int>? length,
      Value<int>? depth,
      Value<String>? thought_log,
      Value<bool>? STILL_THINKING}) {
    return ThoughtDataCompanion(
      id: id ?? this.id,
      timestamp: timestamp ?? this.timestamp,
      start_time: start_time ?? this.start_time,
      end_time: end_time ?? this.end_time,
      length: length ?? this.length,
      depth: depth ?? this.depth,
      thought_log: thought_log ?? this.thought_log,
      STILL_THINKING: STILL_THINKING ?? this.STILL_THINKING,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (timestamp.present) {
      map['timestamp'] = Variable<DateTime>(timestamp.value);
    }
    if (start_time.present) {
      map['start_time'] = Variable<DateTime>(start_time.value);
    }
    if (end_time.present) {
      map['end_time'] = Variable<DateTime>(end_time.value);
    }
    if (length.present) {
      map['length'] = Variable<int>(length.value);
    }
    if (depth.present) {
      map['depth'] = Variable<int>(depth.value);
    }
    if (thought_log.present) {
      map['thought_log'] = Variable<String>(thought_log.value);
    }
    if (STILL_THINKING.present) {
      map['still_thinking'] = Variable<bool>(STILL_THINKING.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ThoughtDataCompanion(')
          ..write('id: $id, ')
          ..write('timestamp: $timestamp, ')
          ..write('start_time: $start_time, ')
          ..write('end_time: $end_time, ')
          ..write('length: $length, ')
          ..write('depth: $depth, ')
          ..write('thought_log: $thought_log, ')
          ..write('STILL_THINKING: $STILL_THINKING')
          ..write(')'))
        .toString();
  }
}

class $IngredientsTable extends Ingredients
    with TableInfo<$IngredientsTable, Ingredient> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $IngredientsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _iconMeta = const VerificationMeta('icon');
  @override
  late final GeneratedColumn<String> icon = GeneratedColumn<String>(
      'icon', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _categoryMeta =
      const VerificationMeta('category');
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
      'category', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name, icon, category];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'ingredients';
  @override
  VerificationContext validateIntegrity(Insertable<Ingredient> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('icon')) {
      context.handle(
          _iconMeta, icon.isAcceptableOrUnknown(data['icon']!, _iconMeta));
    } else if (isInserting) {
      context.missing(_iconMeta);
    }
    if (data.containsKey('category')) {
      context.handle(_categoryMeta,
          category.isAcceptableOrUnknown(data['category']!, _categoryMeta));
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Ingredient map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Ingredient(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      icon: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}icon'])!,
      category: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}category'])!,
    );
  }

  @override
  $IngredientsTable createAlias(String alias) {
    return $IngredientsTable(attachedDatabase, alias);
  }
}

class Ingredient extends DataClass implements Insertable<Ingredient> {
  final int id;
  final String name;
  final String icon;
  final String category;
  const Ingredient(
      {required this.id,
      required this.name,
      required this.icon,
      required this.category});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['icon'] = Variable<String>(icon);
    map['category'] = Variable<String>(category);
    return map;
  }

  IngredientsCompanion toCompanion(bool nullToAbsent) {
    return IngredientsCompanion(
      id: Value(id),
      name: Value(name),
      icon: Value(icon),
      category: Value(category),
    );
  }

  factory Ingredient.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Ingredient(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      icon: serializer.fromJson<String>(json['icon']),
      category: serializer.fromJson<String>(json['category']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'icon': serializer.toJson<String>(icon),
      'category': serializer.toJson<String>(category),
    };
  }

  Ingredient copyWith(
          {int? id, String? name, String? icon, String? category}) =>
      Ingredient(
        id: id ?? this.id,
        name: name ?? this.name,
        icon: icon ?? this.icon,
        category: category ?? this.category,
      );
  Ingredient copyWithCompanion(IngredientsCompanion data) {
    return Ingredient(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      icon: data.icon.present ? data.icon.value : this.icon,
      category: data.category.present ? data.category.value : this.category,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Ingredient(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('icon: $icon, ')
          ..write('category: $category')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, icon, category);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Ingredient &&
          other.id == this.id &&
          other.name == this.name &&
          other.icon == this.icon &&
          other.category == this.category);
}

class IngredientsCompanion extends UpdateCompanion<Ingredient> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> icon;
  final Value<String> category;
  const IngredientsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.icon = const Value.absent(),
    this.category = const Value.absent(),
  });
  IngredientsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String icon,
    required String category,
  })  : name = Value(name),
        icon = Value(icon),
        category = Value(category);
  static Insertable<Ingredient> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? icon,
    Expression<String>? category,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (icon != null) 'icon': icon,
      if (category != null) 'category': category,
    });
  }

  IngredientsCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String>? icon,
      Value<String>? category}) {
    return IngredientsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      icon: icon ?? this.icon,
      category: category ?? this.category,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (icon.present) {
      map['icon'] = Variable<String>(icon.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('IngredientsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('icon: $icon, ')
          ..write('category: $category')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $PoopDataTable poopData = $PoopDataTable(this);
  late final $MedicineDataTable medicineData = $MedicineDataTable(this);
  late final $RecipesTable recipes = $RecipesTable(this);
  late final $FoodDataTable foodData = $FoodDataTable(this);
  late final $MoodDataTable moodData = $MoodDataTable(this);
  late final $JournalDataTable journalData = $JournalDataTable(this);
  late final $ExportLogTable exportLog = $ExportLogTable(this);
  late final $SleepDataTable sleepData = $SleepDataTable(this);
  late final $ThoughtDataTable thoughtData = $ThoughtDataTable(this);
  late final $IngredientsTable ingredients = $IngredientsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        poopData,
        medicineData,
        recipes,
        foodData,
        moodData,
        journalData,
        exportLog,
        sleepData,
        thoughtData,
        ingredients
      ];
}

typedef $$PoopDataTableCreateCompanionBuilder = PoopDataCompanion Function({
  Value<int> id,
  required DateTime timestamp,
  required int bristol_rating,
  required int urgency,
  required bool blood,
});
typedef $$PoopDataTableUpdateCompanionBuilder = PoopDataCompanion Function({
  Value<int> id,
  Value<DateTime> timestamp,
  Value<int> bristol_rating,
  Value<int> urgency,
  Value<bool> blood,
});

class $$PoopDataTableTableManager extends RootTableManager<
    _$AppDatabase,
    $PoopDataTable,
    PoopDataData,
    $$PoopDataTableFilterComposer,
    $$PoopDataTableOrderingComposer,
    $$PoopDataTableCreateCompanionBuilder,
    $$PoopDataTableUpdateCompanionBuilder> {
  $$PoopDataTableTableManager(_$AppDatabase db, $PoopDataTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$PoopDataTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$PoopDataTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<DateTime> timestamp = const Value.absent(),
            Value<int> bristol_rating = const Value.absent(),
            Value<int> urgency = const Value.absent(),
            Value<bool> blood = const Value.absent(),
          }) =>
              PoopDataCompanion(
            id: id,
            timestamp: timestamp,
            bristol_rating: bristol_rating,
            urgency: urgency,
            blood: blood,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required DateTime timestamp,
            required int bristol_rating,
            required int urgency,
            required bool blood,
          }) =>
              PoopDataCompanion.insert(
            id: id,
            timestamp: timestamp,
            bristol_rating: bristol_rating,
            urgency: urgency,
            blood: blood,
          ),
        ));
}

class $$PoopDataTableFilterComposer
    extends FilterComposer<_$AppDatabase, $PoopDataTable> {
  $$PoopDataTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get timestamp => $state.composableBuilder(
      column: $state.table.timestamp,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get bristol_rating => $state.composableBuilder(
      column: $state.table.bristol_rating,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get urgency => $state.composableBuilder(
      column: $state.table.urgency,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<bool> get blood => $state.composableBuilder(
      column: $state.table.blood,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$PoopDataTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $PoopDataTable> {
  $$PoopDataTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get timestamp => $state.composableBuilder(
      column: $state.table.timestamp,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get bristol_rating => $state.composableBuilder(
      column: $state.table.bristol_rating,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get urgency => $state.composableBuilder(
      column: $state.table.urgency,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<bool> get blood => $state.composableBuilder(
      column: $state.table.blood,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$MedicineDataTableCreateCompanionBuilder = MedicineDataCompanion
    Function({
  Value<int> id,
  required DateTime timestamp,
  required String medicine_name,
  required double dosage,
  required String unit,
});
typedef $$MedicineDataTableUpdateCompanionBuilder = MedicineDataCompanion
    Function({
  Value<int> id,
  Value<DateTime> timestamp,
  Value<String> medicine_name,
  Value<double> dosage,
  Value<String> unit,
});

class $$MedicineDataTableTableManager extends RootTableManager<
    _$AppDatabase,
    $MedicineDataTable,
    MedicineDataData,
    $$MedicineDataTableFilterComposer,
    $$MedicineDataTableOrderingComposer,
    $$MedicineDataTableCreateCompanionBuilder,
    $$MedicineDataTableUpdateCompanionBuilder> {
  $$MedicineDataTableTableManager(_$AppDatabase db, $MedicineDataTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$MedicineDataTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$MedicineDataTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<DateTime> timestamp = const Value.absent(),
            Value<String> medicine_name = const Value.absent(),
            Value<double> dosage = const Value.absent(),
            Value<String> unit = const Value.absent(),
          }) =>
              MedicineDataCompanion(
            id: id,
            timestamp: timestamp,
            medicine_name: medicine_name,
            dosage: dosage,
            unit: unit,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required DateTime timestamp,
            required String medicine_name,
            required double dosage,
            required String unit,
          }) =>
              MedicineDataCompanion.insert(
            id: id,
            timestamp: timestamp,
            medicine_name: medicine_name,
            dosage: dosage,
            unit: unit,
          ),
        ));
}

class $$MedicineDataTableFilterComposer
    extends FilterComposer<_$AppDatabase, $MedicineDataTable> {
  $$MedicineDataTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get timestamp => $state.composableBuilder(
      column: $state.table.timestamp,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get medicine_name => $state.composableBuilder(
      column: $state.table.medicine_name,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get dosage => $state.composableBuilder(
      column: $state.table.dosage,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get unit => $state.composableBuilder(
      column: $state.table.unit,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$MedicineDataTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $MedicineDataTable> {
  $$MedicineDataTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get timestamp => $state.composableBuilder(
      column: $state.table.timestamp,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get medicine_name => $state.composableBuilder(
      column: $state.table.medicine_name,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get dosage => $state.composableBuilder(
      column: $state.table.dosage,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get unit => $state.composableBuilder(
      column: $state.table.unit,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$RecipesTableCreateCompanionBuilder = RecipesCompanion Function({
  Value<int> id,
  required DateTime timestamp,
  required String created_by,
  required String name,
  required String description,
  required String ingredients_json,
  Value<String?> steps_json,
});
typedef $$RecipesTableUpdateCompanionBuilder = RecipesCompanion Function({
  Value<int> id,
  Value<DateTime> timestamp,
  Value<String> created_by,
  Value<String> name,
  Value<String> description,
  Value<String> ingredients_json,
  Value<String?> steps_json,
});

class $$RecipesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $RecipesTable,
    Recipe,
    $$RecipesTableFilterComposer,
    $$RecipesTableOrderingComposer,
    $$RecipesTableCreateCompanionBuilder,
    $$RecipesTableUpdateCompanionBuilder> {
  $$RecipesTableTableManager(_$AppDatabase db, $RecipesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$RecipesTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$RecipesTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<DateTime> timestamp = const Value.absent(),
            Value<String> created_by = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> description = const Value.absent(),
            Value<String> ingredients_json = const Value.absent(),
            Value<String?> steps_json = const Value.absent(),
          }) =>
              RecipesCompanion(
            id: id,
            timestamp: timestamp,
            created_by: created_by,
            name: name,
            description: description,
            ingredients_json: ingredients_json,
            steps_json: steps_json,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required DateTime timestamp,
            required String created_by,
            required String name,
            required String description,
            required String ingredients_json,
            Value<String?> steps_json = const Value.absent(),
          }) =>
              RecipesCompanion.insert(
            id: id,
            timestamp: timestamp,
            created_by: created_by,
            name: name,
            description: description,
            ingredients_json: ingredients_json,
            steps_json: steps_json,
          ),
        ));
}

class $$RecipesTableFilterComposer
    extends FilterComposer<_$AppDatabase, $RecipesTable> {
  $$RecipesTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get timestamp => $state.composableBuilder(
      column: $state.table.timestamp,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get created_by => $state.composableBuilder(
      column: $state.table.created_by,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get description => $state.composableBuilder(
      column: $state.table.description,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get ingredients_json => $state.composableBuilder(
      column: $state.table.ingredients_json,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get steps_json => $state.composableBuilder(
      column: $state.table.steps_json,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ComposableFilter foodDataRefs(
      ComposableFilter Function($$FoodDataTableFilterComposer f) f) {
    final $$FoodDataTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $state.db.foodData,
        getReferencedColumn: (t) => t.recipe_id,
        builder: (joinBuilder, parentComposers) =>
            $$FoodDataTableFilterComposer(ComposerState(
                $state.db, $state.db.foodData, joinBuilder, parentComposers)));
    return f(composer);
  }
}

class $$RecipesTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $RecipesTable> {
  $$RecipesTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get timestamp => $state.composableBuilder(
      column: $state.table.timestamp,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get created_by => $state.composableBuilder(
      column: $state.table.created_by,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get description => $state.composableBuilder(
      column: $state.table.description,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get ingredients_json => $state.composableBuilder(
      column: $state.table.ingredients_json,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get steps_json => $state.composableBuilder(
      column: $state.table.steps_json,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$FoodDataTableCreateCompanionBuilder = FoodDataCompanion Function({
  Value<int> id,
  required DateTime timestamp,
  required String description,
  Value<String?> ingredients_json,
  Value<String?> image_path,
  Value<int?> recipe_id,
  Value<String?> location,
});
typedef $$FoodDataTableUpdateCompanionBuilder = FoodDataCompanion Function({
  Value<int> id,
  Value<DateTime> timestamp,
  Value<String> description,
  Value<String?> ingredients_json,
  Value<String?> image_path,
  Value<int?> recipe_id,
  Value<String?> location,
});

class $$FoodDataTableTableManager extends RootTableManager<
    _$AppDatabase,
    $FoodDataTable,
    FoodDataData,
    $$FoodDataTableFilterComposer,
    $$FoodDataTableOrderingComposer,
    $$FoodDataTableCreateCompanionBuilder,
    $$FoodDataTableUpdateCompanionBuilder> {
  $$FoodDataTableTableManager(_$AppDatabase db, $FoodDataTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$FoodDataTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$FoodDataTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<DateTime> timestamp = const Value.absent(),
            Value<String> description = const Value.absent(),
            Value<String?> ingredients_json = const Value.absent(),
            Value<String?> image_path = const Value.absent(),
            Value<int?> recipe_id = const Value.absent(),
            Value<String?> location = const Value.absent(),
          }) =>
              FoodDataCompanion(
            id: id,
            timestamp: timestamp,
            description: description,
            ingredients_json: ingredients_json,
            image_path: image_path,
            recipe_id: recipe_id,
            location: location,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required DateTime timestamp,
            required String description,
            Value<String?> ingredients_json = const Value.absent(),
            Value<String?> image_path = const Value.absent(),
            Value<int?> recipe_id = const Value.absent(),
            Value<String?> location = const Value.absent(),
          }) =>
              FoodDataCompanion.insert(
            id: id,
            timestamp: timestamp,
            description: description,
            ingredients_json: ingredients_json,
            image_path: image_path,
            recipe_id: recipe_id,
            location: location,
          ),
        ));
}

class $$FoodDataTableFilterComposer
    extends FilterComposer<_$AppDatabase, $FoodDataTable> {
  $$FoodDataTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get timestamp => $state.composableBuilder(
      column: $state.table.timestamp,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get description => $state.composableBuilder(
      column: $state.table.description,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get ingredients_json => $state.composableBuilder(
      column: $state.table.ingredients_json,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get image_path => $state.composableBuilder(
      column: $state.table.image_path,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get location => $state.composableBuilder(
      column: $state.table.location,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  $$RecipesTableFilterComposer get recipe_id {
    final $$RecipesTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.recipe_id,
        referencedTable: $state.db.recipes,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) => $$RecipesTableFilterComposer(
            ComposerState(
                $state.db, $state.db.recipes, joinBuilder, parentComposers)));
    return composer;
  }
}

class $$FoodDataTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $FoodDataTable> {
  $$FoodDataTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get timestamp => $state.composableBuilder(
      column: $state.table.timestamp,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get description => $state.composableBuilder(
      column: $state.table.description,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get ingredients_json => $state.composableBuilder(
      column: $state.table.ingredients_json,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get image_path => $state.composableBuilder(
      column: $state.table.image_path,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get location => $state.composableBuilder(
      column: $state.table.location,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  $$RecipesTableOrderingComposer get recipe_id {
    final $$RecipesTableOrderingComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.recipe_id,
        referencedTable: $state.db.recipes,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$RecipesTableOrderingComposer(ComposerState(
                $state.db, $state.db.recipes, joinBuilder, parentComposers)));
    return composer;
  }
}

typedef $$MoodDataTableCreateCompanionBuilder = MoodDataCompanion Function({
  Value<int> id,
  required DateTime timestamp,
  required int rating,
  required String moods_json,
  required String note,
});
typedef $$MoodDataTableUpdateCompanionBuilder = MoodDataCompanion Function({
  Value<int> id,
  Value<DateTime> timestamp,
  Value<int> rating,
  Value<String> moods_json,
  Value<String> note,
});

class $$MoodDataTableTableManager extends RootTableManager<
    _$AppDatabase,
    $MoodDataTable,
    MoodDataData,
    $$MoodDataTableFilterComposer,
    $$MoodDataTableOrderingComposer,
    $$MoodDataTableCreateCompanionBuilder,
    $$MoodDataTableUpdateCompanionBuilder> {
  $$MoodDataTableTableManager(_$AppDatabase db, $MoodDataTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$MoodDataTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$MoodDataTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<DateTime> timestamp = const Value.absent(),
            Value<int> rating = const Value.absent(),
            Value<String> moods_json = const Value.absent(),
            Value<String> note = const Value.absent(),
          }) =>
              MoodDataCompanion(
            id: id,
            timestamp: timestamp,
            rating: rating,
            moods_json: moods_json,
            note: note,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required DateTime timestamp,
            required int rating,
            required String moods_json,
            required String note,
          }) =>
              MoodDataCompanion.insert(
            id: id,
            timestamp: timestamp,
            rating: rating,
            moods_json: moods_json,
            note: note,
          ),
        ));
}

class $$MoodDataTableFilterComposer
    extends FilterComposer<_$AppDatabase, $MoodDataTable> {
  $$MoodDataTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get timestamp => $state.composableBuilder(
      column: $state.table.timestamp,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get rating => $state.composableBuilder(
      column: $state.table.rating,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get moods_json => $state.composableBuilder(
      column: $state.table.moods_json,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get note => $state.composableBuilder(
      column: $state.table.note,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$MoodDataTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $MoodDataTable> {
  $$MoodDataTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get timestamp => $state.composableBuilder(
      column: $state.table.timestamp,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get rating => $state.composableBuilder(
      column: $state.table.rating,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get moods_json => $state.composableBuilder(
      column: $state.table.moods_json,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get note => $state.composableBuilder(
      column: $state.table.note,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$JournalDataTableCreateCompanionBuilder = JournalDataCompanion
    Function({
  Value<int> id,
  required DateTime timestamp,
  required String entry,
});
typedef $$JournalDataTableUpdateCompanionBuilder = JournalDataCompanion
    Function({
  Value<int> id,
  Value<DateTime> timestamp,
  Value<String> entry,
});

class $$JournalDataTableTableManager extends RootTableManager<
    _$AppDatabase,
    $JournalDataTable,
    JournalDataData,
    $$JournalDataTableFilterComposer,
    $$JournalDataTableOrderingComposer,
    $$JournalDataTableCreateCompanionBuilder,
    $$JournalDataTableUpdateCompanionBuilder> {
  $$JournalDataTableTableManager(_$AppDatabase db, $JournalDataTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$JournalDataTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$JournalDataTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<DateTime> timestamp = const Value.absent(),
            Value<String> entry = const Value.absent(),
          }) =>
              JournalDataCompanion(
            id: id,
            timestamp: timestamp,
            entry: entry,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required DateTime timestamp,
            required String entry,
          }) =>
              JournalDataCompanion.insert(
            id: id,
            timestamp: timestamp,
            entry: entry,
          ),
        ));
}

class $$JournalDataTableFilterComposer
    extends FilterComposer<_$AppDatabase, $JournalDataTable> {
  $$JournalDataTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get timestamp => $state.composableBuilder(
      column: $state.table.timestamp,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get entry => $state.composableBuilder(
      column: $state.table.entry,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$JournalDataTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $JournalDataTable> {
  $$JournalDataTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get timestamp => $state.composableBuilder(
      column: $state.table.timestamp,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get entry => $state.composableBuilder(
      column: $state.table.entry,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$ExportLogTableCreateCompanionBuilder = ExportLogCompanion Function({
  Value<int> id,
  required DateTime timestamp,
  required String export_type,
  required DateTime last_export,
});
typedef $$ExportLogTableUpdateCompanionBuilder = ExportLogCompanion Function({
  Value<int> id,
  Value<DateTime> timestamp,
  Value<String> export_type,
  Value<DateTime> last_export,
});

class $$ExportLogTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ExportLogTable,
    ExportLogData,
    $$ExportLogTableFilterComposer,
    $$ExportLogTableOrderingComposer,
    $$ExportLogTableCreateCompanionBuilder,
    $$ExportLogTableUpdateCompanionBuilder> {
  $$ExportLogTableTableManager(_$AppDatabase db, $ExportLogTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$ExportLogTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$ExportLogTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<DateTime> timestamp = const Value.absent(),
            Value<String> export_type = const Value.absent(),
            Value<DateTime> last_export = const Value.absent(),
          }) =>
              ExportLogCompanion(
            id: id,
            timestamp: timestamp,
            export_type: export_type,
            last_export: last_export,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required DateTime timestamp,
            required String export_type,
            required DateTime last_export,
          }) =>
              ExportLogCompanion.insert(
            id: id,
            timestamp: timestamp,
            export_type: export_type,
            last_export: last_export,
          ),
        ));
}

class $$ExportLogTableFilterComposer
    extends FilterComposer<_$AppDatabase, $ExportLogTable> {
  $$ExportLogTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get timestamp => $state.composableBuilder(
      column: $state.table.timestamp,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get export_type => $state.composableBuilder(
      column: $state.table.export_type,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get last_export => $state.composableBuilder(
      column: $state.table.last_export,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$ExportLogTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $ExportLogTable> {
  $$ExportLogTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get timestamp => $state.composableBuilder(
      column: $state.table.timestamp,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get export_type => $state.composableBuilder(
      column: $state.table.export_type,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get last_export => $state.composableBuilder(
      column: $state.table.last_export,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$SleepDataTableCreateCompanionBuilder = SleepDataCompanion Function({
  Value<int> id,
  required DateTime timestamp,
  required DateTime sleep_time,
  Value<DateTime?> wake_time,
  Value<String?> dream_log,
  required bool STILL_ASLEEP,
});
typedef $$SleepDataTableUpdateCompanionBuilder = SleepDataCompanion Function({
  Value<int> id,
  Value<DateTime> timestamp,
  Value<DateTime> sleep_time,
  Value<DateTime?> wake_time,
  Value<String?> dream_log,
  Value<bool> STILL_ASLEEP,
});

class $$SleepDataTableTableManager extends RootTableManager<
    _$AppDatabase,
    $SleepDataTable,
    SleepDataData,
    $$SleepDataTableFilterComposer,
    $$SleepDataTableOrderingComposer,
    $$SleepDataTableCreateCompanionBuilder,
    $$SleepDataTableUpdateCompanionBuilder> {
  $$SleepDataTableTableManager(_$AppDatabase db, $SleepDataTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$SleepDataTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$SleepDataTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<DateTime> timestamp = const Value.absent(),
            Value<DateTime> sleep_time = const Value.absent(),
            Value<DateTime?> wake_time = const Value.absent(),
            Value<String?> dream_log = const Value.absent(),
            Value<bool> STILL_ASLEEP = const Value.absent(),
          }) =>
              SleepDataCompanion(
            id: id,
            timestamp: timestamp,
            sleep_time: sleep_time,
            wake_time: wake_time,
            dream_log: dream_log,
            STILL_ASLEEP: STILL_ASLEEP,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required DateTime timestamp,
            required DateTime sleep_time,
            Value<DateTime?> wake_time = const Value.absent(),
            Value<String?> dream_log = const Value.absent(),
            required bool STILL_ASLEEP,
          }) =>
              SleepDataCompanion.insert(
            id: id,
            timestamp: timestamp,
            sleep_time: sleep_time,
            wake_time: wake_time,
            dream_log: dream_log,
            STILL_ASLEEP: STILL_ASLEEP,
          ),
        ));
}

class $$SleepDataTableFilterComposer
    extends FilterComposer<_$AppDatabase, $SleepDataTable> {
  $$SleepDataTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get timestamp => $state.composableBuilder(
      column: $state.table.timestamp,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get sleep_time => $state.composableBuilder(
      column: $state.table.sleep_time,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get wake_time => $state.composableBuilder(
      column: $state.table.wake_time,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get dream_log => $state.composableBuilder(
      column: $state.table.dream_log,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<bool> get STILL_ASLEEP => $state.composableBuilder(
      column: $state.table.STILL_ASLEEP,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$SleepDataTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $SleepDataTable> {
  $$SleepDataTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get timestamp => $state.composableBuilder(
      column: $state.table.timestamp,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get sleep_time => $state.composableBuilder(
      column: $state.table.sleep_time,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get wake_time => $state.composableBuilder(
      column: $state.table.wake_time,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get dream_log => $state.composableBuilder(
      column: $state.table.dream_log,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<bool> get STILL_ASLEEP => $state.composableBuilder(
      column: $state.table.STILL_ASLEEP,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$ThoughtDataTableCreateCompanionBuilder = ThoughtDataCompanion
    Function({
  Value<int> id,
  required DateTime timestamp,
  required DateTime start_time,
  required DateTime end_time,
  required int length,
  required int depth,
  required String thought_log,
  required bool STILL_THINKING,
});
typedef $$ThoughtDataTableUpdateCompanionBuilder = ThoughtDataCompanion
    Function({
  Value<int> id,
  Value<DateTime> timestamp,
  Value<DateTime> start_time,
  Value<DateTime> end_time,
  Value<int> length,
  Value<int> depth,
  Value<String> thought_log,
  Value<bool> STILL_THINKING,
});

class $$ThoughtDataTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ThoughtDataTable,
    ThoughtDataData,
    $$ThoughtDataTableFilterComposer,
    $$ThoughtDataTableOrderingComposer,
    $$ThoughtDataTableCreateCompanionBuilder,
    $$ThoughtDataTableUpdateCompanionBuilder> {
  $$ThoughtDataTableTableManager(_$AppDatabase db, $ThoughtDataTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$ThoughtDataTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$ThoughtDataTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<DateTime> timestamp = const Value.absent(),
            Value<DateTime> start_time = const Value.absent(),
            Value<DateTime> end_time = const Value.absent(),
            Value<int> length = const Value.absent(),
            Value<int> depth = const Value.absent(),
            Value<String> thought_log = const Value.absent(),
            Value<bool> STILL_THINKING = const Value.absent(),
          }) =>
              ThoughtDataCompanion(
            id: id,
            timestamp: timestamp,
            start_time: start_time,
            end_time: end_time,
            length: length,
            depth: depth,
            thought_log: thought_log,
            STILL_THINKING: STILL_THINKING,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required DateTime timestamp,
            required DateTime start_time,
            required DateTime end_time,
            required int length,
            required int depth,
            required String thought_log,
            required bool STILL_THINKING,
          }) =>
              ThoughtDataCompanion.insert(
            id: id,
            timestamp: timestamp,
            start_time: start_time,
            end_time: end_time,
            length: length,
            depth: depth,
            thought_log: thought_log,
            STILL_THINKING: STILL_THINKING,
          ),
        ));
}

class $$ThoughtDataTableFilterComposer
    extends FilterComposer<_$AppDatabase, $ThoughtDataTable> {
  $$ThoughtDataTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get timestamp => $state.composableBuilder(
      column: $state.table.timestamp,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get start_time => $state.composableBuilder(
      column: $state.table.start_time,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get end_time => $state.composableBuilder(
      column: $state.table.end_time,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get length => $state.composableBuilder(
      column: $state.table.length,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get depth => $state.composableBuilder(
      column: $state.table.depth,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get thought_log => $state.composableBuilder(
      column: $state.table.thought_log,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<bool> get STILL_THINKING => $state.composableBuilder(
      column: $state.table.STILL_THINKING,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$ThoughtDataTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $ThoughtDataTable> {
  $$ThoughtDataTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get timestamp => $state.composableBuilder(
      column: $state.table.timestamp,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get start_time => $state.composableBuilder(
      column: $state.table.start_time,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get end_time => $state.composableBuilder(
      column: $state.table.end_time,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get length => $state.composableBuilder(
      column: $state.table.length,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get depth => $state.composableBuilder(
      column: $state.table.depth,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get thought_log => $state.composableBuilder(
      column: $state.table.thought_log,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<bool> get STILL_THINKING => $state.composableBuilder(
      column: $state.table.STILL_THINKING,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$IngredientsTableCreateCompanionBuilder = IngredientsCompanion
    Function({
  Value<int> id,
  required String name,
  required String icon,
  required String category,
});
typedef $$IngredientsTableUpdateCompanionBuilder = IngredientsCompanion
    Function({
  Value<int> id,
  Value<String> name,
  Value<String> icon,
  Value<String> category,
});

class $$IngredientsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $IngredientsTable,
    Ingredient,
    $$IngredientsTableFilterComposer,
    $$IngredientsTableOrderingComposer,
    $$IngredientsTableCreateCompanionBuilder,
    $$IngredientsTableUpdateCompanionBuilder> {
  $$IngredientsTableTableManager(_$AppDatabase db, $IngredientsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$IngredientsTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$IngredientsTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> icon = const Value.absent(),
            Value<String> category = const Value.absent(),
          }) =>
              IngredientsCompanion(
            id: id,
            name: name,
            icon: icon,
            category: category,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            required String icon,
            required String category,
          }) =>
              IngredientsCompanion.insert(
            id: id,
            name: name,
            icon: icon,
            category: category,
          ),
        ));
}

class $$IngredientsTableFilterComposer
    extends FilterComposer<_$AppDatabase, $IngredientsTable> {
  $$IngredientsTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get icon => $state.composableBuilder(
      column: $state.table.icon,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get category => $state.composableBuilder(
      column: $state.table.category,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$IngredientsTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $IngredientsTable> {
  $$IngredientsTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get icon => $state.composableBuilder(
      column: $state.table.icon,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get category => $state.composableBuilder(
      column: $state.table.category,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$PoopDataTableTableManager get poopData =>
      $$PoopDataTableTableManager(_db, _db.poopData);
  $$MedicineDataTableTableManager get medicineData =>
      $$MedicineDataTableTableManager(_db, _db.medicineData);
  $$RecipesTableTableManager get recipes =>
      $$RecipesTableTableManager(_db, _db.recipes);
  $$FoodDataTableTableManager get foodData =>
      $$FoodDataTableTableManager(_db, _db.foodData);
  $$MoodDataTableTableManager get moodData =>
      $$MoodDataTableTableManager(_db, _db.moodData);
  $$JournalDataTableTableManager get journalData =>
      $$JournalDataTableTableManager(_db, _db.journalData);
  $$ExportLogTableTableManager get exportLog =>
      $$ExportLogTableTableManager(_db, _db.exportLog);
  $$SleepDataTableTableManager get sleepData =>
      $$SleepDataTableTableManager(_db, _db.sleepData);
  $$ThoughtDataTableTableManager get thoughtData =>
      $$ThoughtDataTableTableManager(_db, _db.thoughtData);
  $$IngredientsTableTableManager get ingredients =>
      $$IngredientsTableTableManager(_db, _db.ingredients);
}
