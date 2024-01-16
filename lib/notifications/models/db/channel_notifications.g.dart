// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'channel_notifications.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetChannelNotificationCollection on Isar {
  IsarCollection<ChannelNotification> get channelNotifications =>
      this.collection();
}

const ChannelNotificationSchema = CollectionSchema(
  name: r'ChannelNotification',
  id: -4524772613035818734,
  properties: {
    r'channelId': PropertySchema(
      id: 0,
      name: r'channelId',
      type: IsarType.string,
    ),
    r'channelName': PropertySchema(
      id: 1,
      name: r'channelName',
      type: IsarType.string,
    ),
    r'lastSeenVideoId': PropertySchema(
      id: 2,
      name: r'lastSeenVideoId',
      type: IsarType.string,
    ),
    r'timestamp': PropertySchema(
      id: 3,
      name: r'timestamp',
      type: IsarType.long,
    )
  },
  estimateSize: _channelNotificationEstimateSize,
  serialize: _channelNotificationSerialize,
  deserialize: _channelNotificationDeserialize,
  deserializeProp: _channelNotificationDeserializeProp,
  idName: r'isarId',
  indexes: {
    r'channelId': IndexSchema(
      id: -8352446570702114471,
      name: r'channelId',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'channelId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _channelNotificationGetId,
  getLinks: _channelNotificationGetLinks,
  attach: _channelNotificationAttach,
  version: '3.1.0+1',
);

int _channelNotificationEstimateSize(
  ChannelNotification object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.channelId.length * 3;
  bytesCount += 3 + object.channelName.length * 3;
  bytesCount += 3 + object.lastSeenVideoId.length * 3;
  return bytesCount;
}

void _channelNotificationSerialize(
  ChannelNotification object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.channelId);
  writer.writeString(offsets[1], object.channelName);
  writer.writeString(offsets[2], object.lastSeenVideoId);
  writer.writeLong(offsets[3], object.timestamp);
}

ChannelNotification _channelNotificationDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ChannelNotification(
    reader.readString(offsets[0]),
    reader.readString(offsets[1]),
    reader.readString(offsets[2]),
    reader.readLong(offsets[3]),
  );
  object.isarId = id;
  return object;
}

P _channelNotificationDeserializeProp<P>(
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
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _channelNotificationGetId(ChannelNotification object) {
  return object.isarId;
}

List<IsarLinkBase<dynamic>> _channelNotificationGetLinks(
    ChannelNotification object) {
  return [];
}

void _channelNotificationAttach(
    IsarCollection<dynamic> col, Id id, ChannelNotification object) {
  object.isarId = id;
}

extension ChannelNotificationByIndex on IsarCollection<ChannelNotification> {
  Future<ChannelNotification?> getByChannelId(String channelId) {
    return getByIndex(r'channelId', [channelId]);
  }

  ChannelNotification? getByChannelIdSync(String channelId) {
    return getByIndexSync(r'channelId', [channelId]);
  }

  Future<bool> deleteByChannelId(String channelId) {
    return deleteByIndex(r'channelId', [channelId]);
  }

  bool deleteByChannelIdSync(String channelId) {
    return deleteByIndexSync(r'channelId', [channelId]);
  }

  Future<List<ChannelNotification?>> getAllByChannelId(
      List<String> channelIdValues) {
    final values = channelIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'channelId', values);
  }

  List<ChannelNotification?> getAllByChannelIdSync(
      List<String> channelIdValues) {
    final values = channelIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'channelId', values);
  }

  Future<int> deleteAllByChannelId(List<String> channelIdValues) {
    final values = channelIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'channelId', values);
  }

  int deleteAllByChannelIdSync(List<String> channelIdValues) {
    final values = channelIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'channelId', values);
  }

  Future<Id> putByChannelId(ChannelNotification object) {
    return putByIndex(r'channelId', object);
  }

  Id putByChannelIdSync(ChannelNotification object, {bool saveLinks = true}) {
    return putByIndexSync(r'channelId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByChannelId(List<ChannelNotification> objects) {
    return putAllByIndex(r'channelId', objects);
  }

  List<Id> putAllByChannelIdSync(List<ChannelNotification> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'channelId', objects, saveLinks: saveLinks);
  }
}

extension ChannelNotificationQueryWhereSort
    on QueryBuilder<ChannelNotification, ChannelNotification, QWhere> {
  QueryBuilder<ChannelNotification, ChannelNotification, QAfterWhere>
      anyIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ChannelNotificationQueryWhere
    on QueryBuilder<ChannelNotification, ChannelNotification, QWhereClause> {
  QueryBuilder<ChannelNotification, ChannelNotification, QAfterWhereClause>
      isarIdEqualTo(Id isarId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: isarId,
        upper: isarId,
      ));
    });
  }

  QueryBuilder<ChannelNotification, ChannelNotification, QAfterWhereClause>
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

  QueryBuilder<ChannelNotification, ChannelNotification, QAfterWhereClause>
      isarIdGreaterThan(Id isarId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: isarId, includeLower: include),
      );
    });
  }

  QueryBuilder<ChannelNotification, ChannelNotification, QAfterWhereClause>
      isarIdLessThan(Id isarId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: isarId, includeUpper: include),
      );
    });
  }

  QueryBuilder<ChannelNotification, ChannelNotification, QAfterWhereClause>
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

  QueryBuilder<ChannelNotification, ChannelNotification, QAfterWhereClause>
      channelIdEqualTo(String channelId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'channelId',
        value: [channelId],
      ));
    });
  }

  QueryBuilder<ChannelNotification, ChannelNotification, QAfterWhereClause>
      channelIdNotEqualTo(String channelId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'channelId',
              lower: [],
              upper: [channelId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'channelId',
              lower: [channelId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'channelId',
              lower: [channelId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'channelId',
              lower: [],
              upper: [channelId],
              includeUpper: false,
            ));
      }
    });
  }
}

