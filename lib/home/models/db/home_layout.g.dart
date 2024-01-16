// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_layout.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$HomeLayoutCWProxy {
  HomeLayout id(int id);

  HomeLayout isarId(int isarId);

  HomeLayout smallSources(List<HomeDataSource> smallSources);

  HomeLayout bigSource(HomeDataSource bigSource);

  HomeLayout showBigSource(bool showBigSource);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `HomeLayout(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// HomeLayout(...).copyWith(id: 12, name: "My name")
  /// ````
  HomeLayout call({
    int? id,
    int? isarId,
    List<HomeDataSource>? smallSources,
    HomeDataSource? bigSource,
    bool? showBigSource,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfHomeLayout.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfHomeLayout.copyWith.fieldName(...)`
class _$HomeLayoutCWProxyImpl implements _$HomeLayoutCWProxy {
  const _$HomeLayoutCWProxyImpl(this._value);

  final HomeLayout _value;

  @override
  HomeLayout id(int id) => this(id: id);

  @override
  HomeLayout isarId(int isarId) => this(isarId: isarId);

  @override
  HomeLayout smallSources(List<HomeDataSource> smallSources) =>
      this(smallSources: smallSources);

  @override
  HomeLayout bigSource(HomeDataSource bigSource) => this(bigSource: bigSource);

  @override
  HomeLayout showBigSource(bool showBigSource) =>
      this(showBigSource: showBigSource);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `HomeLayout(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// HomeLayout(...).copyWith(id: 12, name: "My name")
  /// ````
  HomeLayout call({
    Object? id = const $CopyWithPlaceholder(),
    Object? isarId = const $CopyWithPlaceholder(),
    Object? smallSources = const $CopyWithPlaceholder(),
    Object? bigSource = const $CopyWithPlaceholder(),
    Object? showBigSource = const $CopyWithPlaceholder(),
  }) {
    return HomeLayout._(
      id == const $CopyWithPlaceholder() || id == null
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as int,
      isarId == const $CopyWithPlaceholder() || isarId == null
          ? _value.isarId
          // ignore: cast_nullable_to_non_nullable
          : isarId as int,
      smallSources == const $CopyWithPlaceholder() || smallSources == null
          ? _value.smallSources
          // ignore: cast_nullable_to_non_nullable
          : smallSources as List<HomeDataSource>,
      bigSource == const $CopyWithPlaceholder() || bigSource == null
          ? _value.bigSource
          // ignore: cast_nullable_to_non_nullable
          : bigSource as HomeDataSource,
      showBigSource == const $CopyWithPlaceholder() || showBigSource == null
          ? _value.showBigSource
          // ignore: cast_nullable_to_non_nullable
          : showBigSource as bool,
    );
  }
}

extension $HomeLayoutCopyWith on HomeLayout {
  /// Returns a callable class that can be used as follows: `instanceOfHomeLayout.copyWith(...)` or like so:`instanceOfHomeLayout.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$HomeLayoutCWProxy get copyWith => _$HomeLayoutCWProxyImpl(this);
}

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetHomeLayoutCollection on Isar {
  IsarCollection<HomeLayout> get homeLayouts => this.collection();
}

const HomeLayoutSchema = CollectionSchema(
  name: r'HomeLayout',
  id: 5158953038059395127,
  properties: {
    r'dbBigSource': PropertySchema(
      id: 0,
      name: r'dbBigSource',
      type: IsarType.string,
    ),
    r'dbSmallSources': PropertySchema(
      id: 1,
      name: r'dbSmallSources',
      type: IsarType.stringList,
    ),
    r'showBigSource': PropertySchema(
      id: 2,
      name: r'showBigSource',
      type: IsarType.bool,
    )
  },
  estimateSize: _homeLayoutEstimateSize,
  serialize: _homeLayoutSerialize,
  deserialize: _homeLayoutDeserialize,
  deserializeProp: _homeLayoutDeserializeProp,
  idName: r'isarId',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _homeLayoutGetId,
  getLinks: _homeLayoutGetLinks,
  attach: _homeLayoutAttach,
  version: '3.1.0+1',
);

int _homeLayoutEstimateSize(
  HomeLayout object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.dbBigSource.length * 3;
  bytesCount += 3 + object.dbSmallSources.length * 3;
  {
    for (var i = 0; i < object.dbSmallSources.length; i++) {
      final value = object.dbSmallSources[i];
      bytesCount += value.length * 3;
    }
  }
  return bytesCount;
}

void _homeLayoutSerialize(
  HomeLayout object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.dbBigSource);
  writer.writeStringList(offsets[1], object.dbSmallSources);
  writer.writeBool(offsets[2], object.showBigSource);
}

