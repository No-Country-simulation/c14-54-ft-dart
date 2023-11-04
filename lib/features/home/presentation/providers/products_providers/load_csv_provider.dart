import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gestion_inventario/features/home/domain/domain.dart';
import 'package:gestion_inventario/features/home/presentation/providers/providers.dart';

final loadCsvProvider =
    StateNotifierProvider<LoadCsvNotifier, List<ProductEntity>>((ref) {
  final csvRepository = ref.read(linkCsvRepositoryProvider);
  final productRepository = ref.read(productRepositoryProvider);

  return LoadCsvNotifier(
    loadProducts: csvRepository.getProducts,
    upLoadProducts: productRepository.upLoadProducts,
  );
});

typedef LoadCsvCallback = Future<List<ProductEntity>> Function(String query);
typedef UpLoadProductsCallback = Future<String> Function({
  required List<ProductEntity> products,
  required String userId,
});
// typedef GetMovieCallback = Future<Movie> Function(String movieId);

class LoadCsvNotifier extends StateNotifier<List<ProductEntity>> {
  final LoadCsvCallback loadProducts;
  final UpLoadProductsCallback upLoadProducts;

  LoadCsvNotifier({
    required this.upLoadProducts,
    required this.loadProducts,
  }) : super([]);

  Future<List<ProductEntity>> loadCsvByQuery(String query) async {
    final List<ProductEntity> products = await loadProducts(query);

    state = products;
    return products;
  }

  Future<String> upLoadProductsFirebase(
      List<ProductEntity> products, String userId) async {
    try {
      final String result =
          await upLoadProducts(products: products, userId: userId);
      return result;
    } catch (e) {
      return e.toString();
    }
  }
}
