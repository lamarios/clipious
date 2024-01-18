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
// JsonSerializableGenerator
// **************************************************************************

VideoFilter _$VideoFilterFromJson(Map<String, dynamic> json) => VideoFilter(
      value: json['value'] as String?,
      channelId: json['channelId'] as String?,
    )
      ..operation =
          $enumDecodeNullable(_$FilterOperationEnumMap, json['operation'])
      ..type = $enumDecodeNullable(_$FilterTypeEnumMap, json['type'])
      ..filterAll = json['filterAll'] as bool
      ..hideFromFeed = json['hideFromFeed'] as bool
      ..dbType = json['dbType'] as String?
      ..daysOfWeek =
          (json['daysOfWeek'] as List<dynamic>).map((e) => e as int).toList()
      ..startTime = json['startTime'] as String
      ..endTime = json['endTime'] as String
      ..dbOperation = json['dbOperation'] as String?;

Map<String, dynamic> _$VideoFilterToJson(VideoFilter instance) =>
    <String, dynamic>{
      'channelId': instance.channelId,
      'operation': _$FilterOperationEnumMap[instance.operation],
      'type': _$FilterTypeEnumMap[instance.type],
      'value': instance.value,
      'filterAll': instance.filterAll,
      'hideFromFeed': instance.hideFromFeed,
      'dbType': instance.dbType,
      'daysOfWeek': instance.daysOfWeek,
      'startTime': instance.startTime,
      'endTime': instance.endTime,
      'dbOperation': instance.dbOperation,
    };

const _$FilterOperationEnumMap = {
  FilterOperation.contain: 'contain',
  FilterOperation.notContain: 'notContain',
  FilterOperation.lowerThan: 'lowerThan',
  FilterOperation.higherThan: 'higherThan',
};

const _$FilterTypeEnumMap = {
  FilterType.title: 'title',
  FilterType.channelName: 'channelName',
  FilterType.length: 'length',
};
