// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'downloaded_video.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetDownloadedVideoCollection on Isar {
  IsarCollection<DownloadedVideo> get downloadedVideos => this.collection();
}

const DownloadedVideoSchema = CollectionSchema(
  name: r'DownloadedVideo',
  id: 8637386188969575337,
  properties: {
    r'audioOnly': PropertySchema(
      id: 0,
      name: r'audioOnly',
      type: IsarType.bool,
    ),
    r'author': PropertySchema(
      id: 1,
      name: r'author',
      type: IsarType.string,
    ),
    r'authorUrl': PropertySchema(
      id: 2,
      name: r'authorUrl',
      type: IsarType.string,
    ),
    r'downloadComplete': PropertySchema(
      id: 3,
      name: r'downloadComplete',
      type: IsarType.bool,
    ),
    r'downloadFailed': PropertySchema(
      id: 4,
      name: r'downloadFailed',
      type: IsarType.bool,
    ),
    r'lengthSeconds': PropertySchema(
      id: 5,
      name: r'lengthSeconds',
      type: IsarType.long,
    ),
    r'quality': PropertySchema(
      id: 6,
      name: r'quality',
      type: IsarType.string,
    ),
    r'title': PropertySchema(
      id: 7,
      name: r'title',
      type: IsarType.string,
    ),
    r'videoId': PropertySchema(
      id: 8,
      name: r'videoId',
      type: IsarType.string,
    )
  },
  estimateSize: _downloadedVideoEstimateSize,
  serialize: _downloadedVideoSerialize,
  deserialize: _downloadedVideoDeserialize,
  deserializeProp: _downloadedVideoDeserializeProp,
  idName: r'isarId',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _downloadedVideoGetId,
  getLinks: _downloadedVideoGetLinks,
  attach: _downloadedVideoAttach,
  version: '3.1.0+1',
);

int _downloadedVideoEstimateSize(
  DownloadedVideo object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.author;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.authorUrl;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.quality.length * 3;
  bytesCount += 3 + object.title.length * 3;
  bytesCount += 3 + object.videoId.length * 3;
  return bytesCount;
}

void _downloadedVideoSerialize(
  DownloadedVideo object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeBool(offsets[0], object.audioOnly);
  writer.writeString(offsets[1], object.author);
  writer.writeString(offsets[2], object.authorUrl);
  writer.writeBool(offsets[3], object.downloadComplete);
  writer.writeBool(offsets[4], object.downloadFailed);
  writer.writeLong(offsets[5], object.lengthSeconds);
  writer.writeString(offsets[6], object.quality);
  writer.writeString(offsets[7], object.title);
  writer.writeString(offsets[8], object.videoId);
}

DownloadedVideo _downloadedVideoDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = DownloadedVideo(
    audioOnly: reader.readBoolOrNull(offsets[0]) ?? false,
    author: reader.readStringOrNull(offsets[1]),
    authorUrl: reader.readStringOrNull(offsets[2]),
    downloadComplete: reader.readBoolOrNull(offsets[3]) ?? false,
    downloadFailed: reader.readBoolOrNull(offsets[4]) ?? false,
    lengthSeconds: reader.readLongOrNull(offsets[5]) ?? 1,
    quality: reader.readStringOrNull(offsets[6]) ?? '720p',
    title: reader.readString(offsets[7]),
    videoId: reader.readString(offsets[8]),
  );
  object.isarId = id;
  return object;
}

P _downloadedVideoDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readBoolOrNull(offset) ?? false) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readBoolOrNull(offset) ?? false) as P;
    case 4:
      return (reader.readBoolOrNull(offset) ?? false) as P;
    case 5:
      return (reader.readLongOrNull(offset) ?? 1) as P;
    case 6:
      return (reader.readStringOrNull(offset) ?? '720p') as P;
    case 7:
      return (reader.readString(offset)) as P;
    case 8:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _downloadedVideoGetId(DownloadedVideo object) {
  return object.isarId;
}

List<IsarLinkBase<dynamic>> _downloadedVideoGetLinks(DownloadedVideo object) {
  return [];
}

void _downloadedVideoAttach(
    IsarCollection<dynamic> col, Id id, DownloadedVideo object) {
  object.isarId = id;
}

