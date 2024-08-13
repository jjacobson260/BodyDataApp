// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'thought.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetThoughtCollection on Isar {
  IsarCollection<Thought> get thoughts => this.collection();
}

const ThoughtSchema = CollectionSchema(
  name: r'Thought',
  id: 6929868275815929257,
  properties: {
    r'STILL_THINKING': PropertySchema(
      id: 0,
      name: r'STILL_THINKING',
      type: IsarType.bool,
    ),
    r'depth': PropertySchema(
      id: 1,
      name: r'depth',
      type: IsarType.long,
    ),
    r'end_time': PropertySchema(
      id: 2,
      name: r'end_time',
      type: IsarType.dateTime,
    ),
    r'length': PropertySchema(
      id: 3,
      name: r'length',
      type: IsarType.long,
    ),
    r'location': PropertySchema(
      id: 4,
      name: r'location',
      type: IsarType.string,
    ),
    r'start_time': PropertySchema(
      id: 5,
      name: r'start_time',
      type: IsarType.dateTime,
    ),
    r'thought_log': PropertySchema(
      id: 6,
      name: r'thought_log',
      type: IsarType.string,
    ),
    r'timestamp': PropertySchema(
      id: 7,
      name: r'timestamp',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _thoughtEstimateSize,
  serialize: _thoughtSerialize,
  deserialize: _thoughtDeserialize,
  deserializeProp: _thoughtDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _thoughtGetId,
  getLinks: _thoughtGetLinks,
  attach: _thoughtAttach,
  version: '3.1.0+1',
);

int _thoughtEstimateSize(
  Thought object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.location;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.thought_log.length * 3;
  return bytesCount;
}

void _thoughtSerialize(
  Thought object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeBool(offsets[0], object.STILL_THINKING);
  writer.writeLong(offsets[1], object.depth);
  writer.writeDateTime(offsets[2], object.end_time);
  writer.writeLong(offsets[3], object.length);
  writer.writeString(offsets[4], object.location);
  writer.writeDateTime(offsets[5], object.start_time);
  writer.writeString(offsets[6], object.thought_log);
  writer.writeDateTime(offsets[7], object.timestamp);
}

Thought _thoughtDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Thought();
  object.STILL_THINKING = reader.readBool(offsets[0]);
  object.depth = reader.readLongOrNull(offsets[1]);
  object.end_time = reader.readDateTimeOrNull(offsets[2]);
  object.id = id;
  object.length = reader.readLongOrNull(offsets[3]);
  object.location = reader.readStringOrNull(offsets[4]);
  object.start_time = reader.readDateTimeOrNull(offsets[5]);
  object.thought_log = reader.readString(offsets[6]);
  object.timestamp = reader.readDateTime(offsets[7]);
  return object;
}

P _thoughtDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readBool(offset)) as P;
    case 1:
      return (reader.readLongOrNull(offset)) as P;
    case 2:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 3:
      return (reader.readLongOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readDateTime(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _thoughtGetId(Thought object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _thoughtGetLinks(Thought object) {
  return [];
}

void _thoughtAttach(IsarCollection<dynamic> col, Id id, Thought object) {
  object.id = id;
}

extension ThoughtQueryWhereSort on QueryBuilder<Thought, Thought, QWhere> {
  QueryBuilder<Thought, Thought, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ThoughtQueryWhere on QueryBuilder<Thought, Thought, QWhereClause> {
  QueryBuilder<Thought, Thought, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Thought, Thought, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Thought, Thought, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Thought, Thought, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Thought, Thought, QAfterWhereClause> idBetween(
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

extension ThoughtQueryFilter
    on QueryBuilder<Thought, Thought, QFilterCondition> {
  QueryBuilder<Thought, Thought, QAfterFilterCondition> sTILL_THINKINGEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'STILL_THINKING',
        value: value,
      ));
    });
  }

  QueryBuilder<Thought, Thought, QAfterFilterCondition> depthIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'depth',
      ));
    });
  }

  QueryBuilder<Thought, Thought, QAfterFilterCondition> depthIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'depth',
      ));
    });
  }

  QueryBuilder<Thought, Thought, QAfterFilterCondition> depthEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'depth',
        value: value,
      ));
    });
  }

  QueryBuilder<Thought, Thought, QAfterFilterCondition> depthGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'depth',
        value: value,
      ));
    });
  }

  QueryBuilder<Thought, Thought, QAfterFilterCondition> depthLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'depth',
        value: value,
      ));
    });
  }

  QueryBuilder<Thought, Thought, QAfterFilterCondition> depthBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'depth',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Thought, Thought, QAfterFilterCondition> end_timeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'end_time',
      ));
    });
  }

  QueryBuilder<Thought, Thought, QAfterFilterCondition> end_timeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'end_time',
      ));
    });
  }

  QueryBuilder<Thought, Thought, QAfterFilterCondition> end_timeEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'end_time',
        value: value,
      ));
    });
  }

  QueryBuilder<Thought, Thought, QAfterFilterCondition> end_timeGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'end_time',
        value: value,
      ));
    });
  }

  QueryBuilder<Thought, Thought, QAfterFilterCondition> end_timeLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'end_time',
        value: value,
      ));
    });
  }

  QueryBuilder<Thought, Thought, QAfterFilterCondition> end_timeBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'end_time',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Thought, Thought, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Thought, Thought, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Thought, Thought, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Thought, Thought, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Thought, Thought, QAfterFilterCondition> lengthIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'length',
      ));
    });
  }

  QueryBuilder<Thought, Thought, QAfterFilterCondition> lengthIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'length',
      ));
    });
  }

  QueryBuilder<Thought, Thought, QAfterFilterCondition> lengthEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'length',
        value: value,
      ));
    });
  }

  QueryBuilder<Thought, Thought, QAfterFilterCondition> lengthGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'length',
        value: value,
      ));
    });
  }

  QueryBuilder<Thought, Thought, QAfterFilterCondition> lengthLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'length',
        value: value,
      ));
    });
  }

  QueryBuilder<Thought, Thought, QAfterFilterCondition> lengthBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'length',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Thought, Thought, QAfterFilterCondition> locationIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'location',
      ));
    });
  }

  QueryBuilder<Thought, Thought, QAfterFilterCondition> locationIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'location',
      ));
    });
  }

  QueryBuilder<Thought, Thought, QAfterFilterCondition> locationEqualTo(
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

  QueryBuilder<Thought, Thought, QAfterFilterCondition> locationGreaterThan(
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

  QueryBuilder<Thought, Thought, QAfterFilterCondition> locationLessThan(
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

  QueryBuilder<Thought, Thought, QAfterFilterCondition> locationBetween(
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

  QueryBuilder<Thought, Thought, QAfterFilterCondition> locationStartsWith(
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

  QueryBuilder<Thought, Thought, QAfterFilterCondition> locationEndsWith(
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

  QueryBuilder<Thought, Thought, QAfterFilterCondition> locationContains(
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

  QueryBuilder<Thought, Thought, QAfterFilterCondition> locationMatches(
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

  QueryBuilder<Thought, Thought, QAfterFilterCondition> locationIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'location',
        value: '',
      ));
    });
  }

  QueryBuilder<Thought, Thought, QAfterFilterCondition> locationIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'location',
        value: '',
      ));
    });
  }

  QueryBuilder<Thought, Thought, QAfterFilterCondition> start_timeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'start_time',
      ));
    });
  }

  QueryBuilder<Thought, Thought, QAfterFilterCondition> start_timeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'start_time',
      ));
    });
  }

  QueryBuilder<Thought, Thought, QAfterFilterCondition> start_timeEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'start_time',
        value: value,
      ));
    });
  }

  QueryBuilder<Thought, Thought, QAfterFilterCondition> start_timeGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'start_time',
        value: value,
      ));
    });
  }

  QueryBuilder<Thought, Thought, QAfterFilterCondition> start_timeLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'start_time',
        value: value,
      ));
    });
  }

  QueryBuilder<Thought, Thought, QAfterFilterCondition> start_timeBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'start_time',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Thought, Thought, QAfterFilterCondition> thought_logEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'thought_log',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Thought, Thought, QAfterFilterCondition> thought_logGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'thought_log',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Thought, Thought, QAfterFilterCondition> thought_logLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'thought_log',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Thought, Thought, QAfterFilterCondition> thought_logBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'thought_log',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Thought, Thought, QAfterFilterCondition> thought_logStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'thought_log',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Thought, Thought, QAfterFilterCondition> thought_logEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'thought_log',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Thought, Thought, QAfterFilterCondition> thought_logContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'thought_log',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Thought, Thought, QAfterFilterCondition> thought_logMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'thought_log',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Thought, Thought, QAfterFilterCondition> thought_logIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'thought_log',
        value: '',
      ));
    });
  }

  QueryBuilder<Thought, Thought, QAfterFilterCondition>
      thought_logIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'thought_log',
        value: '',
      ));
    });
  }

  QueryBuilder<Thought, Thought, QAfterFilterCondition> timestampEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'timestamp',
        value: value,
      ));
    });
  }

  QueryBuilder<Thought, Thought, QAfterFilterCondition> timestampGreaterThan(
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

  QueryBuilder<Thought, Thought, QAfterFilterCondition> timestampLessThan(
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

  QueryBuilder<Thought, Thought, QAfterFilterCondition> timestampBetween(
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
}

extension ThoughtQueryObject
    on QueryBuilder<Thought, Thought, QFilterCondition> {}

extension ThoughtQueryLinks
    on QueryBuilder<Thought, Thought, QFilterCondition> {}

extension ThoughtQuerySortBy on QueryBuilder<Thought, Thought, QSortBy> {
  QueryBuilder<Thought, Thought, QAfterSortBy> sortBySTILL_THINKING() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'STILL_THINKING', Sort.asc);
    });
  }

  QueryBuilder<Thought, Thought, QAfterSortBy> sortBySTILL_THINKINGDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'STILL_THINKING', Sort.desc);
    });
  }

  QueryBuilder<Thought, Thought, QAfterSortBy> sortByDepth() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'depth', Sort.asc);
    });
  }

  QueryBuilder<Thought, Thought, QAfterSortBy> sortByDepthDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'depth', Sort.desc);
    });
  }

  QueryBuilder<Thought, Thought, QAfterSortBy> sortByEnd_time() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'end_time', Sort.asc);
    });
  }

  QueryBuilder<Thought, Thought, QAfterSortBy> sortByEnd_timeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'end_time', Sort.desc);
    });
  }

  QueryBuilder<Thought, Thought, QAfterSortBy> sortByLength() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'length', Sort.asc);
    });
  }

  QueryBuilder<Thought, Thought, QAfterSortBy> sortByLengthDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'length', Sort.desc);
    });
  }

  QueryBuilder<Thought, Thought, QAfterSortBy> sortByLocation() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'location', Sort.asc);
    });
  }

  QueryBuilder<Thought, Thought, QAfterSortBy> sortByLocationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'location', Sort.desc);
    });
  }

  QueryBuilder<Thought, Thought, QAfterSortBy> sortByStart_time() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'start_time', Sort.asc);
    });
  }

  QueryBuilder<Thought, Thought, QAfterSortBy> sortByStart_timeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'start_time', Sort.desc);
    });
  }

  QueryBuilder<Thought, Thought, QAfterSortBy> sortByThought_log() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'thought_log', Sort.asc);
    });
  }

  QueryBuilder<Thought, Thought, QAfterSortBy> sortByThought_logDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'thought_log', Sort.desc);
    });
  }

  QueryBuilder<Thought, Thought, QAfterSortBy> sortByTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timestamp', Sort.asc);
    });
  }

  QueryBuilder<Thought, Thought, QAfterSortBy> sortByTimestampDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timestamp', Sort.desc);
    });
  }
}

