// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscription_notifications.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetSubscriptionNotificationCollection on Isar {
  IsarCollection<SubscriptionNotification> get subscriptionNotifications =>
      this.collection();
}

const SubscriptionNotificationSchema = CollectionSchema(
  name: r'SubscriptionNotification',
  id: -8386207581654568727,
  properties: {
    r'lastSeenVideoId': PropertySchema(
      id: 0,
      name: r'lastSeenVideoId',
      type: IsarType.string,
    ),
    r'timestamp': PropertySchema(
      id: 1,
      name: r'timestamp',
      type: IsarType.long,
    )
  },
  estimateSize: _subscriptionNotificationEstimateSize,
  serialize: _subscriptionNotificationSerialize,
  deserialize: _subscriptionNotificationDeserialize,
  deserializeProp: _subscriptionNotificationDeserializeProp,
  idName: r'isarId',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _subscriptionNotificationGetId,
  getLinks: _subscriptionNotificationGetLinks,
  attach: _subscriptionNotificationAttach,
  version: '3.1.0+1',
);

int _subscriptionNotificationEstimateSize(
  SubscriptionNotification object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.lastSeenVideoId.length * 3;
  return bytesCount;
}

void _subscriptionNotificationSerialize(
  SubscriptionNotification object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.lastSeenVideoId);
  writer.writeLong(offsets[1], object.timestamp);
}

SubscriptionNotification _subscriptionNotificationDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = SubscriptionNotification(
    reader.readString(offsets[0]),
    reader.readLong(offsets[1]),
  );
  object.isarId = id;
  return object;
}

P _subscriptionNotificationDeserializeProp<P>(
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

Id _subscriptionNotificationGetId(SubscriptionNotification object) {
  return object.isarId;
}

List<IsarLinkBase<dynamic>> _subscriptionNotificationGetLinks(
    SubscriptionNotification object) {
  return [];
}

void _subscriptionNotificationAttach(
    IsarCollection<dynamic> col, Id id, SubscriptionNotification object) {
  object.isarId = id;
}

extension SubscriptionNotificationQueryWhereSort on QueryBuilder<
    SubscriptionNotification, SubscriptionNotification, QWhere> {
  QueryBuilder<SubscriptionNotification, SubscriptionNotification, QAfterWhere>
      anyIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension SubscriptionNotificationQueryWhere on QueryBuilder<
    SubscriptionNotification, SubscriptionNotification, QWhereClause> {
  QueryBuilder<SubscriptionNotification, SubscriptionNotification,
      QAfterWhereClause> isarIdEqualTo(Id isarId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: isarId,
        upper: isarId,
      ));
    });
  }

  QueryBuilder<SubscriptionNotification, SubscriptionNotification,
      QAfterWhereClause> isarIdNotEqualTo(Id isarId) {
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

  QueryBuilder<SubscriptionNotification, SubscriptionNotification,
      QAfterWhereClause> isarIdGreaterThan(Id isarId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: isarId, includeLower: include),
      );
    });
  }

  QueryBuilder<SubscriptionNotification, SubscriptionNotification,
      QAfterWhereClause> isarIdLessThan(Id isarId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: isarId, includeUpper: include),
      );
    });
  }

  QueryBuilder<SubscriptionNotification, SubscriptionNotification,
      QAfterWhereClause> isarIdBetween(
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

extension SubscriptionNotificationQueryFilter on QueryBuilder<
    SubscriptionNotification, SubscriptionNotification, QFilterCondition> {
  QueryBuilder<SubscriptionNotification, SubscriptionNotification,
      QAfterFilterCondition> isarIdEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<SubscriptionNotification, SubscriptionNotification,
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

  QueryBuilder<SubscriptionNotification, SubscriptionNotification,
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

  QueryBuilder<SubscriptionNotification, SubscriptionNotification,
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

  QueryBuilder<SubscriptionNotification, SubscriptionNotification,
      QAfterFilterCondition> lastSeenVideoIdEqualTo(
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

  QueryBuilder<SubscriptionNotification, SubscriptionNotification,
      QAfterFilterCondition> lastSeenVideoIdGreaterThan(
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

  QueryBuilder<SubscriptionNotification, SubscriptionNotification,
      QAfterFilterCondition> lastSeenVideoIdLessThan(
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

  QueryBuilder<SubscriptionNotification, SubscriptionNotification,
      QAfterFilterCondition> lastSeenVideoIdBetween(
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

  QueryBuilder<SubscriptionNotification, SubscriptionNotification,
      QAfterFilterCondition> lastSeenVideoIdStartsWith(
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

  QueryBuilder<SubscriptionNotification, SubscriptionNotification,
      QAfterFilterCondition> lastSeenVideoIdEndsWith(
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

  QueryBuilder<SubscriptionNotification, SubscriptionNotification,
          QAfterFilterCondition>
      lastSeenVideoIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'lastSeenVideoId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SubscriptionNotification, SubscriptionNotification,
          QAfterFilterCondition>
      lastSeenVideoIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'lastSeenVideoId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SubscriptionNotification, SubscriptionNotification,
      QAfterFilterCondition> lastSeenVideoIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastSeenVideoId',
        value: '',
      ));
    });
  }

  QueryBuilder<SubscriptionNotification, SubscriptionNotification,
      QAfterFilterCondition> lastSeenVideoIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'lastSeenVideoId',
        value: '',
      ));
    });
  }

  QueryBuilder<SubscriptionNotification, SubscriptionNotification,
      QAfterFilterCondition> timestampEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'timestamp',
        value: value,
      ));
    });
  }

  QueryBuilder<SubscriptionNotification, SubscriptionNotification,
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

  QueryBuilder<SubscriptionNotification, SubscriptionNotification,
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

  QueryBuilder<SubscriptionNotification, SubscriptionNotification,
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

