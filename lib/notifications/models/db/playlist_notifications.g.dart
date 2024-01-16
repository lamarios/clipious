// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'playlist_notifications.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetPlaylistNotificationCollection on Isar {
  IsarCollection<PlaylistNotification> get playlistNotifications =>
      this.collection();
}

const PlaylistNotificationSchema = CollectionSchema(
  name: r'PlaylistNotification',
  id: 9162956911075177043,
  properties: {
    r'lastVideoCount': PropertySchema(
      id: 0,
      name: r'lastVideoCount',
      type: IsarType.long,
    ),
    r'playlistId': PropertySchema(
      id: 1,
      name: r'playlistId',
      type: IsarType.string,
    ),
    r'playlistName': PropertySchema(
      id: 2,
      name: r'playlistName',
      type: IsarType.string,
    ),
    r'timestamp': PropertySchema(
      id: 3,
      name: r'timestamp',
      type: IsarType.long,
    )
  },
  estimateSize: _playlistNotificationEstimateSize,
  serialize: _playlistNotificationSerialize,
  deserialize: _playlistNotificationDeserialize,
  deserializeProp: _playlistNotificationDeserializeProp,
  idName: r'isarId',
  indexes: {
    r'playlistId': IndexSchema(
      id: 7921918076105486368,
      name: r'playlistId',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'playlistId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _playlistNotificationGetId,
  getLinks: _playlistNotificationGetLinks,
  attach: _playlistNotificationAttach,
  version: '3.1.0+1',
);

int _playlistNotificationEstimateSize(
  PlaylistNotification object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.playlistId.length * 3;
  bytesCount += 3 + object.playlistName.length * 3;
  return bytesCount;
}

void _playlistNotificationSerialize(
  PlaylistNotification object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.lastVideoCount);
  writer.writeString(offsets[1], object.playlistId);
  writer.writeString(offsets[2], object.playlistName);
  writer.writeLong(offsets[3], object.timestamp);
}

PlaylistNotification _playlistNotificationDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = PlaylistNotification(
    reader.readString(offsets[1]),
    reader.readLong(offsets[0]),
    reader.readLong(offsets[3]),
    reader.readString(offsets[2]),
  );
  object.isarId = id;
  return object;
}

P _playlistNotificationDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _playlistNotificationGetId(PlaylistNotification object) {
  return object.isarId;
}

List<IsarLinkBase<dynamic>> _playlistNotificationGetLinks(
    PlaylistNotification object) {
  return [];
}

void _playlistNotificationAttach(
    IsarCollection<dynamic> col, Id id, PlaylistNotification object) {
  object.isarId = id;
}

extension PlaylistNotificationByIndex on IsarCollection<PlaylistNotification> {
  Future<PlaylistNotification?> getByPlaylistId(String playlistId) {
    return getByIndex(r'playlistId', [playlistId]);
  }

  PlaylistNotification? getByPlaylistIdSync(String playlistId) {
    return getByIndexSync(r'playlistId', [playlistId]);
  }

  Future<bool> deleteByPlaylistId(String playlistId) {
    return deleteByIndex(r'playlistId', [playlistId]);
  }

  bool deleteByPlaylistIdSync(String playlistId) {
    return deleteByIndexSync(r'playlistId', [playlistId]);
  }

  Future<List<PlaylistNotification?>> getAllByPlaylistId(
      List<String> playlistIdValues) {
    final values = playlistIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'playlistId', values);
  }

  List<PlaylistNotification?> getAllByPlaylistIdSync(
      List<String> playlistIdValues) {
    final values = playlistIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'playlistId', values);
  }

  Future<int> deleteAllByPlaylistId(List<String> playlistIdValues) {
    final values = playlistIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'playlistId', values);
  }

  int deleteAllByPlaylistIdSync(List<String> playlistIdValues) {
    final values = playlistIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'playlistId', values);
  }

  Future<Id> putByPlaylistId(PlaylistNotification object) {
    return putByIndex(r'playlistId', object);
  }

  Id putByPlaylistIdSync(PlaylistNotification object, {bool saveLinks = true}) {
    return putByIndexSync(r'playlistId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByPlaylistId(List<PlaylistNotification> objects) {
    return putAllByIndex(r'playlistId', objects);
  }

  List<Id> putAllByPlaylistIdSync(List<PlaylistNotification> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'playlistId', objects, saveLinks: saveLinks);
  }
}

