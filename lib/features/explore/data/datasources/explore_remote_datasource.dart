import 'package:supabase_flutter/supabase_flutter.dart';
import '../../domain/entities/news_article_entity.dart';

abstract class ExploreRemoteDataSource {
  Future<List<NewsArticleEntity>> getArticles({int page = 0, int limit = 10, String? category});
}

class ExploreRemoteDataSourceImpl implements ExploreRemoteDataSource {
  final SupabaseClient client;

  ExploreRemoteDataSourceImpl(this.client);

  @override
  Future<List<NewsArticleEntity>> getArticles({int page = 0, int limit = 10, String? category}) async {
    // Mock implementation or real Supabase query
    // Assuming 'news' table exists. If not, this will fail at runtime, but code is clean.
    // For now, I'll return the mock data from the screen to ensure it works "offline" or without backend changes.
    
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 500));

    final List<NewsArticleEntity> mockArticles = [
      NewsArticleEntity(
        id: '1',
        title: '5 Dicas para Cuidar do seu Pet no Verão',
        category: 'Dicas',
        imageUrl: 'https://images.unsplash.com/photo-1450778869180-41d0601e046e?q=80&w=400&auto=format&fit=crop',
        date: DateTime.now().subtract(const Duration(days: 2)),
        readTime: '5 min',
      ),
      NewsArticleEntity(
        id: '2',
        title: 'Vacinação: O que você precisa saber',
        category: 'Saúde',
        imageUrl: 'https://images.unsplash.com/photo-1581888227599-779811939961?q=80&w=400&auto=format&fit=crop',
        date: DateTime.now().subtract(const Duration(days: 3)),
        readTime: '8 min',
      ),
      NewsArticleEntity(
        id: '3',
        title: 'Alimentação Balanceada para Cães',
        category: 'Alimentação',
        imageUrl: 'https://images.unsplash.com/photo-1587300003388-59208cc962cb?q=80&w=400&auto=format&fit=crop',
        date: DateTime.now().subtract(const Duration(days: 5)),
        readTime: '6 min',
      ),
      NewsArticleEntity(
        id: '4',
        title: 'Como Entender o Comportamento do seu Gato',
        category: 'Comportamento',
        imageUrl: 'https://images.unsplash.com/photo-1514888286974-6c03e2ca1dba?q=80&w=400&auto=format&fit=crop',
        date: DateTime.now().subtract(const Duration(days: 7)),
        readTime: '7 min',
      ),
    ];

    var filtered = mockArticles;
    if (category != null && category != 'Todos') {
      filtered = mockArticles.where((a) => a.category == category).toList();
    }

    // Pagination logic (mock)
    final start = page * limit;
    if (start >= filtered.length) return [];
    final end = (start + limit) < filtered.length ? (start + limit) : filtered.length;
    return filtered.sublist(start, end);
  }
}