extension DownloadedVideoQueryWhereSort
    on QueryBuilder<DownloadedVideo, DownloadedVideo, QWhere> {
  QueryBuilder<DownloadedVideo, DownloadedVideo, QAfterWhere> anyIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension DownloadedVideoQueryWhere
    on QueryBuilder<DownloadedVideo, DownloadedVideo, QWhereClause> {
  QueryBuilder<DownloadedVideo, DownloadedVideo, QAfterWhereClause>
      isarIdEqualTo(Id isarId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: isarId,
        upper: isarId,
      ));
    });
  }

  QueryBuilder<DownloadedVideo, DownloadedVideo, QAfterWhereClause>
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

  QueryBuilder<DownloadedVideo, DownloadedVideo, QAfterWhereClause>
      isarIdGreaterThan(Id isarId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: isarId, includeLower: include),
      );
    });
  }

  QueryBuilder<DownloadedVideo, DownloadedVideo, QAfterWhereClause>
      isarIdLessThan(Id isarId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: isarId, includeUpper: include),
      );
    });
  }

  QueryBuilder<DownloadedVideo, DownloadedVideo, QAfterWhereClause>
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
}

extension DownloadedVideoQueryFilter
    on QueryBuilder<DownloadedVideo, DownloadedVideo, QFilterCondition> {
  QueryBuilder<DownloadedVideo, DownloadedVideo, QAfterFilterCondition>
      audioOnlyEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'audioOnly',
        value: value,
      ));
    });
  }

  QueryBuilder<DownloadedVideo, DownloadedVideo, QAfterFilterCondition>
      authorIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'author',
      ));
    });
  }

  QueryBuilder<DownloadedVideo, DownloadedVideo, QAfterFilterCondition>
      authorIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'author',
      ));
    });
  }

  QueryBuilder<DownloadedVideo, DownloadedVideo, QAfterFilterCondition>
      authorEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'author',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DownloadedVideo, DownloadedVideo, QAfterFilterCondition>
      authorGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'author',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DownloadedVideo, DownloadedVideo, QAfterFilterCondition>
      authorLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'author',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DownloadedVideo, DownloadedVideo, QAfterFilterCondition>
      authorBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'author',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DownloadedVideo, DownloadedVideo, QAfterFilterCondition>
      authorStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'author',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DownloadedVideo, DownloadedVideo, QAfterFilterCondition>
      authorEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'author',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DownloadedVideo, DownloadedVideo, QAfterFilterCondition>
      authorContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'author',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DownloadedVideo, DownloadedVideo, QAfterFilterCondition>
      authorMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'author',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DownloadedVideo, DownloadedVideo, QAfterFilterCondition>
      authorIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'author',
        value: '',
      ));
    });
  }

  QueryBuilder<DownloadedVideo, DownloadedVideo, QAfterFilterCondition>
      authorIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'author',
        value: '',
      ));
    });
  }

  QueryBuilder<DownloadedVideo, DownloadedVideo, QAfterFilterCondition>
      authorUrlIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'authorUrl',
      ));
    });
  }

  QueryBuilder<DownloadedVideo, DownloadedVideo, QAfterFilterCondition>
      authorUrlIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'authorUrl',
      ));
    });
  }

  QueryBuilder<DownloadedVideo, DownloadedVideo, QAfterFilterCondition>
      authorUrlEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'authorUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DownloadedVideo, DownloadedVideo, QAfterFilterCondition>
      authorUrlGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'authorUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DownloadedVideo, DownloadedVideo, QAfterFilterCondition>
      authorUrlLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'authorUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DownloadedVideo, DownloadedVideo, QAfterFilterCondition>
      authorUrlBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'authorUrl',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DownloadedVideo, DownloadedVideo, QAfterFilterCondition>
      authorUrlStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'authorUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DownloadedVideo, DownloadedVideo, QAfterFilterCondition>
      authorUrlEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'authorUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DownloadedVideo, DownloadedVideo, QAfterFilterCondition>
      authorUrlContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'authorUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DownloadedVideo, DownloadedVideo, QAfterFilterCondition>
      authorUrlMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'authorUrl',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DownloadedVideo, DownloadedVideo, QAfterFilterCondition>
      authorUrlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'authorUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<DownloadedVideo, DownloadedVideo, QAfterFilterCondition>
      authorUrlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'authorUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<DownloadedVideo, DownloadedVideo, QAfterFilterCondition>
      downloadCompleteEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'downloadComplete',
        value: value,
      ));
    });
  }

  QueryBuilder<DownloadedVideo, DownloadedVideo, QAfterFilterCondition>
      downloadFailedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'downloadFailed',
        value: value,
      ));
    });
  }

  QueryBuilder<DownloadedVideo, DownloadedVideo, QAfterFilterCondition>
      isarIdEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<DownloadedVideo, DownloadedVideo, QAfterFilterCondition>
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

  QueryBuilder<DownloadedVideo, DownloadedVideo, QAfterFilterCondition>
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

  QueryBuilder<DownloadedVideo, DownloadedVideo, QAfterFilterCondition>
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

  QueryBuilder<DownloadedVideo, DownloadedVideo, QAfterFilterCondition>
      lengthSecondsEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lengthSeconds',
        value: value,
      ));
    });
  }

  QueryBuilder<DownloadedVideo, DownloadedVideo, QAfterFilterCondition>
      lengthSecondsGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lengthSeconds',
        value: value,
      ));
    });
  }

  QueryBuilder<DownloadedVideo, DownloadedVideo, QAfterFilterCondition>
      lengthSecondsLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lengthSeconds',
        value: value,
      ));
    });
  }

  QueryBuilder<DownloadedVideo, DownloadedVideo, QAfterFilterCondition>
      lengthSecondsBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lengthSeconds',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DownloadedVideo, DownloadedVideo, QAfterFilterCondition>
      qualityEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'quality',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DownloadedVideo, DownloadedVideo, QAfterFilterCondition>
      qualityGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'quality',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DownloadedVideo, DownloadedVideo, QAfterFilterCondition>
      qualityLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'quality',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DownloadedVideo, DownloadedVideo, QAfterFilterCondition>
      qualityBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'quality',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DownloadedVideo, DownloadedVideo, QAfterFilterCondition>
      qualityStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'quality',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DownloadedVideo, DownloadedVideo, QAfterFilterCondition>
      qualityEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'quality',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DownloadedVideo, DownloadedVideo, QAfterFilterCondition>
      qualityContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'quality',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DownloadedVideo, DownloadedVideo, QAfterFilterCondition>
      qualityMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'quality',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DownloadedVideo, DownloadedVideo, QAfterFilterCondition>
      qualityIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'quality',
        value: '',
      ));
    });
  }

  QueryBuilder<DownloadedVideo, DownloadedVideo, QAfterFilterCondition>
      qualityIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'quality',
        value: '',
      ));
    });
  }

  QueryBuilder<DownloadedVideo, DownloadedVideo, QAfterFilterCondition>
      titleEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DownloadedVideo, DownloadedVideo, QAfterFilterCondition>
      titleGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DownloadedVideo, DownloadedVideo, QAfterFilterCondition>
      titleLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DownloadedVideo, DownloadedVideo, QAfterFilterCondition>
      titleBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'title',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DownloadedVideo, DownloadedVideo, QAfterFilterCondition>
      titleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DownloadedVideo, DownloadedVideo, QAfterFilterCondition>
      titleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DownloadedVideo, DownloadedVideo, QAfterFilterCondition>
      titleContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DownloadedVideo, DownloadedVideo, QAfterFilterCondition>
      titleMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'title',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DownloadedVideo, DownloadedVideo, QAfterFilterCondition>
      titleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: '',
      ));
    });
  }

  QueryBuilder<DownloadedVideo, DownloadedVideo, QAfterFilterCondition>
      titleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'title',
        value: '',
      ));
    });
  }

  QueryBuilder<DownloadedVideo, DownloadedVideo, QAfterFilterCondition>
      videoIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'videoId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DownloadedVideo, DownloadedVideo, QAfterFilterCondition>
      videoIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'videoId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DownloadedVideo, DownloadedVideo, QAfterFilterCondition>
      videoIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'videoId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DownloadedVideo, DownloadedVideo, QAfterFilterCondition>
      videoIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'videoId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DownloadedVideo, DownloadedVideo, QAfterFilterCondition>
      videoIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'videoId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DownloadedVideo, DownloadedVideo, QAfterFilterCondition>
      videoIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'videoId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DownloadedVideo, DownloadedVideo, QAfterFilterCondition>
      videoIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'videoId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DownloadedVideo, DownloadedVideo, QAfterFilterCondition>
      videoIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'videoId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DownloadedVideo, DownloadedVideo, QAfterFilterCondition>
      videoIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'videoId',
        value: '',
      ));
    });
  }

  QueryBuilder<DownloadedVideo, DownloadedVideo, QAfterFilterCondition>
      videoIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'videoId',
        value: '',
      ));
    });
  }
}

