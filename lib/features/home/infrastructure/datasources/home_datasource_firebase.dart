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
        final String id = product.id;
        ProductEntity producto =
            ProductMapper.mapFirestoreToEntity(map: product.data(), id: id);

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

  @override
  Future<String> deleteProduct(
      {required ProductEntity product, required String userId}) {
    try {
      db
          .collection('users')
          .doc(userId)
          .collection('products')
          .doc(product.id)
          .delete();
      return Future.value('Producto eliminado');
    } on FirebaseException catch (e) {
      return Future.value(e.toString());
    }
  }

  @override
  Future<String> updateProduct(
      {required ProductEntity product, required String userId}) {
    try {
      db
          .collection('users')
          .doc(userId)
          .collection('products')
          .doc(product.id)
          .update({
        'name': product.name,
        'description': product.description,
        'baseprice': product.basePrice,
        'saleprice': product.salePrice,
        'stock': product.stock,
        'imageUrl': product.imageUrl,
      });
      return Future.value('Producto actualizado');
    } on FirebaseException catch (e) {
      return Future.value(e.toString());
    }
  }

  @override
  Future<ProductEntity> loadProductbyId(
      {required String id, required String userId}) async {
    try {
      final response = await db
          .collection('users')
          .doc(userId)
          .collection('products')
          .doc(id)
          .get();

      ProductEntity producto =
          ProductMapper.mapFirestoreToEntity(map: response.data()!, id: id);

      return producto;
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<String> addProduct(
      {required ProductEntity product, required String userId}) {
    try {
      db.collection('users').doc(userId).collection('products').add({
        'name': product.name,
        'description': product.description,
        'baseprice': product.basePrice,
        'saleprice': product.salePrice,
        'stock': product.stock,
        'imageUrl': product.imageUrl,
      });

      return Future.value('Producto agregado con Exito');
    } on FirebaseException catch (e) {
      return Future.value(e.toString());
    }
  }
}
