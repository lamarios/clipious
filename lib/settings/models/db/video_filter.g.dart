// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_filter.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$VideoFilterCWProxy {
  VideoFilter id(int id);

  VideoFilter channelId(String? channelId);

  VideoFilter operation(FilterOperation? operation);

  VideoFilter type(FilterType? type);

  VideoFilter value(String? value);

  VideoFilter filterAll(bool filterAll);

  VideoFilter hideFromFeed(bool hideFromFeed);

  VideoFilter daysOfWeek(List<int> daysOfWeek);

  VideoFilter startTime(String startTime);

  VideoFilter isarId(int isarId);

  VideoFilter endTime(String endTime);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `VideoFilter(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// VideoFilter(...).copyWith(id: 12, name: "My name")
  /// ````
  VideoFilter call({
    int? id,
    String? channelId,
    FilterOperation? operation,
    FilterType? type,
    String? value,
    bool? filterAll,
    bool? hideFromFeed,
    List<int>? daysOfWeek,
    String? startTime,
    int? isarId,
    String? endTime,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfVideoFilter.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfVideoFilter.copyWith.fieldName(...)`
class _$VideoFilterCWProxyImpl implements _$VideoFilterCWProxy {
  const _$VideoFilterCWProxyImpl(this._value);

  final VideoFilter _value;

  @override
  VideoFilter id(int id) => this(id: id);

  @override
  VideoFilter channelId(String? channelId) => this(channelId: channelId);

  @override
  VideoFilter operation(FilterOperation? operation) =>
      this(operation: operation);

  @override
  VideoFilter type(FilterType? type) => this(type: type);

  @override
  VideoFilter value(String? value) => this(value: value);

  @override
  VideoFilter filterAll(bool filterAll) => this(filterAll: filterAll);

  @override
  VideoFilter hideFromFeed(bool hideFromFeed) =>
      this(hideFromFeed: hideFromFeed);

  @override
  VideoFilter daysOfWeek(List<int> daysOfWeek) => this(daysOfWeek: daysOfWeek);

  @override
  VideoFilter startTime(String startTime) => this(startTime: startTime);

  @override
  VideoFilter isarId(int isarId) => this(isarId: isarId);

  @override
  VideoFilter endTime(String endTime) => this(endTime: endTime);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `VideoFilter(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// VideoFilter(...).copyWith(id: 12, name: "My name")
  /// ````
  VideoFilter call({
    Object? id = const $CopyWithPlaceholder(),
    Object? channelId = const $CopyWithPlaceholder(),
    Object? operation = const $CopyWithPlaceholder(),
    Object? type = const $CopyWithPlaceholder(),
    Object? value = const $CopyWithPlaceholder(),
    Object? filterAll = const $CopyWithPlaceholder(),
    Object? hideFromFeed = const $CopyWithPlaceholder(),
    Object? daysOfWeek = const $CopyWithPlaceholder(),
    Object? startTime = const $CopyWithPlaceholder(),
    Object? isarId = const $CopyWithPlaceholder(),
    Object? endTime = const $CopyWithPlaceholder(),
  }) {
    return VideoFilter._(
      id == const $CopyWithPlaceholder() || id == null
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as int,
      channelId == const $CopyWithPlaceholder()
          ? _value.channelId
          // ignore: cast_nullable_to_non_nullable
          : channelId as String?,
      operation == const $CopyWithPlaceholder()
          ? _value.operation
          // ignore: cast_nullable_to_non_nullable
          : operation as FilterOperation?,
      type == const $CopyWithPlaceholder()
          ? _value.type
          // ignore: cast_nullable_to_non_nullable
          : type as FilterType?,
      value == const $CopyWithPlaceholder()
          ? _value.value
          // ignore: cast_nullable_to_non_nullable
          : value as String?,
      filterAll == const $CopyWithPlaceholder() || filterAll == null
          ? _value.filterAll
          // ignore: cast_nullable_to_non_nullable
          : filterAll as bool,
      hideFromFeed == const $CopyWithPlaceholder() || hideFromFeed == null
          ? _value.hideFromFeed
          // ignore: cast_nullable_to_non_nullable
          : hideFromFeed as bool,
      daysOfWeek == const $CopyWithPlaceholder() || daysOfWeek == null
          ? _value.daysOfWeek
          // ignore: cast_nullable_to_non_nullable
          : daysOfWeek as List<int>,
      startTime == const $CopyWithPlaceholder() || startTime == null
          ? _value.startTime
          // ignore: cast_nullable_to_non_nullable
          : startTime as String,
      isarId == const $CopyWithPlaceholder() || isarId == null
          ? _value.isarId
          // ignore: cast_nullable_to_non_nullable
          : isarId as int,
      endTime == const $CopyWithPlaceholder() || endTime == null
          ? _value.endTime
          // ignore: cast_nullable_to_non_nullable
          : endTime as String,
    );
  }
}

extension $VideoFilterCopyWith on VideoFilter {
  /// Returns a callable class that can be used as follows: `instanceOfVideoFilter.copyWith(...)` or like so:`instanceOfVideoFilter.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$VideoFilterCWProxy get copyWith => _$VideoFilterCWProxyImpl(this);
}

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetVideoFilterCollection on Isar {
  IsarCollection<VideoFilter> get videoFilters => this.collection();
}

