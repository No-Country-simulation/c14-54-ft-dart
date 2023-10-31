import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gestion_inventario/features/home/domain/domain.dart';
import 'package:gestion_inventario/features/home/infrastructure/infrastructure.dart';

class HomeDatasourceFirebase extends HomeDataSource {
  final db = FirebaseFirestore.instance;

  @override
  Future<List<ProductEntity>> getProducts(String url) async {
    String userId = url;
    try {
      final response =
          await db.collection('users').doc(userId).collection('products').get();
      List<ProductEntity> products = [];
      for (var product in response.docs) {
        ProductEntity producto =
            ProductMapper.mapFirestoreToEntity(map: product.data());

        products.add(producto);
      }
      return products;
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<String> upLoadProducts({
    required List<ProductEntity> products,
    required String userId,
  }) async {
    try {
      for (ProductEntity product in products) {
        await db.collection('users').doc(userId).collection('products').add({
          'name': product.name,
          'description': product.description,
          'baseprice': product.basePrice,
          'saleprice': product.salePrice,
          'stock': product.stock,
          'imageUrl': product.imageUrl,
        });
      }

      return Future.value('Carga exitosa');
    } on FirebaseException catch (e) {
      return Future.value(e.toString());
    }
  }
}