extension SubscriptionNotificationQueryObject on QueryBuilder<
    SubscriptionNotification, SubscriptionNotification, QFilterCondition> {}

extension SubscriptionNotificationQueryLinks on QueryBuilder<
    SubscriptionNotification, SubscriptionNotification, QFilterCondition> {}

extension SubscriptionNotificationQuerySortBy on QueryBuilder<
    SubscriptionNotification, SubscriptionNotification, QSortBy> {
  QueryBuilder<SubscriptionNotification, SubscriptionNotification, QAfterSortBy>
      sortByLastSeenVideoId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSeenVideoId', Sort.asc);
    });
  }

  QueryBuilder<SubscriptionNotification, SubscriptionNotification, QAfterSortBy>
      sortByLastSeenVideoIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSeenVideoId', Sort.desc);
    });
  }

  QueryBuilder<SubscriptionNotification, SubscriptionNotification, QAfterSortBy>
      sortByTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timestamp', Sort.asc);
    });
  }

  QueryBuilder<SubscriptionNotification, SubscriptionNotification, QAfterSortBy>
      sortByTimestampDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timestamp', Sort.desc);
    });
  }
}

extension SubscriptionNotificationQuerySortThenBy on QueryBuilder<
    SubscriptionNotification, SubscriptionNotification, QSortThenBy> {
  QueryBuilder<SubscriptionNotification, SubscriptionNotification, QAfterSortBy>
      thenByIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.asc);
    });
  }

  QueryBuilder<SubscriptionNotification, SubscriptionNotification, QAfterSortBy>
      thenByIsarIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.desc);
    });
  }

  QueryBuilder<SubscriptionNotification, SubscriptionNotification, QAfterSortBy>
      thenByLastSeenVideoId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSeenVideoId', Sort.asc);
    });
  }

  QueryBuilder<SubscriptionNotification, SubscriptionNotification, QAfterSortBy>
      thenByLastSeenVideoIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSeenVideoId', Sort.desc);
    });
  }

  QueryBuilder<SubscriptionNotification, SubscriptionNotification, QAfterSortBy>
      thenByTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timestamp', Sort.asc);
    });
  }

  QueryBuilder<SubscriptionNotification, SubscriptionNotification, QAfterSortBy>
      thenByTimestampDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timestamp', Sort.desc);
    });
  }
}

extension SubscriptionNotificationQueryWhereDistinct on QueryBuilder<
    SubscriptionNotification, SubscriptionNotification, QDistinct> {
  QueryBuilder<SubscriptionNotification, SubscriptionNotification, QDistinct>
      distinctByLastSeenVideoId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastSeenVideoId',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SubscriptionNotification, SubscriptionNotification, QDistinct>
      distinctByTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'timestamp');
    });
  }
}

extension SubscriptionNotificationQueryProperty on QueryBuilder<
    SubscriptionNotification, SubscriptionNotification, QQueryProperty> {
  QueryBuilder<SubscriptionNotification, int, QQueryOperations>
      isarIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isarId');
    });
  }

  QueryBuilder<SubscriptionNotification, String, QQueryOperations>
      lastSeenVideoIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastSeenVideoId');
    });
  }

  QueryBuilder<SubscriptionNotification, int, QQueryOperations>
      timestampProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'timestamp');
    });
  }
}
