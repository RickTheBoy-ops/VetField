import 'package:freezed_annotation/freezed_annotation.dart';

part 'news_article_entity.freezed.dart';
part 'news_article_entity.g.dart';

@freezed
class NewsArticleEntity with _$NewsArticleEntity {
  const factory NewsArticleEntity({
    required String id,
    required String title,
    required String category,
    required String imageUrl,
    required DateTime date,
    required String readTime,
    String? content,
  }) = _NewsArticleEntity;

  factory NewsArticleEntity.fromJson(Map<String, dynamic> json) => _$NewsArticleEntityFromJson(json);
}
