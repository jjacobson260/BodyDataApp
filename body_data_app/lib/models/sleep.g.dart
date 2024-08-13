// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sleep.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetSleepCollection on Isar {
  IsarCollection<Sleep> get sleeps => this.collection();
}

const SleepSchema = CollectionSchema(
  name: r'Sleep',
  id: 6252606566248673738,
  properties: {
    r'STILL_ASLEEP': PropertySchema(
      id: 0,
      name: r'STILL_ASLEEP',
      type: IsarType.bool,
    ),
    r'dream_log': PropertySchema(
      id: 1,
      name: r'dream_log',
      type: IsarType.string,
    ),
    r'location': PropertySchema(
      id: 2,
      name: r'location',
      type: IsarType.string,
    ),
    r'sleep_time': PropertySchema(
      id: 3,
      name: r'sleep_time',
      type: IsarType.dateTime,
    ),
    r'timestamp': PropertySchema(
      id: 4,
      name: r'timestamp',
      type: IsarType.dateTime,
    ),
    r'wake_time': PropertySchema(
      id: 5,
      name: r'wake_time',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _sleepEstimateSize,
  serialize: _sleepSerialize,
  deserialize: _sleepDeserialize,
  deserializeProp: _sleepDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _sleepGetId,
  getLinks: _sleepGetLinks,
  attach: _sleepAttach,
  version: '3.1.0+1',
);

int _sleepEstimateSize(
  Sleep object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.dream_log;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.location;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _sleepSerialize(
  Sleep object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeBool(offsets[0], object.STILL_ASLEEP);
  writer.writeString(offsets[1], object.dream_log);
  writer.writeString(offsets[2], object.location);
  writer.writeDateTime(offsets[3], object.sleep_time);
  writer.writeDateTime(offsets[4], object.timestamp);
  writer.writeDateTime(offsets[5], object.wake_time);
}

Sleep _sleepDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Sleep();
  object.STILL_ASLEEP = reader.readBool(offsets[0]);
  object.dream_log = reader.readStringOrNull(offsets[1]);
  object.id = id;
  object.location = reader.readStringOrNull(offsets[2]);
  object.sleep_time = reader.readDateTime(offsets[3]);
  object.timestamp = reader.readDateTime(offsets[4]);
  object.wake_time = reader.readDateTimeOrNull(offsets[5]);
  return object;
}

P _sleepDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readBool(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readDateTime(offset)) as P;
    case 4:
      return (reader.readDateTime(offset)) as P;
    case 5:
      return (reader.readDateTimeOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _sleepGetId(Sleep object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _sleepGetLinks(Sleep object) {
  return [];
}

void _sleepAttach(IsarCollection<dynamic> col, Id id, Sleep object) {
  object.id = id;
}

extension SleepQueryWhereSort on QueryBuilder<Sleep, Sleep, QWhere> {
  QueryBuilder<Sleep, Sleep, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension SleepQueryWhere on QueryBuilder<Sleep, Sleep, QWhereClause> {
  QueryBuilder<Sleep, Sleep, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Sleep, Sleep, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<Sleep, Sleep, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Sleep, Sleep, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Sleep, Sleep, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension SleepQueryFilter on QueryBuilder<Sleep, Sleep, QFilterCondition> {
  QueryBuilder<Sleep, Sleep, QAfterFilterCondition> sTILL_ASLEEPEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'STILL_ASLEEP',
        value: value,
      ));
    });
  }

  QueryBuilder<Sleep, Sleep, QAfterFilterCondition> dream_logIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'dream_log',
      ));
    });
  }

  QueryBuilder<Sleep, Sleep, QAfterFilterCondition> dream_logIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'dream_log',
      ));
    });
  }

  QueryBuilder<Sleep, Sleep, QAfterFilterCondition> dream_logEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dream_log',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sleep, Sleep, QAfterFilterCondition> dream_logGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dream_log',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sleep, Sleep, QAfterFilterCondition> dream_logLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dream_log',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sleep, Sleep, QAfterFilterCondition> dream_logBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dream_log',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sleep, Sleep, QAfterFilterCondition> dream_logStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'dream_log',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sleep, Sleep, QAfterFilterCondition> dream_logEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'dream_log',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sleep, Sleep, QAfterFilterCondition> dream_logContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'dream_log',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sleep, Sleep, QAfterFilterCondition> dream_logMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'dream_log',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sleep, Sleep, QAfterFilterCondition> dream_logIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dream_log',
        value: '',
      ));
    });
  }

  QueryBuilder<Sleep, Sleep, QAfterFilterCondition> dream_logIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'dream_log',
        value: '',
      ));
    });
  }

  QueryBuilder<Sleep, Sleep, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Sleep, Sleep, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Sleep, Sleep, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Sleep, Sleep, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Sleep, Sleep, QAfterFilterCondition> locationIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'location',
      ));
    });
  }

  QueryBuilder<Sleep, Sleep, QAfterFilterCondition> locationIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'location',
      ));
    });
  }

  QueryBuilder<Sleep, Sleep, QAfterFilterCondition> locationEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'location',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sleep, Sleep, QAfterFilterCondition> locationGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'location',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sleep, Sleep, QAfterFilterCondition> locationLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'location',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sleep, Sleep, QAfterFilterCondition> locationBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'location',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sleep, Sleep, QAfterFilterCondition> locationStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'location',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sleep, Sleep, QAfterFilterCondition> locationEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'location',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sleep, Sleep, QAfterFilterCondition> locationContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'location',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sleep, Sleep, QAfterFilterCondition> locationMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'location',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sleep, Sleep, QAfterFilterCondition> locationIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'location',
        value: '',
      ));
    });
  }

  QueryBuilder<Sleep, Sleep, QAfterFilterCondition> locationIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'location',
        value: '',
      ));
    });
  }

  QueryBuilder<Sleep, Sleep, QAfterFilterCondition> sleep_timeEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sleep_time',
        value: value,
      ));
    });
  }

  QueryBuilder<Sleep, Sleep, QAfterFilterCondition> sleep_timeGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'sleep_time',
        value: value,
      ));
    });
  }

  QueryBuilder<Sleep, Sleep, QAfterFilterCondition> sleep_timeLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'sleep_time',
        value: value,
      ));
    });
  }

  QueryBuilder<Sleep, Sleep, QAfterFilterCondition> sleep_timeBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'sleep_time',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Sleep, Sleep, QAfterFilterCondition> timestampEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'timestamp',
        value: value,
      ));
    });
  }

  QueryBuilder<Sleep, Sleep, QAfterFilterCondition> timestampGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'timestamp',
        value: value,
      ));
    });
  }

  QueryBuilder<Sleep, Sleep, QAfterFilterCondition> timestampLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'timestamp',
        value: value,
      ));
    });
  }

  QueryBuilder<Sleep, Sleep, QAfterFilterCondition> timestampBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'timestamp',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Sleep, Sleep, QAfterFilterCondition> wake_timeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'wake_time',
      ));
    });
  }

  QueryBuilder<Sleep, Sleep, QAfterFilterCondition> wake_timeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'wake_time',
      ));
    });
  }

  QueryBuilder<Sleep, Sleep, QAfterFilterCondition> wake_timeEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'wake_time',
        value: value,
      ));
    });
  }

  QueryBuilder<Sleep, Sleep, QAfterFilterCondition> wake_timeGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'wake_time',
        value: value,
      ));
    });
  }

  QueryBuilder<Sleep, Sleep, QAfterFilterCondition> wake_timeLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'wake_time',
        value: value,
      ));
    });
  }

  QueryBuilder<Sleep, Sleep, QAfterFilterCondition> wake_timeBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'wake_time',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension SleepQueryObject on QueryBuilder<Sleep, Sleep, QFilterCondition> {}