extension ThoughtQuerySortThenBy
    on QueryBuilder<Thought, Thought, QSortThenBy> {
  QueryBuilder<Thought, Thought, QAfterSortBy> thenBySTILL_THINKING() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'STILL_THINKING', Sort.asc);
    });
  }

  QueryBuilder<Thought, Thought, QAfterSortBy> thenBySTILL_THINKINGDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'STILL_THINKING', Sort.desc);
    });
  }

  QueryBuilder<Thought, Thought, QAfterSortBy> thenByDepth() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'depth', Sort.asc);
    });
  }

  QueryBuilder<Thought, Thought, QAfterSortBy> thenByDepthDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'depth', Sort.desc);
    });
  }

  QueryBuilder<Thought, Thought, QAfterSortBy> thenByEnd_time() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'end_time', Sort.asc);
    });
  }

  QueryBuilder<Thought, Thought, QAfterSortBy> thenByEnd_timeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'end_time', Sort.desc);
    });
  }

  QueryBuilder<Thought, Thought, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Thought, Thought, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Thought, Thought, QAfterSortBy> thenByLength() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'length', Sort.asc);
    });
  }

  QueryBuilder<Thought, Thought, QAfterSortBy> thenByLengthDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'length', Sort.desc);
    });
  }

  QueryBuilder<Thought, Thought, QAfterSortBy> thenByLocation() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'location', Sort.asc);
    });
  }

  QueryBuilder<Thought, Thought, QAfterSortBy> thenByLocationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'location', Sort.desc);
    });
  }

  QueryBuilder<Thought, Thought, QAfterSortBy> thenByStart_time() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'start_time', Sort.asc);
    });
  }

  QueryBuilder<Thought, Thought, QAfterSortBy> thenByStart_timeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'start_time', Sort.desc);
    });
  }

  QueryBuilder<Thought, Thought, QAfterSortBy> thenByThought_log() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'thought_log', Sort.asc);
    });
  }

  QueryBuilder<Thought, Thought, QAfterSortBy> thenByThought_logDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'thought_log', Sort.desc);
    });
  }

  QueryBuilder<Thought, Thought, QAfterSortBy> thenByTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timestamp', Sort.asc);
    });
  }

  QueryBuilder<Thought, Thought, QAfterSortBy> thenByTimestampDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timestamp', Sort.desc);
    });
  }
}

