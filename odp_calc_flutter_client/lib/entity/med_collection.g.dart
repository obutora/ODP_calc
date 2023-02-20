// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'med_collection.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetMedCollectionCollection on Isar {
  IsarCollection<MedCollection> get medCollections => this.collection();
}

const MedCollectionSchema = CollectionSchema(
  name: r'MedCollection',
  id: -677205781768572489,
  properties: {
    r'amount': PropertySchema(
      id: 0,
      name: r'amount',
      type: IsarType.long,
    ),
    r'isCollected': PropertySchema(
      id: 1,
      name: r'isCollected',
      type: IsarType.bool,
    ),
    r'medMasterId': PropertySchema(
      id: 2,
      name: r'medMasterId',
      type: IsarType.long,
    ),
    r'patientId': PropertySchema(
      id: 3,
      name: r'patientId',
      type: IsarType.long,
    )
  },
  estimateSize: _medCollectionEstimateSize,
  serialize: _medCollectionSerialize,
  deserialize: _medCollectionDeserialize,
  deserializeProp: _medCollectionDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _medCollectionGetId,
  getLinks: _medCollectionGetLinks,
  attach: _medCollectionAttach,
  version: '3.0.5',
);

int _medCollectionEstimateSize(
  MedCollection object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _medCollectionSerialize(
  MedCollection object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.amount);
  writer.writeBool(offsets[1], object.isCollected);
  writer.writeLong(offsets[2], object.medMasterId);
  writer.writeLong(offsets[3], object.patientId);
}

MedCollection _medCollectionDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = MedCollection(
    amount: reader.readLongOrNull(offsets[0]),
    id: id,
    isCollected: reader.readBoolOrNull(offsets[1]),
    medMasterId: reader.readLongOrNull(offsets[2]),
    patientId: reader.readLongOrNull(offsets[3]),
  );
  return object;
}

P _medCollectionDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset)) as P;
    case 1:
      return (reader.readBoolOrNull(offset)) as P;
    case 2:
      return (reader.readLongOrNull(offset)) as P;
    case 3:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _medCollectionGetId(MedCollection object) {
  return object.id ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _medCollectionGetLinks(MedCollection object) {
  return [];
}

void _medCollectionAttach(
    IsarCollection<dynamic> col, Id id, MedCollection object) {
  object.id = id;
}

extension MedCollectionQueryWhereSort
    on QueryBuilder<MedCollection, MedCollection, QWhere> {
  QueryBuilder<MedCollection, MedCollection, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension MedCollectionQueryWhere
    on QueryBuilder<MedCollection, MedCollection, QWhereClause> {
  QueryBuilder<MedCollection, MedCollection, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<MedCollection, MedCollection, QAfterWhereClause> idNotEqualTo(
      Id id) {
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

  QueryBuilder<MedCollection, MedCollection, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<MedCollection, MedCollection, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<MedCollection, MedCollection, QAfterWhereClause> idBetween(
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

extension MedCollectionQueryFilter
    on QueryBuilder<MedCollection, MedCollection, QFilterCondition> {
  QueryBuilder<MedCollection, MedCollection, QAfterFilterCondition>
      amountIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'amount',
      ));
    });
  }

  QueryBuilder<MedCollection, MedCollection, QAfterFilterCondition>
      amountIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'amount',
      ));
    });
  }

  QueryBuilder<MedCollection, MedCollection, QAfterFilterCondition>
      amountEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'amount',
        value: value,
      ));
    });
  }

  QueryBuilder<MedCollection, MedCollection, QAfterFilterCondition>
      amountGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'amount',
        value: value,
      ));
    });
  }

  QueryBuilder<MedCollection, MedCollection, QAfterFilterCondition>
      amountLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'amount',
        value: value,
      ));
    });
  }

  QueryBuilder<MedCollection, MedCollection, QAfterFilterCondition>
      amountBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'amount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<MedCollection, MedCollection, QAfterFilterCondition> idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<MedCollection, MedCollection, QAfterFilterCondition>
      idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<MedCollection, MedCollection, QAfterFilterCondition> idEqualTo(
      Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<MedCollection, MedCollection, QAfterFilterCondition>
      idGreaterThan(
    Id? value, {
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

  QueryBuilder<MedCollection, MedCollection, QAfterFilterCondition> idLessThan(
    Id? value, {
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

  QueryBuilder<MedCollection, MedCollection, QAfterFilterCondition> idBetween(
    Id? lower,
    Id? upper, {
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

  QueryBuilder<MedCollection, MedCollection, QAfterFilterCondition>
      isCollectedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isCollected',
      ));
    });
  }

  QueryBuilder<MedCollection, MedCollection, QAfterFilterCondition>
      isCollectedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isCollected',
      ));
    });
  }

  QueryBuilder<MedCollection, MedCollection, QAfterFilterCondition>
      isCollectedEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isCollected',
        value: value,
      ));
    });
  }

  QueryBuilder<MedCollection, MedCollection, QAfterFilterCondition>
      medMasterIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'medMasterId',
      ));
    });
  }

  QueryBuilder<MedCollection, MedCollection, QAfterFilterCondition>
      medMasterIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'medMasterId',
      ));
    });
  }

  QueryBuilder<MedCollection, MedCollection, QAfterFilterCondition>
      medMasterIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'medMasterId',
        value: value,
      ));
    });
  }

  QueryBuilder<MedCollection, MedCollection, QAfterFilterCondition>
      medMasterIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'medMasterId',
        value: value,
      ));
    });
  }

  QueryBuilder<MedCollection, MedCollection, QAfterFilterCondition>
      medMasterIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'medMasterId',
        value: value,
      ));
    });
  }

  QueryBuilder<MedCollection, MedCollection, QAfterFilterCondition>
      medMasterIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'medMasterId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<MedCollection, MedCollection, QAfterFilterCondition>
      patientIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'patientId',
      ));
    });
  }

  QueryBuilder<MedCollection, MedCollection, QAfterFilterCondition>
      patientIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'patientId',
      ));
    });
  }

  QueryBuilder<MedCollection, MedCollection, QAfterFilterCondition>
      patientIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'patientId',
        value: value,
      ));
    });
  }

  QueryBuilder<MedCollection, MedCollection, QAfterFilterCondition>
      patientIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'patientId',
        value: value,
      ));
    });
  }

  QueryBuilder<MedCollection, MedCollection, QAfterFilterCondition>
      patientIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'patientId',
        value: value,
      ));
    });
  }

  QueryBuilder<MedCollection, MedCollection, QAfterFilterCondition>
      patientIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'patientId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension MedCollectionQueryObject
    on QueryBuilder<MedCollection, MedCollection, QFilterCondition> {}

