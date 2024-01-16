// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_history_item.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetSearchHistoryItemCollection on Isar {
  IsarCollection<SearchHistoryItem> get searchHistoryItems => this.collection();
}

const SearchHistoryItemSchema = CollectionSchema(
  name: r'SearchHistoryItem',
  id: 7309085037371405047,
  properties: {
    r'search': PropertySchema(
      id: 0,
      name: r'search',
      type: IsarType.string,
    ),
    r'time': PropertySchema(
      id: 1,
      name: r'time',
      type: IsarType.long,
    )
  },
  estimateSize: _searchHistoryItemEstimateSize,
  serialize: _searchHistoryItemSerialize,
  deserialize: _searchHistoryItemDeserialize,
  deserializeProp: _searchHistoryItemDeserializeProp,
  idName: r'isarId',
  indexes: {
    r'search': IndexSchema(
      id: -7136685645476527910,
      name: r'search',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'search',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    ),
    r'time': IndexSchema(
      id: -2250472054110640942,
      name: r'time',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'time',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _searchHistoryItemGetId,
  getLinks: _searchHistoryItemGetLinks,
  attach: _searchHistoryItemAttach,
  version: '3.1.0+1',
);

int _searchHistoryItemEstimateSize(
  SearchHistoryItem object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.search.length * 3;
  return bytesCount;
}

void _searchHistoryItemSerialize(
  SearchHistoryItem object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.search);
  writer.writeLong(offsets[1], object.time);
}

SearchHistoryItem _searchHistoryItemDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = SearchHistoryItem(
    reader.readString(offsets[0]),
    reader.readLong(offsets[1]),
  );
  object.isarId = id;
  return object;
}

P _searchHistoryItemDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _searchHistoryItemGetId(SearchHistoryItem object) {
  return object.isarId;
}

List<IsarLinkBase<dynamic>> _searchHistoryItemGetLinks(
    SearchHistoryItem object) {
  return [];
}

void _searchHistoryItemAttach(
    IsarCollection<dynamic> col, Id id, SearchHistoryItem object) {
  object.isarId = id;
}

extension SearchHistoryItemByIndex on IsarCollection<SearchHistoryItem> {
  Future<SearchHistoryItem?> getBySearch(String search) {
    return getByIndex(r'search', [search]);
  }

  SearchHistoryItem? getBySearchSync(String search) {
    return getByIndexSync(r'search', [search]);
  }

  Future<bool> deleteBySearch(String search) {
    return deleteByIndex(r'search', [search]);
  }

  bool deleteBySearchSync(String search) {
    return deleteByIndexSync(r'search', [search]);
  }

  Future<List<SearchHistoryItem?>> getAllBySearch(List<String> searchValues) {
    final values = searchValues.map((e) => [e]).toList();
    return getAllByIndex(r'search', values);
  }

  List<SearchHistoryItem?> getAllBySearchSync(List<String> searchValues) {
    final values = searchValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'search', values);
  }

  Future<int> deleteAllBySearch(List<String> searchValues) {
    final values = searchValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'search', values);
  }

  int deleteAllBySearchSync(List<String> searchValues) {
    final values = searchValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'search', values);
  }

  Future<Id> putBySearch(SearchHistoryItem object) {
    return putByIndex(r'search', object);
  }

  Id putBySearchSync(SearchHistoryItem object, {bool saveLinks = true}) {
    return putByIndexSync(r'search', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllBySearch(List<SearchHistoryItem> objects) {
    return putAllByIndex(r'search', objects);
  }

  List<Id> putAllBySearchSync(List<SearchHistoryItem> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'search', objects, saveLinks: saveLinks);
  }
}

extension SearchHistoryItemQueryWhereSort
    on QueryBuilder<SearchHistoryItem, SearchHistoryItem, QWhere> {
  QueryBuilder<SearchHistoryItem, SearchHistoryItem, QAfterWhere> anyIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<SearchHistoryItem, SearchHistoryItem, QAfterWhere> anyTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'time'),
      );
    });
  }
}

