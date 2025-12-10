import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/entities/news_article_entity.dart';
import '../../domain/repositories/explore_repository.dart';
import '../../data/repositories/explore_repository_impl.dart';
import '../../data/datasources/explore_remote_datasource.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'explore_provider.g.dart';

@Riverpod(keepAlive: true)
ExploreRepository exploreRepository(ExploreRepositoryRef ref) {
  return ExploreRepositoryImpl(
    remoteDataSource: ExploreRemoteDataSourceImpl(Supabase.instance.client),
  );
}

@Riverpod(keepAlive: true)
class ExploreController extends _$ExploreController {
  @override
  FutureOr<void> build() {}

  Future<List<NewsArticleEntity>> getArticles({
    int page = 0,
    int limit = 10,
    String? category,
  }) async {
    final repository = ref.read(exploreRepositoryProvider);
    final result = await repository.getArticles(
      page: page,
      limit: limit,
      category: category,
    );
    return result.fold(
      (failure) => throw Exception(failure.message),
      (articles) => articles,
    );
  }
}