extension ChannelNotificationQueryFilter on QueryBuilder<ChannelNotification,
    ChannelNotification, QFilterCondition> {
  QueryBuilder<ChannelNotification, ChannelNotification, QAfterFilterCondition>
      channelIdEqualTo(
    String value, {
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

  QueryBuilder<ChannelNotification, ChannelNotification, QAfterFilterCondition>
      channelIdGreaterThan(
    String value, {
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

  QueryBuilder<ChannelNotification, ChannelNotification, QAfterFilterCondition>
      channelIdLessThan(
    String value, {
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

  QueryBuilder<ChannelNotification, ChannelNotification, QAfterFilterCondition>
      channelIdBetween(
    String lower,
    String upper, {
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

  QueryBuilder<ChannelNotification, ChannelNotification, QAfterFilterCondition>
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

  QueryBuilder<ChannelNotification, ChannelNotification, QAfterFilterCondition>
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

  QueryBuilder<ChannelNotification, ChannelNotification, QAfterFilterCondition>
      channelIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'channelId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChannelNotification, ChannelNotification, QAfterFilterCondition>
      channelIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'channelId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChannelNotification, ChannelNotification, QAfterFilterCondition>
      channelIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'channelId',
        value: '',
      ));
    });
  }

  QueryBuilder<ChannelNotification, ChannelNotification, QAfterFilterCondition>
      channelIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'channelId',
        value: '',
      ));
    });
  }

  QueryBuilder<ChannelNotification, ChannelNotification, QAfterFilterCondition>
      channelNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'channelName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChannelNotification, ChannelNotification, QAfterFilterCondition>
      channelNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'channelName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChannelNotification, ChannelNotification, QAfterFilterCondition>
      channelNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'channelName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChannelNotification, ChannelNotification, QAfterFilterCondition>
      channelNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'channelName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChannelNotification, ChannelNotification, QAfterFilterCondition>
      channelNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'channelName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChannelNotification, ChannelNotification, QAfterFilterCondition>
      channelNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'channelName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChannelNotification, ChannelNotification, QAfterFilterCondition>
      channelNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'channelName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChannelNotification, ChannelNotification, QAfterFilterCondition>
      channelNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'channelName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChannelNotification, ChannelNotification, QAfterFilterCondition>
      channelNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'channelName',
        value: '',
      ));
    });
  }

  QueryBuilder<ChannelNotification, ChannelNotification, QAfterFilterCondition>
      channelNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'channelName',
        value: '',
      ));
    });
  }

  QueryBuilder<ChannelNotification, ChannelNotification, QAfterFilterCondition>
      isarIdEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<ChannelNotification, ChannelNotification, QAfterFilterCondition>
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

  QueryBuilder<ChannelNotification, ChannelNotification, QAfterFilterCondition>
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

  QueryBuilder<ChannelNotification, ChannelNotification, QAfterFilterCondition>
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

  QueryBuilder<ChannelNotification, ChannelNotification, QAfterFilterCondition>
      lastSeenVideoIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastSeenVideoId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChannelNotification, ChannelNotification, QAfterFilterCondition>
      lastSeenVideoIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastSeenVideoId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChannelNotification, ChannelNotification, QAfterFilterCondition>
      lastSeenVideoIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastSeenVideoId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChannelNotification, ChannelNotification, QAfterFilterCondition>
      lastSeenVideoIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastSeenVideoId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChannelNotification, ChannelNotification, QAfterFilterCondition>
      lastSeenVideoIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'lastSeenVideoId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChannelNotification, ChannelNotification, QAfterFilterCondition>
      lastSeenVideoIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'lastSeenVideoId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChannelNotification, ChannelNotification, QAfterFilterCondition>
      lastSeenVideoIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'lastSeenVideoId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChannelNotification, ChannelNotification, QAfterFilterCondition>
      lastSeenVideoIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'lastSeenVideoId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChannelNotification, ChannelNotification, QAfterFilterCondition>
      lastSeenVideoIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastSeenVideoId',
        value: '',
      ));
    });
  }

  QueryBuilder<ChannelNotification, ChannelNotification, QAfterFilterCondition>
      lastSeenVideoIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'lastSeenVideoId',
        value: '',
      ));
    });
  }

  QueryBuilder<ChannelNotification, ChannelNotification, QAfterFilterCondition>
      timestampEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'timestamp',
        value: value,
      ));
    });
  }

  QueryBuilder<ChannelNotification, ChannelNotification, QAfterFilterCondition>
      timestampGreaterThan(
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

  QueryBuilder<ChannelNotification, ChannelNotification, QAfterFilterCondition>
      timestampLessThan(
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

  QueryBuilder<ChannelNotification, ChannelNotification, QAfterFilterCondition>
      timestampBetween(
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

extension ChannelNotificationQueryObject on QueryBuilder<ChannelNotification,
    ChannelNotification, QFilterCondition> {}

extension ChannelNotificationQueryLinks on QueryBuilder<ChannelNotification,
    ChannelNotification, QFilterCondition> {}

extension ChannelNotificationQuerySortBy
    on QueryBuilder<ChannelNotification, ChannelNotification, QSortBy> {
  QueryBuilder<ChannelNotification, ChannelNotification, QAfterSortBy>
      sortByChannelId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'channelId', Sort.asc);
    });
  }

  QueryBuilder<ChannelNotification, ChannelNotification, QAfterSortBy>
      sortByChannelIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'channelId', Sort.desc);
    });
  }

  QueryBuilder<ChannelNotification, ChannelNotification, QAfterSortBy>
      sortByChannelName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'channelName', Sort.asc);
    });
  }

  QueryBuilder<ChannelNotification, ChannelNotification, QAfterSortBy>
      sortByChannelNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'channelName', Sort.desc);
    });
  }

  QueryBuilder<ChannelNotification, ChannelNotification, QAfterSortBy>
      sortByLastSeenVideoId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSeenVideoId', Sort.asc);
    });
  }

  QueryBuilder<ChannelNotification, ChannelNotification, QAfterSortBy>
      sortByLastSeenVideoIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSeenVideoId', Sort.desc);
    });
  }

  QueryBuilder<ChannelNotification, ChannelNotification, QAfterSortBy>
      sortByTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timestamp', Sort.asc);
    });
  }

  QueryBuilder<ChannelNotification, ChannelNotification, QAfterSortBy>
      sortByTimestampDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timestamp', Sort.desc);
    });
  }
}

