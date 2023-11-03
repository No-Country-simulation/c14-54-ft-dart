import 'package:csv/csv.dart';
import 'package:dio/dio.dart';
import 'package:gestion_inventario/features/home/domain/domain.dart';
import 'package:gestion_inventario/features/home/domain/entities/sale_entity.dart';
import 'package:gestion_inventario/features/home/infrastructure/infrastructure.dart';

class HomeDatasourceCsv extends HomeDataSource {
  @override
  Future<List<ProductEntity>> getProducts(String url) async {
    final response = await Dio(BaseOptions(baseUrl: url)).get(url);
    try {
      final data = response.data;
      Map<String, dynamic> jsonD = csvToJson(data);
      List<ProductEntity> productos =
          ProductMapper.jsonToListProductEntity(json: jsonD);

      return productos;
    } catch (e) {
      throw Exception(e);
    }
  }

  Map<String, dynamic> csvToJson(data) {
    List<List<dynamic>> df = const CsvToListConverter().convert(data);
    List itemsP = [];
    List<String> claveList = List<String>.from(df[0]);
    for (var i = 1; i < df.length; i++) {
      List valueList = df[i];
      Map placeN = itemJson(valueList, claveList);
      itemsP.add(placeN);
    }
    Map<String, dynamic> dataJson = {"Producto": itemsP};
    return dataJson;
  }

  @override
  Future<String> upLoadProducts(
      {required List<ProductEntity> products, required String userId}) {
    // TODO: implement upLoadProducts
    throw UnimplementedError();
  }

  @override
  Future<String> deleteProduct(
      {required ProductEntity product, required String userId}) {
    // TODO: implement deleteProduct
    throw UnimplementedError();
  }

  @override
  Future<String> updateProduct(
      {required ProductEntity product, required String userId}) {
    // TODO: implement updateProduct
    throw UnimplementedError();
  }

  @override
  Future<ProductEntity> loadProductbyId(
      {required String id, required String userId}) {
    // TODO: implement loadProductbyId
    throw UnimplementedError();
  }

  @override
  Future<String> addProduct(
      {required ProductEntity product, required String userId}) {
    // TODO: implement addProduct
    throw UnimplementedError();
  }

  @override
  Future<String> addSale({required SaleEntity sale, required String userId}) {
    // TODO: implement addSale
    throw UnimplementedError();
  }
}

Map<String, dynamic> itemJson(valueList, List<String> claveList) {
  var h = 0;
  var placeN = {for (var value in valueList) claveList[h++]: value};
  return placeN;
}