const VideoFilterSchema = CollectionSchema(
  name: r'VideoFilter',
  id: -8870758483495091113,
  properties: {
    r'channelId': PropertySchema(
      id: 0,
      name: r'channelId',
      type: IsarType.string,
    ),
    r'daysOfWeek': PropertySchema(
      id: 1,
      name: r'daysOfWeek',
      type: IsarType.longList,
    ),
    r'dbOperation': PropertySchema(
      id: 2,
      name: r'dbOperation',
      type: IsarType.string,
    ),
    r'dbType': PropertySchema(
      id: 3,
      name: r'dbType',
      type: IsarType.string,
    ),
    r'endTime': PropertySchema(
      id: 4,
      name: r'endTime',
      type: IsarType.string,
    ),
    r'filterAll': PropertySchema(
      id: 5,
      name: r'filterAll',
      type: IsarType.bool,
    ),
    r'hideFromFeed': PropertySchema(
      id: 6,
      name: r'hideFromFeed',
      type: IsarType.bool,
    ),
    r'startTime': PropertySchema(
      id: 7,
      name: r'startTime',
      type: IsarType.string,
    ),
    r'value': PropertySchema(
      id: 8,
      name: r'value',
      type: IsarType.string,
    )
  },
  estimateSize: _videoFilterEstimateSize,
  serialize: _videoFilterSerialize,
  deserialize: _videoFilterDeserialize,
  deserializeProp: _videoFilterDeserializeProp,
  idName: r'isarId',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _videoFilterGetId,
  getLinks: _videoFilterGetLinks,
  attach: _videoFilterAttach,
  version: '3.1.0+1',
);

int _videoFilterEstimateSize(
  VideoFilter object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.channelId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.daysOfWeek.length * 8;
  {
    final value = object.dbOperation;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.dbType;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.endTime.length * 3;
  bytesCount += 3 + object.startTime.length * 3;
  {
    final value = object.value;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _videoFilterSerialize(
  VideoFilter object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.channelId);
  writer.writeLongList(offsets[1], object.daysOfWeek);
  writer.writeString(offsets[2], object.dbOperation);
  writer.writeString(offsets[3], object.dbType);
  writer.writeString(offsets[4], object.endTime);
  writer.writeBool(offsets[5], object.filterAll);
  writer.writeBool(offsets[6], object.hideFromFeed);
  writer.writeString(offsets[7], object.startTime);
  writer.writeString(offsets[8], object.value);
}

VideoFilter _videoFilterDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = VideoFilter(
    channelId: reader.readStringOrNull(offsets[0]),
    value: reader.readStringOrNull(offsets[8]),
  );
  object.daysOfWeek = reader.readLongList(offsets[1]) ?? [];
  object.dbOperation = reader.readStringOrNull(offsets[2]);
  object.dbType = reader.readStringOrNull(offsets[3]);
  object.endTime = reader.readString(offsets[4]);
  object.filterAll = reader.readBool(offsets[5]);
  object.hideFromFeed = reader.readBool(offsets[6]);
  object.isarId = id;
  object.startTime = reader.readString(offsets[7]);
  return object;
}

P _videoFilterDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readLongList(offset) ?? []) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readBool(offset)) as P;
    case 6:
      return (reader.readBool(offset)) as P;
    case 7:
      return (reader.readString(offset)) as P;
    case 8:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _videoFilterGetId(VideoFilter object) {
  return object.isarId;
}