extension DownloadedVideoQueryObject
    on QueryBuilder<DownloadedVideo, DownloadedVideo, QFilterCondition> {}

extension DownloadedVideoQueryLinks
    on QueryBuilder<DownloadedVideo, DownloadedVideo, QFilterCondition> {}

extension DownloadedVideoQuerySortBy
    on QueryBuilder<DownloadedVideo, DownloadedVideo, QSortBy> {
  QueryBuilder<DownloadedVideo, DownloadedVideo, QAfterSortBy>
      sortByAudioOnly() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'audioOnly', Sort.asc);
    });
  }

  QueryBuilder<DownloadedVideo, DownloadedVideo, QAfterSortBy>
      sortByAudioOnlyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'audioOnly', Sort.desc);
    });
  }

  QueryBuilder<DownloadedVideo, DownloadedVideo, QAfterSortBy> sortByAuthor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'author', Sort.asc);
    });
  }

  QueryBuilder<DownloadedVideo, DownloadedVideo, QAfterSortBy>
      sortByAuthorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'author', Sort.desc);
    });
  }

  QueryBuilder<DownloadedVideo, DownloadedVideo, QAfterSortBy>
      sortByAuthorUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'authorUrl', Sort.asc);
    });
  }

  QueryBuilder<DownloadedVideo, DownloadedVideo, QAfterSortBy>
      sortByAuthorUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'authorUrl', Sort.desc);
    });
  }

  QueryBuilder<DownloadedVideo, DownloadedVideo, QAfterSortBy>
      sortByDownloadComplete() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'downloadComplete', Sort.asc);
    });
  }

  QueryBuilder<DownloadedVideo, DownloadedVideo, QAfterSortBy>
      sortByDownloadCompleteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'downloadComplete', Sort.desc);
    });
  }

  QueryBuilder<DownloadedVideo, DownloadedVideo, QAfterSortBy>
      sortByDownloadFailed() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'downloadFailed', Sort.asc);
    });
  }

  QueryBuilder<DownloadedVideo, DownloadedVideo, QAfterSortBy>
      sortByDownloadFailedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'downloadFailed', Sort.desc);
    });
  }

  QueryBuilder<DownloadedVideo, DownloadedVideo, QAfterSortBy>
      sortByLengthSeconds() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lengthSeconds', Sort.asc);
    });
  }

  QueryBuilder<DownloadedVideo, DownloadedVideo, QAfterSortBy>
      sortByLengthSecondsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lengthSeconds', Sort.desc);
    });
  }

  QueryBuilder<DownloadedVideo, DownloadedVideo, QAfterSortBy> sortByQuality() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quality', Sort.asc);
    });
  }

  QueryBuilder<DownloadedVideo, DownloadedVideo, QAfterSortBy>
      sortByQualityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quality', Sort.desc);
    });
  }

  QueryBuilder<DownloadedVideo, DownloadedVideo, QAfterSortBy> sortByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<DownloadedVideo, DownloadedVideo, QAfterSortBy>
      sortByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }

  QueryBuilder<DownloadedVideo, DownloadedVideo, QAfterSortBy> sortByVideoId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'videoId', Sort.asc);
    });
  }

  QueryBuilder<DownloadedVideo, DownloadedVideo, QAfterSortBy>
      sortByVideoIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'videoId', Sort.desc);
    });
  }
}