HomeLayout _homeLayoutDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = HomeLayout();
  object.dbBigSource = reader.readString(offsets[0]);
  object.dbSmallSources = reader.readStringList(offsets[1]) ?? [];
  object.isarId = id;
  object.showBigSource = reader.readBool(offsets[2]);
  return object;
}

P _homeLayoutDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readStringList(offset) ?? []) as P;
    case 2:
      return (reader.readBool(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _homeLayoutGetId(HomeLayout object) {
  return object.isarId;
}

List<IsarLinkBase<dynamic>> _homeLayoutGetLinks(HomeLayout object) {
  return [];
}

void _homeLayoutAttach(IsarCollection<dynamic> col, Id id, HomeLayout object) {
  object.isarId = id;
}

extension HomeLayoutQueryWhereSort
    on QueryBuilder<HomeLayout, HomeLayout, QWhere> {
  QueryBuilder<HomeLayout, HomeLayout, QAfterWhere> anyIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension HomeLayoutQueryWhere
    on QueryBuilder<HomeLayout, HomeLayout, QWhereClause> {
  QueryBuilder<HomeLayout, HomeLayout, QAfterWhereClause> isarIdEqualTo(
      Id isarId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: isarId,
        upper: isarId,
      ));
    });
  }

  QueryBuilder<HomeLayout, HomeLayout, QAfterWhereClause> isarIdNotEqualTo(
      Id isarId) {
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

  QueryBuilder<HomeLayout, HomeLayout, QAfterWhereClause> isarIdGreaterThan(
      Id isarId,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: isarId, includeLower: include),
      );
    });
  }

  QueryBuilder<HomeLayout, HomeLayout, QAfterWhereClause> isarIdLessThan(
      Id isarId,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: isarId, includeUpper: include),
      );
    });
  }

  QueryBuilder<HomeLayout, HomeLayout, QAfterWhereClause> isarIdBetween(
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
}

extension HomeLayoutQueryFilter
    on QueryBuilder<HomeLayout, HomeLayout, QFilterCondition> {
  QueryBuilder<HomeLayout, HomeLayout, QAfterFilterCondition>
      dbBigSourceEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dbBigSource',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HomeLayout, HomeLayout, QAfterFilterCondition>
      dbBigSourceGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dbBigSource',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HomeLayout, HomeLayout, QAfterFilterCondition>
      dbBigSourceLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dbBigSource',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HomeLayout, HomeLayout, QAfterFilterCondition>
      dbBigSourceBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dbBigSource',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HomeLayout, HomeLayout, QAfterFilterCondition>
      dbBigSourceStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'dbBigSource',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HomeLayout, HomeLayout, QAfterFilterCondition>
      dbBigSourceEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'dbBigSource',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HomeLayout, HomeLayout, QAfterFilterCondition>
      dbBigSourceContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'dbBigSource',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HomeLayout, HomeLayout, QAfterFilterCondition>
      dbBigSourceMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'dbBigSource',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HomeLayout, HomeLayout, QAfterFilterCondition>
      dbBigSourceIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dbBigSource',
        value: '',
      ));
    });
  }

  QueryBuilder<HomeLayout, HomeLayout, QAfterFilterCondition>
      dbBigSourceIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'dbBigSource',
        value: '',
      ));
    });
  }

  QueryBuilder<HomeLayout, HomeLayout, QAfterFilterCondition>
      dbSmallSourcesElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dbSmallSources',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HomeLayout, HomeLayout, QAfterFilterCondition>
      dbSmallSourcesElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dbSmallSources',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HomeLayout, HomeLayout, QAfterFilterCondition>
      dbSmallSourcesElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dbSmallSources',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HomeLayout, HomeLayout, QAfterFilterCondition>
      dbSmallSourcesElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dbSmallSources',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HomeLayout, HomeLayout, QAfterFilterCondition>
      dbSmallSourcesElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'dbSmallSources',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HomeLayout, HomeLayout, QAfterFilterCondition>
      dbSmallSourcesElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'dbSmallSources',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HomeLayout, HomeLayout, QAfterFilterCondition>
      dbSmallSourcesElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'dbSmallSources',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HomeLayout, HomeLayout, QAfterFilterCondition>
      dbSmallSourcesElementMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'dbSmallSources',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HomeLayout, HomeLayout, QAfterFilterCondition>
      dbSmallSourcesElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dbSmallSources',
        value: '',
      ));
    });
  }

  QueryBuilder<HomeLayout, HomeLayout, QAfterFilterCondition>
      dbSmallSourcesElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'dbSmallSources',
        value: '',
      ));
    });
  }

  QueryBuilder<HomeLayout, HomeLayout, QAfterFilterCondition>
      dbSmallSourcesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'dbSmallSources',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<HomeLayout, HomeLayout, QAfterFilterCondition>
      dbSmallSourcesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'dbSmallSources',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<HomeLayout, HomeLayout, QAfterFilterCondition>
      dbSmallSourcesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'dbSmallSources',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<HomeLayout, HomeLayout, QAfterFilterCondition>
      dbSmallSourcesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'dbSmallSources',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<HomeLayout, HomeLayout, QAfterFilterCondition>
      dbSmallSourcesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'dbSmallSources',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<HomeLayout, HomeLayout, QAfterFilterCondition>
      dbSmallSourcesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'dbSmallSources',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<HomeLayout, HomeLayout, QAfterFilterCondition> isarIdEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<HomeLayout, HomeLayout, QAfterFilterCondition> isarIdGreaterThan(
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

  QueryBuilder<HomeLayout, HomeLayout, QAfterFilterCondition> isarIdLessThan(
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

  QueryBuilder<HomeLayout, HomeLayout, QAfterFilterCondition> isarIdBetween(
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

  QueryBuilder<HomeLayout, HomeLayout, QAfterFilterCondition>
      showBigSourceEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'showBigSource',
        value: value,
      ));
    });
  }
}