List<IsarLinkBase<dynamic>> _videoFilterGetLinks(VideoFilter object) {
  return [];
}

void _videoFilterAttach(
    IsarCollection<dynamic> col, Id id, VideoFilter object) {
  object.isarId = id;
}

extension VideoFilterQueryWhereSort
    on QueryBuilder<VideoFilter, VideoFilter, QWhere> {
  QueryBuilder<VideoFilter, VideoFilter, QAfterWhere> anyIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension VideoFilterQueryWhere
    on QueryBuilder<VideoFilter, VideoFilter, QWhereClause> {
  QueryBuilder<VideoFilter, VideoFilter, QAfterWhereClause> isarIdEqualTo(
      Id isarId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: isarId,
        upper: isarId,
      ));
    });
  }

  QueryBuilder<VideoFilter, VideoFilter, QAfterWhereClause> isarIdNotEqualTo(
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

  QueryBuilder<VideoFilter, VideoFilter, QAfterWhereClause> isarIdGreaterThan(
      Id isarId,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: isarId, includeLower: include),
      );
    });
  }

  QueryBuilder<VideoFilter, VideoFilter, QAfterWhereClause> isarIdLessThan(
      Id isarId,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: isarId, includeUpper: include),
      );
    });
  }

  QueryBuilder<VideoFilter, VideoFilter, QAfterWhereClause> isarIdBetween(
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

extension VideoFilterQueryFilter
    on QueryBuilder<VideoFilter, VideoFilter, QFilterCondition> {
  QueryBuilder<VideoFilter, VideoFilter, QAfterFilterCondition>
      channelIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'channelId',
      ));
    });
  }

  QueryBuilder<VideoFilter, VideoFilter, QAfterFilterCondition>
      channelIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'channelId',
      ));
    });
  }

  QueryBuilder<VideoFilter, VideoFilter, QAfterFilterCondition>
      channelIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'channelId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoFilter, VideoFilter, QAfterFilterCondition>
      channelIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'channelId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoFilter, VideoFilter, QAfterFilterCondition>
      channelIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'channelId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoFilter, VideoFilter, QAfterFilterCondition>
      channelIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'channelId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoFilter, VideoFilter, QAfterFilterCondition>
      channelIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'channelId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoFilter, VideoFilter, QAfterFilterCondition>
      channelIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'channelId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoFilter, VideoFilter, QAfterFilterCondition>
      channelIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'channelId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoFilter, VideoFilter, QAfterFilterCondition>
      channelIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'channelId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoFilter, VideoFilter, QAfterFilterCondition>
      channelIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'channelId',
        value: '',
      ));
    });
  }

  QueryBuilder<VideoFilter, VideoFilter, QAfterFilterCondition>
      channelIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'channelId',
        value: '',
      ));
    });
  }

  QueryBuilder<VideoFilter, VideoFilter, QAfterFilterCondition>
      daysOfWeekElementEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'daysOfWeek',
        value: value,
      ));
    });
  }

  QueryBuilder<VideoFilter, VideoFilter, QAfterFilterCondition>
      daysOfWeekElementGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'daysOfWeek',
        value: value,
      ));
    });
  }

  QueryBuilder<VideoFilter, VideoFilter, QAfterFilterCondition>
      daysOfWeekElementLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'daysOfWeek',
        value: value,
      ));
    });
  }

  QueryBuilder<VideoFilter, VideoFilter, QAfterFilterCondition>
      daysOfWeekElementBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'daysOfWeek',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<VideoFilter, VideoFilter, QAfterFilterCondition>
      daysOfWeekLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'daysOfWeek',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<VideoFilter, VideoFilter, QAfterFilterCondition>
      daysOfWeekIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'daysOfWeek',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<VideoFilter, VideoFilter, QAfterFilterCondition>
      daysOfWeekIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'daysOfWeek',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<VideoFilter, VideoFilter, QAfterFilterCondition>
      daysOfWeekLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'daysOfWeek',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<VideoFilter, VideoFilter, QAfterFilterCondition>
      daysOfWeekLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'daysOfWeek',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<VideoFilter, VideoFilter, QAfterFilterCondition>
      daysOfWeekLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'daysOfWeek',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<VideoFilter, VideoFilter, QAfterFilterCondition>
      dbOperationIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'dbOperation',
      ));
    });
  }

  QueryBuilder<VideoFilter, VideoFilter, QAfterFilterCondition>
      dbOperationIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'dbOperation',
      ));
    });
  }

  QueryBuilder<VideoFilter, VideoFilter, QAfterFilterCondition>
      dbOperationEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dbOperation',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoFilter, VideoFilter, QAfterFilterCondition>
      dbOperationGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dbOperation',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoFilter, VideoFilter, QAfterFilterCondition>
      dbOperationLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dbOperation',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoFilter, VideoFilter, QAfterFilterCondition>
      dbOperationBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dbOperation',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoFilter, VideoFilter, QAfterFilterCondition>
      dbOperationStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'dbOperation',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoFilter, VideoFilter, QAfterFilterCondition>
      dbOperationEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'dbOperation',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoFilter, VideoFilter, QAfterFilterCondition>
      dbOperationContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'dbOperation',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoFilter, VideoFilter, QAfterFilterCondition>
      dbOperationMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'dbOperation',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoFilter, VideoFilter, QAfterFilterCondition>
      dbOperationIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dbOperation',
        value: '',
      ));
    });
  }

  QueryBuilder<VideoFilter, VideoFilter, QAfterFilterCondition>
      dbOperationIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'dbOperation',
        value: '',
      ));
    });
  }

  QueryBuilder<VideoFilter, VideoFilter, QAfterFilterCondition> dbTypeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'dbType',
      ));
    });
  }

  QueryBuilder<VideoFilter, VideoFilter, QAfterFilterCondition>
      dbTypeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'dbType',
      ));
    });
  }

  QueryBuilder<VideoFilter, VideoFilter, QAfterFilterCondition> dbTypeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dbType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoFilter, VideoFilter, QAfterFilterCondition>
      dbTypeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dbType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoFilter, VideoFilter, QAfterFilterCondition> dbTypeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dbType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoFilter, VideoFilter, QAfterFilterCondition> dbTypeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dbType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoFilter, VideoFilter, QAfterFilterCondition>
      dbTypeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'dbType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoFilter, VideoFilter, QAfterFilterCondition> dbTypeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'dbType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoFilter, VideoFilter, QAfterFilterCondition> dbTypeContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'dbType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoFilter, VideoFilter, QAfterFilterCondition> dbTypeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'dbType',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoFilter, VideoFilter, QAfterFilterCondition>
      dbTypeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dbType',
        value: '',
      ));
    });
  }

  QueryBuilder<VideoFilter, VideoFilter, QAfterFilterCondition>
      dbTypeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'dbType',
        value: '',
      ));
    });
  }

  QueryBuilder<VideoFilter, VideoFilter, QAfterFilterCondition> endTimeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'endTime',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoFilter, VideoFilter, QAfterFilterCondition>
      endTimeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'endTime',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoFilter, VideoFilter, QAfterFilterCondition> endTimeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'endTime',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoFilter, VideoFilter, QAfterFilterCondition> endTimeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'endTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoFilter, VideoFilter, QAfterFilterCondition>
      endTimeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'endTime',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoFilter, VideoFilter, QAfterFilterCondition> endTimeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'endTime',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoFilter, VideoFilter, QAfterFilterCondition> endTimeContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'endTime',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoFilter, VideoFilter, QAfterFilterCondition> endTimeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'endTime',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoFilter, VideoFilter, QAfterFilterCondition>
      endTimeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'endTime',
        value: '',
      ));
    });
  }

  QueryBuilder<VideoFilter, VideoFilter, QAfterFilterCondition>
      endTimeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'endTime',
        value: '',
      ));
    });
  }

  QueryBuilder<VideoFilter, VideoFilter, QAfterFilterCondition>
      filterAllEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'filterAll',
        value: value,
      ));
    });
  }

  QueryBuilder<VideoFilter, VideoFilter, QAfterFilterCondition>
      hideFromFeedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hideFromFeed',
        value: value,
      ));
    });
  }

  QueryBuilder<VideoFilter, VideoFilter, QAfterFilterCondition> isarIdEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<VideoFilter, VideoFilter, QAfterFilterCondition>
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

  QueryBuilder<VideoFilter, VideoFilter, QAfterFilterCondition> isarIdLessThan(
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

  QueryBuilder<VideoFilter, VideoFilter, QAfterFilterCondition> isarIdBetween(
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

  QueryBuilder<VideoFilter, VideoFilter, QAfterFilterCondition>
      startTimeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'startTime',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoFilter, VideoFilter, QAfterFilterCondition>
      startTimeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'startTime',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoFilter, VideoFilter, QAfterFilterCondition>
      startTimeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'startTime',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoFilter, VideoFilter, QAfterFilterCondition>
      startTimeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'startTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoFilter, VideoFilter, QAfterFilterCondition>
      startTimeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'startTime',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoFilter, VideoFilter, QAfterFilterCondition>
      startTimeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'startTime',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoFilter, VideoFilter, QAfterFilterCondition>
      startTimeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'startTime',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoFilter, VideoFilter, QAfterFilterCondition>
      startTimeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'startTime',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoFilter, VideoFilter, QAfterFilterCondition>
      startTimeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'startTime',
        value: '',
      ));
    });
  }

  QueryBuilder<VideoFilter, VideoFilter, QAfterFilterCondition>
      startTimeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'startTime',
        value: '',
      ));
    });
  }

  QueryBuilder<VideoFilter, VideoFilter, QAfterFilterCondition> valueIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'value',
      ));
    });
  }

  QueryBuilder<VideoFilter, VideoFilter, QAfterFilterCondition>
      valueIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'value',
      ));
    });
  }

  QueryBuilder<VideoFilter, VideoFilter, QAfterFilterCondition> valueEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'value',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoFilter, VideoFilter, QAfterFilterCondition>
      valueGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'value',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoFilter, VideoFilter, QAfterFilterCondition> valueLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'value',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoFilter, VideoFilter, QAfterFilterCondition> valueBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'value',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoFilter, VideoFilter, QAfterFilterCondition> valueStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'value',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoFilter, VideoFilter, QAfterFilterCondition> valueEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'value',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoFilter, VideoFilter, QAfterFilterCondition> valueContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'value',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoFilter, VideoFilter, QAfterFilterCondition> valueMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'value',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoFilter, VideoFilter, QAfterFilterCondition> valueIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'value',
        value: '',
      ));
    });
  }

  QueryBuilder<VideoFilter, VideoFilter, QAfterFilterCondition>
      valueIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'value',
        value: '',
      ));
    });
  }
}

