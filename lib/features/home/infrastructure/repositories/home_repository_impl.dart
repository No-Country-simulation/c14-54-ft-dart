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
}