extension DownloadedVideoQuerySortThenBy
    on QueryBuilder<DownloadedVideo, DownloadedVideo, QSortThenBy> {
  QueryBuilder<DownloadedVideo, DownloadedVideo, QAfterSortBy>
      thenByAudioOnly() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'audioOnly', Sort.asc);
    });
  }

  QueryBuilder<DownloadedVideo, DownloadedVideo, QAfterSortBy>
      thenByAudioOnlyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'audioOnly', Sort.desc);
    });
  }

  QueryBuilder<DownloadedVideo, DownloadedVideo, QAfterSortBy> thenByAuthor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'author', Sort.asc);
    });
  }

  QueryBuilder<DownloadedVideo, DownloadedVideo, QAfterSortBy>
      thenByAuthorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'author', Sort.desc);
    });
  }

  QueryBuilder<DownloadedVideo, DownloadedVideo, QAfterSortBy>
      thenByAuthorUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'authorUrl', Sort.asc);
    });
  }

  QueryBuilder<DownloadedVideo, DownloadedVideo, QAfterSortBy>
      thenByAuthorUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'authorUrl', Sort.desc);
    });
  }

  QueryBuilder<DownloadedVideo, DownloadedVideo, QAfterSortBy>
      thenByDownloadComplete() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'downloadComplete', Sort.asc);
    });
  }

  QueryBuilder<DownloadedVideo, DownloadedVideo, QAfterSortBy>
      thenByDownloadCompleteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'downloadComplete', Sort.desc);
    });
  }

  QueryBuilder<DownloadedVideo, DownloadedVideo, QAfterSortBy>
      thenByDownloadFailed() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'downloadFailed', Sort.asc);
    });
  }

  QueryBuilder<DownloadedVideo, DownloadedVideo, QAfterSortBy>
      thenByDownloadFailedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'downloadFailed', Sort.desc);
    });
  }

  QueryBuilder<DownloadedVideo, DownloadedVideo, QAfterSortBy> thenByIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.asc);
    });
  }

  QueryBuilder<DownloadedVideo, DownloadedVideo, QAfterSortBy>
      thenByIsarIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.desc);
    });
  }

  QueryBuilder<DownloadedVideo, DownloadedVideo, QAfterSortBy>
      thenByLengthSeconds() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lengthSeconds', Sort.asc);
    });
  }

  QueryBuilder<DownloadedVideo, DownloadedVideo, QAfterSortBy>
      thenByLengthSecondsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lengthSeconds', Sort.desc);
    });
  }

  QueryBuilder<DownloadedVideo, DownloadedVideo, QAfterSortBy> thenByQuality() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quality', Sort.asc);
    });
  }

  QueryBuilder<DownloadedVideo, DownloadedVideo, QAfterSortBy>
      thenByQualityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quality', Sort.desc);
    });
  }

  QueryBuilder<DownloadedVideo, DownloadedVideo, QAfterSortBy> thenByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<DownloadedVideo, DownloadedVideo, QAfterSortBy>
      thenByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }

  QueryBuilder<DownloadedVideo, DownloadedVideo, QAfterSortBy> thenByVideoId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'videoId', Sort.asc);
    });
  }

  QueryBuilder<DownloadedVideo, DownloadedVideo, QAfterSortBy>
      thenByVideoIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'videoId', Sort.desc);
    });
  }
}

