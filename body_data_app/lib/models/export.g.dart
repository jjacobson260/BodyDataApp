// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'export.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetExportCollection on Isar {
  IsarCollection<Export> get exports => this.collection();
}

const ExportSchema = CollectionSchema(
  name: r'Export',
  id: 5377953304456643507,
  properties: {
    r'data_stream': PropertySchema(
      id: 0,
      name: r'data_stream',
      type: IsarType.string,
    ),
    r'export_type': PropertySchema(
      id: 1,
      name: r'export_type',
      type: IsarType.string,
    ),
    r'timestamp': PropertySchema(
      id: 2,
      name: r'timestamp',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _exportEstimateSize,
  serialize: _exportSerialize,
  deserialize: _exportDeserialize,
  deserializeProp: _exportDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _exportGetId,
  getLinks: _exportGetLinks,
  attach: _exportAttach,
  version: '3.1.0+1',
);

int _exportEstimateSize(
  Export object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.data_stream.length * 3;
  bytesCount += 3 + object.export_type.length * 3;
  return bytesCount;
}

void _exportSerialize(
  Export object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.data_stream);
  writer.writeString(offsets[1], object.export_type);
  writer.writeDateTime(offsets[2], object.timestamp);
}

Export _exportDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Export();
  object.data_stream = reader.readString(offsets[0]);
  object.export_type = reader.readString(offsets[1]);
  object.id = id;
  object.timestamp = reader.readDateTime(offsets[2]);
  return object;
}

P _exportDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readDateTime(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _exportGetId(Export object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _exportGetLinks(Export object) {
  return [];
}

void _exportAttach(IsarCollection<dynamic> col, Id id, Export object) {
  object.id = id;
}

extension ExportQueryWhereSort on QueryBuilder<Export, Export, QWhere> {
  QueryBuilder<Export, Export, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ExportQueryWhere on QueryBuilder<Export, Export, QWhereClause> {
  QueryBuilder<Export, Export, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Export, Export, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Export, Export, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Export, Export, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Export, Export, QAfterWhereClause> idBetween(
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

extension ExportQueryFilter on QueryBuilder<Export, Export, QFilterCondition> {
  QueryBuilder<Export, Export, QAfterFilterCondition> data_streamEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'data_stream',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Export, Export, QAfterFilterCondition> data_streamGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'data_stream',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Export, Export, QAfterFilterCondition> data_streamLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'data_stream',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Export, Export, QAfterFilterCondition> data_streamBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'data_stream',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Export, Export, QAfterFilterCondition> data_streamStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'data_stream',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Export, Export, QAfterFilterCondition> data_streamEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'data_stream',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Export, Export, QAfterFilterCondition> data_streamContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'data_stream',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Export, Export, QAfterFilterCondition> data_streamMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'data_stream',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Export, Export, QAfterFilterCondition> data_streamIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'data_stream',
        value: '',
      ));
    });
  }

  QueryBuilder<Export, Export, QAfterFilterCondition> data_streamIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'data_stream',
        value: '',
      ));
    });
  }

  QueryBuilder<Export, Export, QAfterFilterCondition> export_typeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'export_type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Export, Export, QAfterFilterCondition> export_typeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'export_type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Export, Export, QAfterFilterCondition> export_typeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'export_type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Export, Export, QAfterFilterCondition> export_typeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'export_type',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Export, Export, QAfterFilterCondition> export_typeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'export_type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Export, Export, QAfterFilterCondition> export_typeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'export_type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Export, Export, QAfterFilterCondition> export_typeContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'export_type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Export, Export, QAfterFilterCondition> export_typeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'export_type',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Export, Export, QAfterFilterCondition> export_typeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'export_type',
        value: '',
      ));
    });
  }

  QueryBuilder<Export, Export, QAfterFilterCondition> export_typeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'export_type',
        value: '',
      ));
    });
  }

  QueryBuilder<Export, Export, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Export, Export, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Export, Export, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Export, Export, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Export, Export, QAfterFilterCondition> timestampEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'timestamp',
        value: value,
      ));
    });
  }

  QueryBuilder<Export, Export, QAfterFilterCondition> timestampGreaterThan(
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

  QueryBuilder<Export, Export, QAfterFilterCondition> timestampLessThan(
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

  QueryBuilder<Export, Export, QAfterFilterCondition> timestampBetween(
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

extension ExportQueryObject on QueryBuilder<Export, Export, QFilterCondition> {}

extension ExportQueryLinks on QueryBuilder<Export, Export, QFilterCondition> {}

extension ExportQuerySortBy on QueryBuilder<Export, Export, QSortBy> {
  QueryBuilder<Export, Export, QAfterSortBy> sortByData_stream() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'data_stream', Sort.asc);
    });
  }

  QueryBuilder<Export, Export, QAfterSortBy> sortByData_streamDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'data_stream', Sort.desc);
    });
  }

  QueryBuilder<Export, Export, QAfterSortBy> sortByExport_type() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'export_type', Sort.asc);
    });
  }

  QueryBuilder<Export, Export, QAfterSortBy> sortByExport_typeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'export_type', Sort.desc);
    });
  }

  QueryBuilder<Export, Export, QAfterSortBy> sortByTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timestamp', Sort.asc);
    });
  }

  QueryBuilder<Export, Export, QAfterSortBy> sortByTimestampDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timestamp', Sort.desc);
    });
  }
}

extension ExportQuerySortThenBy on QueryBuilder<Export, Export, QSortThenBy> {
  QueryBuilder<Export, Export, QAfterSortBy> thenByData_stream() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'data_stream', Sort.asc);
    });
  }

  QueryBuilder<Export, Export, QAfterSortBy> thenByData_streamDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'data_stream', Sort.desc);
    });
  }

  QueryBuilder<Export, Export, QAfterSortBy> thenByExport_type() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'export_type', Sort.asc);
    });
  }

  QueryBuilder<Export, Export, QAfterSortBy> thenByExport_typeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'export_type', Sort.desc);
    });
  }

  QueryBuilder<Export, Export, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Export, Export, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Export, Export, QAfterSortBy> thenByTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timestamp', Sort.asc);
    });
  }

  QueryBuilder<Export, Export, QAfterSortBy> thenByTimestampDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timestamp', Sort.desc);
    });
  }
}

extension ExportQueryWhereDistinct on QueryBuilder<Export, Export, QDistinct> {
  QueryBuilder<Export, Export, QDistinct> distinctByData_stream(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'data_stream', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Export, Export, QDistinct> distinctByExport_type(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'export_type', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Export, Export, QDistinct> distinctByTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'timestamp');
    });
  }
}

extension ExportQueryProperty on QueryBuilder<Export, Export, QQueryProperty> {
  QueryBuilder<Export, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Export, String, QQueryOperations> data_streamProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'data_stream');
    });
  }

  QueryBuilder<Export, String, QQueryOperations> export_typeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'export_type');
    });
  }

  QueryBuilder<Export, DateTime, QQueryOperations> timestampProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'timestamp');
    });
  }
}