extension SleepQueryLinks on QueryBuilder<Sleep, Sleep, QFilterCondition> {}

extension SleepQuerySortBy on QueryBuilder<Sleep, Sleep, QSortBy> {
  QueryBuilder<Sleep, Sleep, QAfterSortBy> sortBySTILL_ASLEEP() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'STILL_ASLEEP', Sort.asc);
    });
  }

  QueryBuilder<Sleep, Sleep, QAfterSortBy> sortBySTILL_ASLEEPDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'STILL_ASLEEP', Sort.desc);
    });
  }

  QueryBuilder<Sleep, Sleep, QAfterSortBy> sortByDream_log() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dream_log', Sort.asc);
    });
  }

  QueryBuilder<Sleep, Sleep, QAfterSortBy> sortByDream_logDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dream_log', Sort.desc);
    });
  }

  QueryBuilder<Sleep, Sleep, QAfterSortBy> sortByLocation() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'location', Sort.asc);
    });
  }

  QueryBuilder<Sleep, Sleep, QAfterSortBy> sortByLocationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'location', Sort.desc);
    });
  }

  QueryBuilder<Sleep, Sleep, QAfterSortBy> sortBySleep_time() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sleep_time', Sort.asc);
    });
  }

  QueryBuilder<Sleep, Sleep, QAfterSortBy> sortBySleep_timeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sleep_time', Sort.desc);
    });
  }

  QueryBuilder<Sleep, Sleep, QAfterSortBy> sortByTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timestamp', Sort.asc);
    });
  }

  QueryBuilder<Sleep, Sleep, QAfterSortBy> sortByTimestampDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timestamp', Sort.desc);
    });
  }

  QueryBuilder<Sleep, Sleep, QAfterSortBy> sortByWake_time() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wake_time', Sort.asc);
    });
  }

  QueryBuilder<Sleep, Sleep, QAfterSortBy> sortByWake_timeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wake_time', Sort.desc);
    });
  }
}