extension VideoFilterQueryObject
    on QueryBuilder<VideoFilter, VideoFilter, QFilterCondition> {}

extension VideoFilterQueryLinks
    on QueryBuilder<VideoFilter, VideoFilter, QFilterCondition> {}

extension VideoFilterQuerySortBy
    on QueryBuilder<VideoFilter, VideoFilter, QSortBy> {
  QueryBuilder<VideoFilter, VideoFilter, QAfterSortBy> sortByChannelId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'channelId', Sort.asc);
    });
  }

  QueryBuilder<VideoFilter, VideoFilter, QAfterSortBy> sortByChannelIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'channelId', Sort.desc);
    });
  }

  QueryBuilder<VideoFilter, VideoFilter, QAfterSortBy> sortByDbOperation() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dbOperation', Sort.asc);
    });
  }

  QueryBuilder<VideoFilter, VideoFilter, QAfterSortBy> sortByDbOperationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dbOperation', Sort.desc);
    });
  }

  QueryBuilder<VideoFilter, VideoFilter, QAfterSortBy> sortByDbType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dbType', Sort.asc);
    });
  }

  QueryBuilder<VideoFilter, VideoFilter, QAfterSortBy> sortByDbTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dbType', Sort.desc);
    });
  }

  QueryBuilder<VideoFilter, VideoFilter, QAfterSortBy> sortByEndTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endTime', Sort.asc);
    });
  }

  QueryBuilder<VideoFilter, VideoFilter, QAfterSortBy> sortByEndTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endTime', Sort.desc);
    });
  }

  QueryBuilder<VideoFilter, VideoFilter, QAfterSortBy> sortByFilterAll() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'filterAll', Sort.asc);
    });
  }

  QueryBuilder<VideoFilter, VideoFilter, QAfterSortBy> sortByFilterAllDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'filterAll', Sort.desc);
    });
  }

  QueryBuilder<VideoFilter, VideoFilter, QAfterSortBy> sortByHideFromFeed() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hideFromFeed', Sort.asc);
    });
  }

  QueryBuilder<VideoFilter, VideoFilter, QAfterSortBy>
      sortByHideFromFeedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hideFromFeed', Sort.desc);
    });
  }

  QueryBuilder<VideoFilter, VideoFilter, QAfterSortBy> sortByStartTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startTime', Sort.asc);
    });
  }

  QueryBuilder<VideoFilter, VideoFilter, QAfterSortBy> sortByStartTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startTime', Sort.desc);
    });
  }

  QueryBuilder<VideoFilter, VideoFilter, QAfterSortBy> sortByValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'value', Sort.asc);
    });
  }

  QueryBuilder<VideoFilter, VideoFilter, QAfterSortBy> sortByValueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'value', Sort.desc);
    });
  }
}

