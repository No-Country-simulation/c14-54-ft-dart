import 'package:gestion_inventario/features/home/domain/entities/product_entity.dart';

abstract class HomeRepository {
  Future<List<ProductEntity>> getProducts(
    String url,
  );
  Future<String> upLoadProducts({
    required List<ProductEntity> products,
    required String userId,
  });
  Future<String> updateProduct({
    required ProductEntity product,
    required String userId,
  });
  Future<String> deleteProduct({
    required ProductEntity product,
    required String userId,
  });
}