extension MedCollectionQueryLinks
    on QueryBuilder<MedCollection, MedCollection, QFilterCondition> {}

extension MedCollectionQuerySortBy
    on QueryBuilder<MedCollection, MedCollection, QSortBy> {
  QueryBuilder<MedCollection, MedCollection, QAfterSortBy> sortByAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'amount', Sort.asc);
    });
  }

  QueryBuilder<MedCollection, MedCollection, QAfterSortBy> sortByAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'amount', Sort.desc);
    });
  }

  QueryBuilder<MedCollection, MedCollection, QAfterSortBy> sortByIsCollected() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCollected', Sort.asc);
    });
  }

  QueryBuilder<MedCollection, MedCollection, QAfterSortBy>
      sortByIsCollectedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCollected', Sort.desc);
    });
  }

  QueryBuilder<MedCollection, MedCollection, QAfterSortBy> sortByMedMasterId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'medMasterId', Sort.asc);
    });
  }

  QueryBuilder<MedCollection, MedCollection, QAfterSortBy>
      sortByMedMasterIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'medMasterId', Sort.desc);
    });
  }

  QueryBuilder<MedCollection, MedCollection, QAfterSortBy> sortByPatientId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'patientId', Sort.asc);
    });
  }

  QueryBuilder<MedCollection, MedCollection, QAfterSortBy>
      sortByPatientIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'patientId', Sort.desc);
    });
  }
}

extension MedCollectionQuerySortThenBy
    on QueryBuilder<MedCollection, MedCollection, QSortThenBy> {
  QueryBuilder<MedCollection, MedCollection, QAfterSortBy> thenByAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'amount', Sort.asc);
    });
  }

  QueryBuilder<MedCollection, MedCollection, QAfterSortBy> thenByAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'amount', Sort.desc);
    });
  }

  QueryBuilder<MedCollection, MedCollection, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<MedCollection, MedCollection, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<MedCollection, MedCollection, QAfterSortBy> thenByIsCollected() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCollected', Sort.asc);
    });
  }

  QueryBuilder<MedCollection, MedCollection, QAfterSortBy>
      thenByIsCollectedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCollected', Sort.desc);
    });
  }

  QueryBuilder<MedCollection, MedCollection, QAfterSortBy> thenByMedMasterId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'medMasterId', Sort.asc);
    });
  }

  QueryBuilder<MedCollection, MedCollection, QAfterSortBy>
      thenByMedMasterIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'medMasterId', Sort.desc);
    });
  }

  QueryBuilder<MedCollection, MedCollection, QAfterSortBy> thenByPatientId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'patientId', Sort.asc);
    });
  }

  QueryBuilder<MedCollection, MedCollection, QAfterSortBy>
      thenByPatientIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'patientId', Sort.desc);
    });
  }
}

extension MedCollectionQueryWhereDistinct
    on QueryBuilder<MedCollection, MedCollection, QDistinct> {
  QueryBuilder<MedCollection, MedCollection, QDistinct> distinctByAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'amount');
    });
  }

  QueryBuilder<MedCollection, MedCollection, QDistinct>
      distinctByIsCollected() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isCollected');
    });
  }

  QueryBuilder<MedCollection, MedCollection, QDistinct>
      distinctByMedMasterId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'medMasterId');
    });
  }

  QueryBuilder<MedCollection, MedCollection, QDistinct> distinctByPatientId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'patientId');
    });
  }
}

extension MedCollectionQueryProperty
    on QueryBuilder<MedCollection, MedCollection, QQueryProperty> {
  QueryBuilder<MedCollection, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<MedCollection, int?, QQueryOperations> amountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'amount');
    });
  }

  QueryBuilder<MedCollection, bool?, QQueryOperations> isCollectedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isCollected');
    });
  }

  QueryBuilder<MedCollection, int?, QQueryOperations> medMasterIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'medMasterId');
    });
  }

  QueryBuilder<MedCollection, int?, QQueryOperations> patientIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'patientId');
    });
  }
}
