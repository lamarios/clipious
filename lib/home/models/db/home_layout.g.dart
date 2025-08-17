// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_layout.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$HomeLayoutCWProxy {
  HomeLayout smallSources(List<HomeDataSource> smallSources);

  HomeLayout bigSource(HomeDataSource bigSource);

  HomeLayout showBigSource(bool showBigSource);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `HomeLayout(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// HomeLayout(...).copyWith(id: 12, name: "My name")
  /// ```
  HomeLayout call({
    List<HomeDataSource> smallSources,
    HomeDataSource bigSource,
    bool showBigSource,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfHomeLayout.copyWith(...)` or call `instanceOfHomeLayout.copyWith.fieldName(value)` for a single field.
class _$HomeLayoutCWProxyImpl implements _$HomeLayoutCWProxy {
  const _$HomeLayoutCWProxyImpl(this._value);

  final HomeLayout _value;

  @override
  HomeLayout smallSources(List<HomeDataSource> smallSources) =>
      call(smallSources: smallSources);

  @override
  HomeLayout bigSource(HomeDataSource bigSource) => call(bigSource: bigSource);

  @override
  HomeLayout showBigSource(bool showBigSource) =>
      call(showBigSource: showBigSource);

  @override

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `HomeLayout(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// HomeLayout(...).copyWith(id: 12, name: "My name")
  /// ```
  HomeLayout call({
    Object? smallSources = const $CopyWithPlaceholder(),
    Object? bigSource = const $CopyWithPlaceholder(),
    Object? showBigSource = const $CopyWithPlaceholder(),
  }) {
    return HomeLayout._(
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
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfHomeLayout.copyWith(...)` or `instanceOfHomeLayout.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$HomeLayoutCWProxy get copyWith => _$HomeLayoutCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeLayout _$HomeLayoutFromJson(Map<String, dynamic> json) => HomeLayout()
  ..showBigSource = json['showBigSource'] as bool
  ..dbBigSource = json['dbBigSource'] as String
  ..dbSmallSources = (json['dbSmallSources'] as List<dynamic>)
      .map((e) => e as String)
      .toList();

Map<String, dynamic> _$HomeLayoutToJson(HomeLayout instance) =>
    <String, dynamic>{
      'showBigSource': instance.showBigSource,
      'dbBigSource': instance.dbBigSource,
      'dbSmallSources': instance.dbSmallSources,
    };
