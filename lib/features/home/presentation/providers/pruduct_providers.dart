// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:gestion_inventario/features/home/domain/entities/producto_entity.dart';
// import 'package:gestion_inventario/features/home/presentation/providers/product_repository_provider.dart';

// final searchQueryProvider = StateProvider<String>((ref) => '');
// final searchedProductsProvider =
//     StateNotifierProvider<SearchedProductsNotifier, List<ProductoEntity>>((ref) {
//   final productRepository = ref.read(productRepositoryProvider);
//   return SearchedProductsNotifier(
//       searchProducts: productRepository.getProducts, ref: ref);
// });


// typedef SearchProductsCallback = Future<List<ProductoEntity>> Function(
//     String query);


// class SearchedProductsNotifier extends StateNotifier<List<ProductoEntity>> {
//   final SearchProductsCallback searchProducts;
//   final Ref ref;

//   SearchedProductsNotifier({
//     required this.searchProducts,
//     required this.ref,
//   }) : super([]);

//   Future<List<ProductoEntity>> searchProductByQuery(String query) async {
//     final List<ProductoEntity> movies = await searchProducts(query);
//     ref.read(searchQueryProvider.notifier).update((state) => query);

//     state = movies;
//     return movies;
//   }


// }
