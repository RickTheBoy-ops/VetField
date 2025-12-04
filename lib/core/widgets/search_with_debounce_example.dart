import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/utils/debouncer.dart';

/// Example Screen demonstrating search with debounce
/// This pattern can be applied to any search functionality
class SearchWithDebounceExample extends ConsumerStatefulWidget {
  const SearchWithDebounceExample({super.key});

  @override
  ConsumerState<SearchWithDebounceExample> createState() =>
      _SearchWithDebounceExampleState();
}

class _SearchWithDebounceExampleState
    extends ConsumerState<SearchWithDebounceExample> {
  final TextEditingController _searchController = TextEditingController();
  final Debouncer _debouncer = Debouncer(
    duration: const Duration(milliseconds: 500),
  );

  @override
  void initState() {
    super.initState();
    
    // Listen to search text changes with debounce
    _searchController.addListener(_onSearchChanged);
  }

  void _onSearchChanged() {
    final query = _searchController.text;
    
    // Debounce the search to avoid excessive API calls
    _debouncer.run(() {
      _performSearch(query);
    });
  }

  void _performSearch(String query) {
    if (query.isEmpty) {
      // Clear search results or reset
      return;
    }

    // TODO: Call your search provider/service here
    // Example: ref.read(searchProvider.notifier).search(query);
    
    debugPrint('Searching for: $query');
  }

  @override
  void dispose() {
    _searchController.dispose();
    _debouncer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buscar'),
      ),
      body: Column(
        children: [
          // Search bar with debounce
          Padding(
            padding: const EdgeInsets.all(16),
            child: Semantics(
              label: 'Campo de busca',
              textField: true,
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Buscar clínicas, veterinários...',
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: _searchController.text.isNotEmpty
                      ? IconButton(
                          icon: const Icon(Icons.clear),
                          onPressed: () {
                            _searchController.clear();
                          },
                        )
                      : null,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
          ),
          // Search results would go here
          const Expanded(
            child: Center(
              child: Text('Digite para buscar com debounce de 500ms'),
            ),
          ),
        ],
      ),
    );
  }
}

/// Alternative approach using RxDart for more complex scenarios
/// 
/// import 'package:rxdart/rxdart.dart';
/// 
/// class SearchWithRxDartExample extends StatefulWidget {
///   @override
///   State<SearchWithRxDartExample> createState() => _SearchWithRxDartExampleState();
/// }
/// 
/// class _SearchWithRxDartExampleState extends State<SearchWithRxDartExample> {
///   final _searchController = StreamController<String>();
///   late Stream<String> _debouncedSearchStream;
///   
///   @override
///   void initState() {
///     super.initState();
///     
///     _debouncedSearchStream = _searchController.stream
///         .debounceTime(Duration(milliseconds: 500))
///         .distinct();
///         
///     _debouncedSearchStream.listen((query) {
///       // Perform search
///     });
///   }
///   
///   @override
///   void dispose() {
///     _searchController.close();
///     super.dispose();
///   }
/// }
