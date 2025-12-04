import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/news_article_entity.dart';
import '../../domain/repositories/explore_repository.dart';
import '../datasources/explore_remote_datasource.dart';

class ExploreRepositoryImpl implements ExploreRepository {
  final ExploreRemoteDataSource remoteDataSource;

  ExploreRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<NewsArticleEntity>>> getArticles({int page = 0, int limit = 10, String? category}) async {
    try {
      final articles = await remoteDataSource.getArticles(page: page, limit: limit, category: category);
      return Right(articles);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