extension PlaylistNotificationQueryWhereSort
    on QueryBuilder<PlaylistNotification, PlaylistNotification, QWhere> {
  QueryBuilder<PlaylistNotification, PlaylistNotification, QAfterWhere>
      anyIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension PlaylistNotificationQueryWhere
    on QueryBuilder<PlaylistNotification, PlaylistNotification, QWhereClause> {
  QueryBuilder<PlaylistNotification, PlaylistNotification, QAfterWhereClause>
      isarIdEqualTo(Id isarId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: isarId,
        upper: isarId,
      ));
    });
  }

  QueryBuilder<PlaylistNotification, PlaylistNotification, QAfterWhereClause>
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

  QueryBuilder<PlaylistNotification, PlaylistNotification, QAfterWhereClause>
      isarIdGreaterThan(Id isarId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: isarId, includeLower: include),
      );
    });
  }

  QueryBuilder<PlaylistNotification, PlaylistNotification, QAfterWhereClause>
      isarIdLessThan(Id isarId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: isarId, includeUpper: include),
      );
    });
  }

  QueryBuilder<PlaylistNotification, PlaylistNotification, QAfterWhereClause>
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

  QueryBuilder<PlaylistNotification, PlaylistNotification, QAfterWhereClause>
      playlistIdEqualTo(String playlistId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'playlistId',
        value: [playlistId],
      ));
    });
  }

  QueryBuilder<PlaylistNotification, PlaylistNotification, QAfterWhereClause>
      playlistIdNotEqualTo(String playlistId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'playlistId',
              lower: [],
              upper: [playlistId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'playlistId',
              lower: [playlistId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'playlistId',
              lower: [playlistId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'playlistId',
              lower: [],
              upper: [playlistId],
              includeUpper: false,
            ));
      }
    });
  }
}

extension PlaylistNotificationQueryFilter on QueryBuilder<PlaylistNotification,
    PlaylistNotification, QFilterCondition> {
  QueryBuilder<PlaylistNotification, PlaylistNotification,
      QAfterFilterCondition> isarIdEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<PlaylistNotification, PlaylistNotification,
      QAfterFilterCondition> isarIdGreaterThan(
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

  QueryBuilder<PlaylistNotification, PlaylistNotification,
      QAfterFilterCondition> isarIdLessThan(
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

  QueryBuilder<PlaylistNotification, PlaylistNotification,
      QAfterFilterCondition> isarIdBetween(
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

  QueryBuilder<PlaylistNotification, PlaylistNotification,
      QAfterFilterCondition> lastVideoCountEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastVideoCount',
        value: value,
      ));
    });
  }

  QueryBuilder<PlaylistNotification, PlaylistNotification,
      QAfterFilterCondition> lastVideoCountGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastVideoCount',
        value: value,
      ));
    });
  }

  QueryBuilder<PlaylistNotification, PlaylistNotification,
      QAfterFilterCondition> lastVideoCountLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastVideoCount',
        value: value,
      ));
    });
  }

  QueryBuilder<PlaylistNotification, PlaylistNotification,
      QAfterFilterCondition> lastVideoCountBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastVideoCount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PlaylistNotification, PlaylistNotification,
      QAfterFilterCondition> playlistIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'playlistId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlaylistNotification, PlaylistNotification,
      QAfterFilterCondition> playlistIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'playlistId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlaylistNotification, PlaylistNotification,
      QAfterFilterCondition> playlistIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'playlistId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlaylistNotification, PlaylistNotification,
      QAfterFilterCondition> playlistIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'playlistId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlaylistNotification, PlaylistNotification,
      QAfterFilterCondition> playlistIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'playlistId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlaylistNotification, PlaylistNotification,
      QAfterFilterCondition> playlistIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'playlistId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlaylistNotification, PlaylistNotification,
          QAfterFilterCondition>
      playlistIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'playlistId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlaylistNotification, PlaylistNotification,
          QAfterFilterCondition>
      playlistIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'playlistId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlaylistNotification, PlaylistNotification,
      QAfterFilterCondition> playlistIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'playlistId',
        value: '',
      ));
    });
  }

  QueryBuilder<PlaylistNotification, PlaylistNotification,
      QAfterFilterCondition> playlistIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'playlistId',
        value: '',
      ));
    });
  }

  QueryBuilder<PlaylistNotification, PlaylistNotification,
      QAfterFilterCondition> playlistNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'playlistName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlaylistNotification, PlaylistNotification,
      QAfterFilterCondition> playlistNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'playlistName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlaylistNotification, PlaylistNotification,
      QAfterFilterCondition> playlistNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'playlistName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlaylistNotification, PlaylistNotification,
      QAfterFilterCondition> playlistNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'playlistName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlaylistNotification, PlaylistNotification,
      QAfterFilterCondition> playlistNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'playlistName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlaylistNotification, PlaylistNotification,
      QAfterFilterCondition> playlistNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'playlistName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlaylistNotification, PlaylistNotification,
          QAfterFilterCondition>
      playlistNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'playlistName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlaylistNotification, PlaylistNotification,
          QAfterFilterCondition>
      playlistNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'playlistName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlaylistNotification, PlaylistNotification,
      QAfterFilterCondition> playlistNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'playlistName',
        value: '',
      ));
    });
  }

  QueryBuilder<PlaylistNotification, PlaylistNotification,
      QAfterFilterCondition> playlistNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'playlistName',
        value: '',
      ));
    });
  }

  QueryBuilder<PlaylistNotification, PlaylistNotification,
      QAfterFilterCondition> timestampEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'timestamp',
        value: value,
      ));
    });
  }

  QueryBuilder<PlaylistNotification, PlaylistNotification,
      QAfterFilterCondition> timestampGreaterThan(
    int value, {
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

  QueryBuilder<PlaylistNotification, PlaylistNotification,
      QAfterFilterCondition> timestampLessThan(
    int value, {
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

  QueryBuilder<PlaylistNotification, PlaylistNotification,
      QAfterFilterCondition> timestampBetween(
    int lower,
    int upper, {
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

extension PlaylistNotificationQueryObject on QueryBuilder<PlaylistNotification,
    PlaylistNotification, QFilterCondition> {}

extension PlaylistNotificationQueryLinks on QueryBuilder<PlaylistNotification,
    PlaylistNotification, QFilterCondition> {}

extension PlaylistNotificationQuerySortBy
    on QueryBuilder<PlaylistNotification, PlaylistNotification, QSortBy> {
  QueryBuilder<PlaylistNotification, PlaylistNotification, QAfterSortBy>
      sortByLastVideoCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastVideoCount', Sort.asc);
    });
  }

  QueryBuilder<PlaylistNotification, PlaylistNotification, QAfterSortBy>
      sortByLastVideoCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastVideoCount', Sort.desc);
    });
  }

  QueryBuilder<PlaylistNotification, PlaylistNotification, QAfterSortBy>
      sortByPlaylistId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'playlistId', Sort.asc);
    });
  }

  QueryBuilder<PlaylistNotification, PlaylistNotification, QAfterSortBy>
      sortByPlaylistIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'playlistId', Sort.desc);
    });
  }

  QueryBuilder<PlaylistNotification, PlaylistNotification, QAfterSortBy>
      sortByPlaylistName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'playlistName', Sort.asc);
    });
  }

  QueryBuilder<PlaylistNotification, PlaylistNotification, QAfterSortBy>
      sortByPlaylistNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'playlistName', Sort.desc);
    });
  }

  QueryBuilder<PlaylistNotification, PlaylistNotification, QAfterSortBy>
      sortByTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timestamp', Sort.asc);
    });
  }

  QueryBuilder<PlaylistNotification, PlaylistNotification, QAfterSortBy>
      sortByTimestampDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timestamp', Sort.desc);
    });
  }
}

