import 'package:gestion_inventario/features/home/domain/domain.dart';

class HomeRepositoryImpl extends HomeRepository {
  final HomeDataSource homeDataSource;

  HomeRepositoryImpl(this.homeDataSource);
  @override
  Future<List<ProductEntity>> getProducts(String url) {
    return homeDataSource.getProducts(url);
  }

  @override
  Future<String> upLoadProducts(
      {required List<ProductEntity> products, required String userId}) {
    return homeDataSource.upLoadProducts(products: products, userId: userId);
  }

  @override
  Future<String> deleteProduct(
      {required ProductEntity product, required String userId}) {
    return homeDataSource.deleteProduct(product: product, userId: userId);
  }

  @override
  Future<String> updateProduct(
      {required ProductEntity product, required String userId}) {
    return homeDataSource.updateProduct(product: product, userId: userId);
  }

  @override
  Future<ProductEntity> loadProductbyId(
      {required String id, required String userId}) {
    return homeDataSource.loadProductbyId(id: id, userId: userId);
  }

  @override
  Future<String> addProduct(
      {required ProductEntity product, required String userId}) {
    return homeDataSource.addProduct(product: product, userId: userId);
  }

  @override
  Future<String> uploadProductPhoto(
      {required String path,
      required String productId,
      required String userId}) {
    return homeDataSource.uploadProductPhoto(
        path: path, productId: productId, userId: userId);
  }
}
