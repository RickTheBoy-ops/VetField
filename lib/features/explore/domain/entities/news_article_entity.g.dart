// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_article_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NewsArticleEntityImpl _$$NewsArticleEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$NewsArticleEntityImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      category: json['category'] as String,
      imageUrl: json['imageUrl'] as String,
      date: DateTime.parse(json['date'] as String),
      readTime: json['readTime'] as String,
      content: json['content'] as String?,
    );

Map<String, dynamic> _$$NewsArticleEntityImplToJson(
        _$NewsArticleEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'category': instance.category,
      'imageUrl': instance.imageUrl,
      'date': instance.date.toIso8601String(),
      'readTime': instance.readTime,
      'content': instance.content,
    };