extension PlaylistNotificationQuerySortThenBy
    on QueryBuilder<PlaylistNotification, PlaylistNotification, QSortThenBy> {
  QueryBuilder<PlaylistNotification, PlaylistNotification, QAfterSortBy>
      thenByIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.asc);
    });
  }

  QueryBuilder<PlaylistNotification, PlaylistNotification, QAfterSortBy>
      thenByIsarIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.desc);
    });
  }

  QueryBuilder<PlaylistNotification, PlaylistNotification, QAfterSortBy>
      thenByLastVideoCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastVideoCount', Sort.asc);
    });
  }

  QueryBuilder<PlaylistNotification, PlaylistNotification, QAfterSortBy>
      thenByLastVideoCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastVideoCount', Sort.desc);
    });
  }

  QueryBuilder<PlaylistNotification, PlaylistNotification, QAfterSortBy>
      thenByPlaylistId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'playlistId', Sort.asc);
    });
  }

  QueryBuilder<PlaylistNotification, PlaylistNotification, QAfterSortBy>
      thenByPlaylistIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'playlistId', Sort.desc);
    });
  }

  QueryBuilder<PlaylistNotification, PlaylistNotification, QAfterSortBy>
      thenByPlaylistName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'playlistName', Sort.asc);
    });
  }

  QueryBuilder<PlaylistNotification, PlaylistNotification, QAfterSortBy>
      thenByPlaylistNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'playlistName', Sort.desc);
    });
  }

  QueryBuilder<PlaylistNotification, PlaylistNotification, QAfterSortBy>
      thenByTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timestamp', Sort.asc);
    });
  }

  QueryBuilder<PlaylistNotification, PlaylistNotification, QAfterSortBy>
      thenByTimestampDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timestamp', Sort.desc);
    });
  }
}

extension PlaylistNotificationQueryWhereDistinct
    on QueryBuilder<PlaylistNotification, PlaylistNotification, QDistinct> {
  QueryBuilder<PlaylistNotification, PlaylistNotification, QDistinct>
      distinctByLastVideoCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastVideoCount');
    });
  }

  QueryBuilder<PlaylistNotification, PlaylistNotification, QDistinct>
      distinctByPlaylistId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'playlistId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PlaylistNotification, PlaylistNotification, QDistinct>
      distinctByPlaylistName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'playlistName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PlaylistNotification, PlaylistNotification, QDistinct>
      distinctByTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'timestamp');
    });
  }
}

extension PlaylistNotificationQueryProperty on QueryBuilder<
    PlaylistNotification, PlaylistNotification, QQueryProperty> {
  QueryBuilder<PlaylistNotification, int, QQueryOperations> isarIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isarId');
    });
  }

  QueryBuilder<PlaylistNotification, int, QQueryOperations>
      lastVideoCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastVideoCount');
    });
  }

  QueryBuilder<PlaylistNotification, String, QQueryOperations>
      playlistIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'playlistId');
    });
  }

  QueryBuilder<PlaylistNotification, String, QQueryOperations>
      playlistNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'playlistName');
    });
  }

  QueryBuilder<PlaylistNotification, int, QQueryOperations>
      timestampProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'timestamp');
    });
  }
}