extension VideoFilterQuerySortThenBy
    on QueryBuilder<VideoFilter, VideoFilter, QSortThenBy> {
  QueryBuilder<VideoFilter, VideoFilter, QAfterSortBy> thenByChannelId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'channelId', Sort.asc);
    });
  }

  QueryBuilder<VideoFilter, VideoFilter, QAfterSortBy> thenByChannelIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'channelId', Sort.desc);
    });
  }

  QueryBuilder<VideoFilter, VideoFilter, QAfterSortBy> thenByDbOperation() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dbOperation', Sort.asc);
    });
  }

  QueryBuilder<VideoFilter, VideoFilter, QAfterSortBy> thenByDbOperationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dbOperation', Sort.desc);
    });
  }

  QueryBuilder<VideoFilter, VideoFilter, QAfterSortBy> thenByDbType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dbType', Sort.asc);
    });
  }

  QueryBuilder<VideoFilter, VideoFilter, QAfterSortBy> thenByDbTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dbType', Sort.desc);
    });
  }

  QueryBuilder<VideoFilter, VideoFilter, QAfterSortBy> thenByEndTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endTime', Sort.asc);
    });
  }

  QueryBuilder<VideoFilter, VideoFilter, QAfterSortBy> thenByEndTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endTime', Sort.desc);
    });
  }

  QueryBuilder<VideoFilter, VideoFilter, QAfterSortBy> thenByFilterAll() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'filterAll', Sort.asc);
    });
  }

  QueryBuilder<VideoFilter, VideoFilter, QAfterSortBy> thenByFilterAllDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'filterAll', Sort.desc);
    });
  }

  QueryBuilder<VideoFilter, VideoFilter, QAfterSortBy> thenByHideFromFeed() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hideFromFeed', Sort.asc);
    });
  }

  QueryBuilder<VideoFilter, VideoFilter, QAfterSortBy>
      thenByHideFromFeedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hideFromFeed', Sort.desc);
    });
  }

  QueryBuilder<VideoFilter, VideoFilter, QAfterSortBy> thenByIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.asc);
    });
  }

  QueryBuilder<VideoFilter, VideoFilter, QAfterSortBy> thenByIsarIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.desc);
    });
  }

  QueryBuilder<VideoFilter, VideoFilter, QAfterSortBy> thenByStartTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startTime', Sort.asc);
    });
  }

  QueryBuilder<VideoFilter, VideoFilter, QAfterSortBy> thenByStartTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startTime', Sort.desc);
    });
  }

  QueryBuilder<VideoFilter, VideoFilter, QAfterSortBy> thenByValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'value', Sort.asc);
    });
  }

  QueryBuilder<VideoFilter, VideoFilter, QAfterSortBy> thenByValueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'value', Sort.desc);
    });
  }
}