extension ThoughtQueryWhereDistinct
    on QueryBuilder<Thought, Thought, QDistinct> {
  QueryBuilder<Thought, Thought, QDistinct> distinctBySTILL_THINKING() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'STILL_THINKING');
    });
  }

  QueryBuilder<Thought, Thought, QDistinct> distinctByDepth() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'depth');
    });
  }

  QueryBuilder<Thought, Thought, QDistinct> distinctByEnd_time() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'end_time');
    });
  }

  QueryBuilder<Thought, Thought, QDistinct> distinctByLength() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'length');
    });
  }

  QueryBuilder<Thought, Thought, QDistinct> distinctByLocation(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'location', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Thought, Thought, QDistinct> distinctByStart_time() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'start_time');
    });
  }

  QueryBuilder<Thought, Thought, QDistinct> distinctByThought_log(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'thought_log', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Thought, Thought, QDistinct> distinctByTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'timestamp');
    });
  }
}

extension ThoughtQueryProperty
    on QueryBuilder<Thought, Thought, QQueryProperty> {
  QueryBuilder<Thought, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Thought, bool, QQueryOperations> STILL_THINKINGProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'STILL_THINKING');
    });
  }

  QueryBuilder<Thought, int?, QQueryOperations> depthProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'depth');
    });
  }

  QueryBuilder<Thought, DateTime?, QQueryOperations> end_timeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'end_time');
    });
  }

  QueryBuilder<Thought, int?, QQueryOperations> lengthProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'length');
    });
  }

  QueryBuilder<Thought, String?, QQueryOperations> locationProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'location');
    });
  }

  QueryBuilder<Thought, DateTime?, QQueryOperations> start_timeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'start_time');
    });
  }

  QueryBuilder<Thought, String, QQueryOperations> thought_logProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'thought_log');
    });
  }

  QueryBuilder<Thought, DateTime, QQueryOperations> timestampProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'timestamp');
    });
  }
}
