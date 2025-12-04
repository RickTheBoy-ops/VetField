import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/news_article_entity.dart';

abstract class ExploreRepository {
  Future<Either<Failure, List<NewsArticleEntity>>> getArticles({int page = 0, int limit = 10, String? category});
}