extension VideoFilterQueryWhereDistinct
    on QueryBuilder<VideoFilter, VideoFilter, QDistinct> {
  QueryBuilder<VideoFilter, VideoFilter, QDistinct> distinctByChannelId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'channelId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VideoFilter, VideoFilter, QDistinct> distinctByDaysOfWeek() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'daysOfWeek');
    });
  }

  QueryBuilder<VideoFilter, VideoFilter, QDistinct> distinctByDbOperation(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dbOperation', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VideoFilter, VideoFilter, QDistinct> distinctByDbType(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dbType', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VideoFilter, VideoFilter, QDistinct> distinctByEndTime(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'endTime', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VideoFilter, VideoFilter, QDistinct> distinctByFilterAll() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'filterAll');
    });
  }

  QueryBuilder<VideoFilter, VideoFilter, QDistinct> distinctByHideFromFeed() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hideFromFeed');
    });
  }

  QueryBuilder<VideoFilter, VideoFilter, QDistinct> distinctByStartTime(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'startTime', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VideoFilter, VideoFilter, QDistinct> distinctByValue(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'value', caseSensitive: caseSensitive);
    });
  }
}

extension VideoFilterQueryProperty
    on QueryBuilder<VideoFilter, VideoFilter, QQueryProperty> {
  QueryBuilder<VideoFilter, int, QQueryOperations> isarIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isarId');
    });
  }

  QueryBuilder<VideoFilter, String?, QQueryOperations> channelIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'channelId');
    });
  }

  QueryBuilder<VideoFilter, List<int>, QQueryOperations> daysOfWeekProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'daysOfWeek');
    });
  }

  QueryBuilder<VideoFilter, String?, QQueryOperations> dbOperationProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dbOperation');
    });
  }

  QueryBuilder<VideoFilter, String?, QQueryOperations> dbTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dbType');
    });
  }

  QueryBuilder<VideoFilter, String, QQueryOperations> endTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'endTime');
    });
  }

  QueryBuilder<VideoFilter, bool, QQueryOperations> filterAllProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'filterAll');
    });
  }

  QueryBuilder<VideoFilter, bool, QQueryOperations> hideFromFeedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hideFromFeed');
    });
  }

  QueryBuilder<VideoFilter, String, QQueryOperations> startTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'startTime');
    });
  }

  QueryBuilder<VideoFilter, String?, QQueryOperations> valueProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'value');
    });
  }
}