extension SearchHistoryItemQueryWhere
    on QueryBuilder<SearchHistoryItem, SearchHistoryItem, QWhereClause> {
  QueryBuilder<SearchHistoryItem, SearchHistoryItem, QAfterWhereClause>
      isarIdEqualTo(Id isarId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: isarId,
        upper: isarId,
      ));
    });
  }

  QueryBuilder<SearchHistoryItem, SearchHistoryItem, QAfterWhereClause>
      isarIdNotEqualTo(Id isarId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: isarId, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: isarId, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: isarId, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: isarId, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<SearchHistoryItem, SearchHistoryItem, QAfterWhereClause>
      isarIdGreaterThan(Id isarId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: isarId, includeLower: include),
      );
    });
  }

  QueryBuilder<SearchHistoryItem, SearchHistoryItem, QAfterWhereClause>
      isarIdLessThan(Id isarId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: isarId, includeUpper: include),
      );
    });
  }

  QueryBuilder<SearchHistoryItem, SearchHistoryItem, QAfterWhereClause>
      isarIdBetween(
    Id lowerIsarId,
    Id upperIsarId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerIsarId,
        includeLower: includeLower,
        upper: upperIsarId,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SearchHistoryItem, SearchHistoryItem, QAfterWhereClause>
      searchEqualTo(String search) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'search',
        value: [search],
      ));
    });
  }

  QueryBuilder<SearchHistoryItem, SearchHistoryItem, QAfterWhereClause>
      searchNotEqualTo(String search) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'search',
              lower: [],
              upper: [search],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'search',
              lower: [search],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'search',
              lower: [search],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'search',
              lower: [],
              upper: [search],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<SearchHistoryItem, SearchHistoryItem, QAfterWhereClause>
      timeEqualTo(int time) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'time',
        value: [time],
      ));
    });
  }

  QueryBuilder<SearchHistoryItem, SearchHistoryItem, QAfterWhereClause>
      timeNotEqualTo(int time) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'time',
              lower: [],
              upper: [time],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'time',
              lower: [time],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'time',
              lower: [time],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'time',
              lower: [],
              upper: [time],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<SearchHistoryItem, SearchHistoryItem, QAfterWhereClause>
      timeGreaterThan(
    int time, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'time',
        lower: [time],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<SearchHistoryItem, SearchHistoryItem, QAfterWhereClause>
      timeLessThan(
    int time, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'time',
        lower: [],
        upper: [time],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<SearchHistoryItem, SearchHistoryItem, QAfterWhereClause>
      timeBetween(
    int lowerTime,
    int upperTime, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'time',
        lower: [lowerTime],
        includeLower: includeLower,
        upper: [upperTime],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension SearchHistoryItemQueryFilter
    on QueryBuilder<SearchHistoryItem, SearchHistoryItem, QFilterCondition> {
  QueryBuilder<SearchHistoryItem, SearchHistoryItem, QAfterFilterCondition>
      isarIdEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<SearchHistoryItem, SearchHistoryItem, QAfterFilterCondition>
      isarIdGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<SearchHistoryItem, SearchHistoryItem, QAfterFilterCondition>
      isarIdLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<SearchHistoryItem, SearchHistoryItem, QAfterFilterCondition>
      isarIdBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'isarId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SearchHistoryItem, SearchHistoryItem, QAfterFilterCondition>
      searchEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'search',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SearchHistoryItem, SearchHistoryItem, QAfterFilterCondition>
      searchGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'search',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SearchHistoryItem, SearchHistoryItem, QAfterFilterCondition>
      searchLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'search',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SearchHistoryItem, SearchHistoryItem, QAfterFilterCondition>
      searchBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'search',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SearchHistoryItem, SearchHistoryItem, QAfterFilterCondition>
      searchStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'search',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SearchHistoryItem, SearchHistoryItem, QAfterFilterCondition>
      searchEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'search',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SearchHistoryItem, SearchHistoryItem, QAfterFilterCondition>
      searchContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'search',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SearchHistoryItem, SearchHistoryItem, QAfterFilterCondition>
      searchMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'search',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SearchHistoryItem, SearchHistoryItem, QAfterFilterCondition>
      searchIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'search',
        value: '',
      ));
    });
  }

  QueryBuilder<SearchHistoryItem, SearchHistoryItem, QAfterFilterCondition>
      searchIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'search',
        value: '',
      ));
    });
  }

  QueryBuilder<SearchHistoryItem, SearchHistoryItem, QAfterFilterCondition>
      timeEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'time',
        value: value,
      ));
    });
  }

  QueryBuilder<SearchHistoryItem, SearchHistoryItem, QAfterFilterCondition>
      timeGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'time',
        value: value,
      ));
    });
  }

  QueryBuilder<SearchHistoryItem, SearchHistoryItem, QAfterFilterCondition>
      timeLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'time',
        value: value,
      ));
    });
  }

  QueryBuilder<SearchHistoryItem, SearchHistoryItem, QAfterFilterCondition>
      timeBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'time',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension SearchHistoryItemQueryObject
    on QueryBuilder<SearchHistoryItem, SearchHistoryItem, QFilterCondition> {}