extension HomeLayoutQueryObject
    on QueryBuilder<HomeLayout, HomeLayout, QFilterCondition> {}

extension HomeLayoutQueryLinks
    on QueryBuilder<HomeLayout, HomeLayout, QFilterCondition> {}

extension HomeLayoutQuerySortBy
    on QueryBuilder<HomeLayout, HomeLayout, QSortBy> {
  QueryBuilder<HomeLayout, HomeLayout, QAfterSortBy> sortByDbBigSource() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dbBigSource', Sort.asc);
    });
  }

  QueryBuilder<HomeLayout, HomeLayout, QAfterSortBy> sortByDbBigSourceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dbBigSource', Sort.desc);
    });
  }

  QueryBuilder<HomeLayout, HomeLayout, QAfterSortBy> sortByShowBigSource() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'showBigSource', Sort.asc);
    });
  }

  QueryBuilder<HomeLayout, HomeLayout, QAfterSortBy> sortByShowBigSourceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'showBigSource', Sort.desc);
    });
  }
}

extension HomeLayoutQuerySortThenBy
    on QueryBuilder<HomeLayout, HomeLayout, QSortThenBy> {
  QueryBuilder<HomeLayout, HomeLayout, QAfterSortBy> thenByDbBigSource() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dbBigSource', Sort.asc);
    });
  }

  QueryBuilder<HomeLayout, HomeLayout, QAfterSortBy> thenByDbBigSourceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dbBigSource', Sort.desc);
    });
  }

  QueryBuilder<HomeLayout, HomeLayout, QAfterSortBy> thenByIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.asc);
    });
  }

  QueryBuilder<HomeLayout, HomeLayout, QAfterSortBy> thenByIsarIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.desc);
    });
  }

  QueryBuilder<HomeLayout, HomeLayout, QAfterSortBy> thenByShowBigSource() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'showBigSource', Sort.asc);
    });
  }

  QueryBuilder<HomeLayout, HomeLayout, QAfterSortBy> thenByShowBigSourceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'showBigSource', Sort.desc);
    });
  }
}

extension HomeLayoutQueryWhereDistinct
    on QueryBuilder<HomeLayout, HomeLayout, QDistinct> {
  QueryBuilder<HomeLayout, HomeLayout, QDistinct> distinctByDbBigSource(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dbBigSource', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<HomeLayout, HomeLayout, QDistinct> distinctByDbSmallSources() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dbSmallSources');
    });
  }

  QueryBuilder<HomeLayout, HomeLayout, QDistinct> distinctByShowBigSource() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'showBigSource');
    });
  }
}

extension HomeLayoutQueryProperty
    on QueryBuilder<HomeLayout, HomeLayout, QQueryProperty> {
  QueryBuilder<HomeLayout, int, QQueryOperations> isarIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isarId');
    });
  }

  QueryBuilder<HomeLayout, String, QQueryOperations> dbBigSourceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dbBigSource');
    });
  }

  QueryBuilder<HomeLayout, List<String>, QQueryOperations>
      dbSmallSourcesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dbSmallSources');
    });
  }

  QueryBuilder<HomeLayout, bool, QQueryOperations> showBigSourceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'showBigSource');
    });
  }
}
