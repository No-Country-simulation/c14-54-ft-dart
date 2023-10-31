import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gestion_inventario/features/home/domain/domain.dart';
import 'package:gestion_inventario/features/home/presentation/providers/providers.dart';

final productsFirebaseProvider =
    StateNotifierProvider<ProductsFirebaseNotifier, List<ProductEntity>>((ref) {
  final productRepository = ref.read(productRepositoryProvider);

  return ProductsFirebaseNotifier(loadProducts: productRepository.getProducts);
});

typedef LoadProductsCallback = Future<List<ProductEntity>> Function(String url);
// typedef GetMovieCallback = Future<Movie> Function(String movieId);

class ProductsFirebaseNotifier extends StateNotifier<List<ProductEntity>> {
  final LoadProductsCallback loadProducts;

  ProductsFirebaseNotifier({
    required this.loadProducts,
  }) : super([]);

  Future<List<ProductEntity>> loadProductsFirebase(String query) async {
    final List<ProductEntity> products = await loadProducts(query);

    state = products;
    return products;
  }
}