extension SearchHistoryItemQueryLinks
    on QueryBuilder<SearchHistoryItem, SearchHistoryItem, QFilterCondition> {}

extension SearchHistoryItemQuerySortBy
    on QueryBuilder<SearchHistoryItem, SearchHistoryItem, QSortBy> {
  QueryBuilder<SearchHistoryItem, SearchHistoryItem, QAfterSortBy>
      sortBySearch() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'search', Sort.asc);
    });
  }

  QueryBuilder<SearchHistoryItem, SearchHistoryItem, QAfterSortBy>
      sortBySearchDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'search', Sort.desc);
    });
  }

  QueryBuilder<SearchHistoryItem, SearchHistoryItem, QAfterSortBy>
      sortByTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'time', Sort.asc);
    });
  }

  QueryBuilder<SearchHistoryItem, SearchHistoryItem, QAfterSortBy>
      sortByTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'time', Sort.desc);
    });
  }
}

extension SearchHistoryItemQuerySortThenBy
    on QueryBuilder<SearchHistoryItem, SearchHistoryItem, QSortThenBy> {
  QueryBuilder<SearchHistoryItem, SearchHistoryItem, QAfterSortBy>
      thenByIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.asc);
    });
  }

  QueryBuilder<SearchHistoryItem, SearchHistoryItem, QAfterSortBy>
      thenByIsarIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.desc);
    });
  }

  QueryBuilder<SearchHistoryItem, SearchHistoryItem, QAfterSortBy>
      thenBySearch() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'search', Sort.asc);
    });
  }

  QueryBuilder<SearchHistoryItem, SearchHistoryItem, QAfterSortBy>
      thenBySearchDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'search', Sort.desc);
    });
  }

  QueryBuilder<SearchHistoryItem, SearchHistoryItem, QAfterSortBy>
      thenByTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'time', Sort.asc);
    });
  }

  QueryBuilder<SearchHistoryItem, SearchHistoryItem, QAfterSortBy>
      thenByTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'time', Sort.desc);
    });
  }
}

extension SearchHistoryItemQueryWhereDistinct
    on QueryBuilder<SearchHistoryItem, SearchHistoryItem, QDistinct> {
  QueryBuilder<SearchHistoryItem, SearchHistoryItem, QDistinct>
      distinctBySearch({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'search', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SearchHistoryItem, SearchHistoryItem, QDistinct>
      distinctByTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'time');
    });
  }
}

extension SearchHistoryItemQueryProperty
    on QueryBuilder<SearchHistoryItem, SearchHistoryItem, QQueryProperty> {
  QueryBuilder<SearchHistoryItem, int, QQueryOperations> isarIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isarId');
    });
  }

  QueryBuilder<SearchHistoryItem, String, QQueryOperations> searchProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'search');
    });
  }

  QueryBuilder<SearchHistoryItem, int, QQueryOperations> timeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'time');
    });
  }
}
