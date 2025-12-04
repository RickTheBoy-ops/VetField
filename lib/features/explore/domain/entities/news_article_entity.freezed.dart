// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'news_article_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

NewsArticleEntity _$NewsArticleEntityFromJson(Map<String, dynamic> json) {
  return _NewsArticleEntity.fromJson(json);
}

/// @nodoc
mixin _$NewsArticleEntity {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  String get readTime => throw _privateConstructorUsedError;
  String? get content => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NewsArticleEntityCopyWith<NewsArticleEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewsArticleEntityCopyWith<$Res> {
  factory $NewsArticleEntityCopyWith(
          NewsArticleEntity value, $Res Function(NewsArticleEntity) then) =
      _$NewsArticleEntityCopyWithImpl<$Res, NewsArticleEntity>;
  @useResult
  $Res call(
      {String id,
      String title,
      String category,
      String imageUrl,
      DateTime date,
      String readTime,
      String? content});
}

/// @nodoc
class _$NewsArticleEntityCopyWithImpl<$Res, $Val extends NewsArticleEntity>
    implements $NewsArticleEntityCopyWith<$Res> {
  _$NewsArticleEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? category = null,
    Object? imageUrl = null,
    Object? date = null,
    Object? readTime = null,
    Object? content = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      readTime: null == readTime
          ? _value.readTime
          : readTime // ignore: cast_nullable_to_non_nullable
              as String,
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NewsArticleEntityImplCopyWith<$Res>
    implements $NewsArticleEntityCopyWith<$Res> {
  factory _$$NewsArticleEntityImplCopyWith(_$NewsArticleEntityImpl value,
          $Res Function(_$NewsArticleEntityImpl) then) =
      __$$NewsArticleEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String category,
      String imageUrl,
      DateTime date,
      String readTime,
      String? content});
}

/// @nodoc
class __$$NewsArticleEntityImplCopyWithImpl<$Res>
    extends _$NewsArticleEntityCopyWithImpl<$Res, _$NewsArticleEntityImpl>
    implements _$$NewsArticleEntityImplCopyWith<$Res> {
  __$$NewsArticleEntityImplCopyWithImpl(_$NewsArticleEntityImpl _value,
      $Res Function(_$NewsArticleEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? category = null,
    Object? imageUrl = null,
    Object? date = null,
    Object? readTime = null,
    Object? content = freezed,
  }) {
    return _then(_$NewsArticleEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      readTime: null == readTime
          ? _value.readTime
          : readTime // ignore: cast_nullable_to_non_nullable
              as String,
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NewsArticleEntityImpl implements _NewsArticleEntity {
  const _$NewsArticleEntityImpl(
      {required this.id,
      required this.title,
      required this.category,
      required this.imageUrl,
      required this.date,
      required this.readTime,
      this.content});

  factory _$NewsArticleEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$NewsArticleEntityImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String category;
  @override
  final String imageUrl;
  @override
  final DateTime date;
  @override
  final String readTime;
  @override
  final String? content;

  @override
  String toString() {
    return 'NewsArticleEntity(id: $id, title: $title, category: $category, imageUrl: $imageUrl, date: $date, readTime: $readTime, content: $content)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NewsArticleEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.readTime, readTime) ||
                other.readTime == readTime) &&
            (identical(other.content, content) || other.content == content));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, title, category, imageUrl, date, readTime, content);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NewsArticleEntityImplCopyWith<_$NewsArticleEntityImpl> get copyWith =>
      __$$NewsArticleEntityImplCopyWithImpl<_$NewsArticleEntityImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NewsArticleEntityImplToJson(
      this,
    );
  }
}

abstract class _NewsArticleEntity implements NewsArticleEntity {
  const factory _NewsArticleEntity(
      {required final String id,
      required final String title,
      required final String category,
      required final String imageUrl,
      required final DateTime date,
      required final String readTime,
      final String? content}) = _$NewsArticleEntityImpl;

  factory _NewsArticleEntity.fromJson(Map<String, dynamic> json) =
      _$NewsArticleEntityImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get category;
  @override
  String get imageUrl;
  @override
  DateTime get date;
  @override
  String get readTime;
  @override
  String? get content;
  @override
  @JsonKey(ignore: true)
  _$$NewsArticleEntityImplCopyWith<_$NewsArticleEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