extension DownloadedVideoQueryWhereDistinct
    on QueryBuilder<DownloadedVideo, DownloadedVideo, QDistinct> {
  QueryBuilder<DownloadedVideo, DownloadedVideo, QDistinct>
      distinctByAudioOnly() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'audioOnly');
    });
  }

  QueryBuilder<DownloadedVideo, DownloadedVideo, QDistinct> distinctByAuthor(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'author', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DownloadedVideo, DownloadedVideo, QDistinct> distinctByAuthorUrl(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'authorUrl', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DownloadedVideo, DownloadedVideo, QDistinct>
      distinctByDownloadComplete() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'downloadComplete');
    });
  }

  QueryBuilder<DownloadedVideo, DownloadedVideo, QDistinct>
      distinctByDownloadFailed() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'downloadFailed');
    });
  }

  QueryBuilder<DownloadedVideo, DownloadedVideo, QDistinct>
      distinctByLengthSeconds() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lengthSeconds');
    });
  }

  QueryBuilder<DownloadedVideo, DownloadedVideo, QDistinct> distinctByQuality(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'quality', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DownloadedVideo, DownloadedVideo, QDistinct> distinctByTitle(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'title', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DownloadedVideo, DownloadedVideo, QDistinct> distinctByVideoId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'videoId', caseSensitive: caseSensitive);
    });
  }
}

extension DownloadedVideoQueryProperty
    on QueryBuilder<DownloadedVideo, DownloadedVideo, QQueryProperty> {
  QueryBuilder<DownloadedVideo, int, QQueryOperations> isarIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isarId');
    });
  }

  QueryBuilder<DownloadedVideo, bool, QQueryOperations> audioOnlyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'audioOnly');
    });
  }

  QueryBuilder<DownloadedVideo, String?, QQueryOperations> authorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'author');
    });
  }

  QueryBuilder<DownloadedVideo, String?, QQueryOperations> authorUrlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'authorUrl');
    });
  }

  QueryBuilder<DownloadedVideo, bool, QQueryOperations>
      downloadCompleteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'downloadComplete');
    });
  }

  QueryBuilder<DownloadedVideo, bool, QQueryOperations>
      downloadFailedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'downloadFailed');
    });
  }

  QueryBuilder<DownloadedVideo, int, QQueryOperations> lengthSecondsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lengthSeconds');
    });
  }

  QueryBuilder<DownloadedVideo, String, QQueryOperations> qualityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'quality');
    });
  }

  QueryBuilder<DownloadedVideo, String, QQueryOperations> titleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'title');
    });
  }

  QueryBuilder<DownloadedVideo, String, QQueryOperations> videoIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'videoId');
    });
  }
}
