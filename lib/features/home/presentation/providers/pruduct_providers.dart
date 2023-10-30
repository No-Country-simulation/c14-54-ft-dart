import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gestion_inventario/features/home/domain/entities/producto_entity.dart';
import 'package:gestion_inventario/features/home/presentation/providers/product_repository_provider.dart';

final searchQueryProvider = StateProvider<String>((ref) => '');

final searchedMoviesProvider =
    StateNotifierProvider<SearchedMoviesNotifier, List<ProductoEntity>>((ref) {
  final movieRepository = ref.read(productRepositoryProvider);

  return SearchedMoviesNotifier(
      searchMovies: movieRepository.getProducts, ref: ref);
});

typedef SearchMoviesCallback = Future<List<ProductoEntity>> Function(
    String query);
// typedef GetMovieCallback = Future<Movie> Function(String movieId);

class SearchedMoviesNotifier extends StateNotifier<List<ProductoEntity>> {
  final SearchMoviesCallback searchMovies;
  final Ref ref;

  SearchedMoviesNotifier({
    required this.searchMovies,
    required this.ref,
  }) : super([]);

  Future<List<ProductoEntity>> searchMoviesByQuery(String query) async {
    final List<ProductoEntity> movies = await searchMovies(query);
    ref.read(searchQueryProvider.notifier).update((state) => query);

    state = movies;
    return movies;
  }
}