extension SleepQuerySortThenBy on QueryBuilder<Sleep, Sleep, QSortThenBy> {
  QueryBuilder<Sleep, Sleep, QAfterSortBy> thenBySTILL_ASLEEP() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'STILL_ASLEEP', Sort.asc);
    });
  }

  QueryBuilder<Sleep, Sleep, QAfterSortBy> thenBySTILL_ASLEEPDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'STILL_ASLEEP', Sort.desc);
    });
  }

  QueryBuilder<Sleep, Sleep, QAfterSortBy> thenByDream_log() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dream_log', Sort.asc);
    });
  }

  QueryBuilder<Sleep, Sleep, QAfterSortBy> thenByDream_logDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dream_log', Sort.desc);
    });
  }

  QueryBuilder<Sleep, Sleep, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Sleep, Sleep, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Sleep, Sleep, QAfterSortBy> thenByLocation() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'location', Sort.asc);
    });
  }

  QueryBuilder<Sleep, Sleep, QAfterSortBy> thenByLocationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'location', Sort.desc);
    });
  }

  QueryBuilder<Sleep, Sleep, QAfterSortBy> thenBySleep_time() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sleep_time', Sort.asc);
    });
  }

  QueryBuilder<Sleep, Sleep, QAfterSortBy> thenBySleep_timeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sleep_time', Sort.desc);
    });
  }

  QueryBuilder<Sleep, Sleep, QAfterSortBy> thenByTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timestamp', Sort.asc);
    });
  }

  QueryBuilder<Sleep, Sleep, QAfterSortBy> thenByTimestampDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timestamp', Sort.desc);
    });
  }

  QueryBuilder<Sleep, Sleep, QAfterSortBy> thenByWake_time() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wake_time', Sort.asc);
    });
  }

  QueryBuilder<Sleep, Sleep, QAfterSortBy> thenByWake_timeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wake_time', Sort.desc);
    });
  }
}

extension SleepQueryWhereDistinct on QueryBuilder<Sleep, Sleep, QDistinct> {
  QueryBuilder<Sleep, Sleep, QDistinct> distinctBySTILL_ASLEEP() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'STILL_ASLEEP');
    });
  }

  QueryBuilder<Sleep, Sleep, QDistinct> distinctByDream_log(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dream_log', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Sleep, Sleep, QDistinct> distinctByLocation(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'location', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Sleep, Sleep, QDistinct> distinctBySleep_time() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sleep_time');
    });
  }

  QueryBuilder<Sleep, Sleep, QDistinct> distinctByTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'timestamp');
    });
  }

  QueryBuilder<Sleep, Sleep, QDistinct> distinctByWake_time() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'wake_time');
    });
  }
}

extension SleepQueryProperty on QueryBuilder<Sleep, Sleep, QQueryProperty> {
  QueryBuilder<Sleep, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Sleep, bool, QQueryOperations> STILL_ASLEEPProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'STILL_ASLEEP');
    });
  }

  QueryBuilder<Sleep, String?, QQueryOperations> dream_logProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dream_log');
    });
  }

  QueryBuilder<Sleep, String?, QQueryOperations> locationProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'location');
    });
  }

  QueryBuilder<Sleep, DateTime, QQueryOperations> sleep_timeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sleep_time');
    });
  }

  QueryBuilder<Sleep, DateTime, QQueryOperations> timestampProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'timestamp');
    });
  }

  QueryBuilder<Sleep, DateTime?, QQueryOperations> wake_timeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'wake_time');
    });
  }
}
