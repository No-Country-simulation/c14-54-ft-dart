import 'package:gestion_inventario/features/home/domain/datasources/home_datasources.dart';
import 'package:gestion_inventario/features/home/domain/entities/producto_entity.dart';
import 'package:gestion_inventario/features/home/domain/repositories/home_repository.dart';

class HomeRepositoryImpl extends HomeRepository {
  final HomeDataSource homeDataSource;

  HomeRepositoryImpl(this.homeDataSource);
  @override
  Future<List<ProductoEntity>> getProducts(String url) {
    return homeDataSource.getProducts(url);
    // throw UnimplementedError();
  }
}
