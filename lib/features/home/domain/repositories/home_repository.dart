import 'package:gestion_inventario/features/data/api/entities/screens/Graficas.dart';
import 'package:gestion_inventario/features/home/domain/entities/product_entity.dart';
import 'package:gestion_inventario/features/home/domain/entities/sale_entity.dart';

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
  Future<String> addProduct({
    required ProductEntity product,
    required String userId,
  });
  Future<ProductEntity> loadProductbyId({
    required String id,
    required String userId,
  });
    Future<String> addSale({
    required SaleEntity product,
    required String userId,
  });
}