extension ChannelNotificationQuerySortThenBy
    on QueryBuilder<ChannelNotification, ChannelNotification, QSortThenBy> {
  QueryBuilder<ChannelNotification, ChannelNotification, QAfterSortBy>
      thenByChannelId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'channelId', Sort.asc);
    });
  }

  QueryBuilder<ChannelNotification, ChannelNotification, QAfterSortBy>
      thenByChannelIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'channelId', Sort.desc);
    });
  }

  QueryBuilder<ChannelNotification, ChannelNotification, QAfterSortBy>
      thenByChannelName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'channelName', Sort.asc);
    });
  }

  QueryBuilder<ChannelNotification, ChannelNotification, QAfterSortBy>
      thenByChannelNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'channelName', Sort.desc);
    });
  }

  QueryBuilder<ChannelNotification, ChannelNotification, QAfterSortBy>
      thenByIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.asc);
    });
  }

  QueryBuilder<ChannelNotification, ChannelNotification, QAfterSortBy>
      thenByIsarIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.desc);
    });
  }

  QueryBuilder<ChannelNotification, ChannelNotification, QAfterSortBy>
      thenByLastSeenVideoId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSeenVideoId', Sort.asc);
    });
  }

  QueryBuilder<ChannelNotification, ChannelNotification, QAfterSortBy>
      thenByLastSeenVideoIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSeenVideoId', Sort.desc);
    });
  }

  QueryBuilder<ChannelNotification, ChannelNotification, QAfterSortBy>
      thenByTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timestamp', Sort.asc);
    });
  }

  QueryBuilder<ChannelNotification, ChannelNotification, QAfterSortBy>
      thenByTimestampDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timestamp', Sort.desc);
    });
  }
}

extension ChannelNotificationQueryWhereDistinct
    on QueryBuilder<ChannelNotification, ChannelNotification, QDistinct> {
  QueryBuilder<ChannelNotification, ChannelNotification, QDistinct>
      distinctByChannelId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'channelId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ChannelNotification, ChannelNotification, QDistinct>
      distinctByChannelName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'channelName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ChannelNotification, ChannelNotification, QDistinct>
      distinctByLastSeenVideoId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastSeenVideoId',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ChannelNotification, ChannelNotification, QDistinct>
      distinctByTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'timestamp');
    });
  }
}

extension ChannelNotificationQueryProperty
    on QueryBuilder<ChannelNotification, ChannelNotification, QQueryProperty> {
  QueryBuilder<ChannelNotification, int, QQueryOperations> isarIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isarId');
    });
  }

  QueryBuilder<ChannelNotification, String, QQueryOperations>
      channelIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'channelId');
    });
  }

  QueryBuilder<ChannelNotification, String, QQueryOperations>
      channelNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'channelName');
    });
  }

  QueryBuilder<ChannelNotification, String, QQueryOperations>
      lastSeenVideoIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastSeenVideoId');
    });
  }

  QueryBuilder<ChannelNotification, int, QQueryOperations> timestampProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'timestamp');
    });
  }
}
