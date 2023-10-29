import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:gestion_inventario/features/home/domain/datasources/home_datasources.dart';
import 'package:gestion_inventario/features/home/domain/entities/producto_entity.dart';
import 'package:dio/dio.dart';
import 'package:csv/csv.dart';
import 'package:gestion_inventario/features/home/infrastructure/mappers/product_mappers.dart';

class HomeDatasourceFirebase extends HomeDataSource {
  final db = FirebaseFirestore.instance;

  @override
  Future<List<ProductoEntity>> getProducts(String url) async {
    final response = await Dio(BaseOptions(baseUrl: url)).get(url);
    try {
      var data = response.data;
      Map<String, dynamic> jsonD = csvToJson(data);
      ProductoEntitys productos =
          ProductMapper.listFirestoreEntitys(json: jsonD);
      List<ProductoEntity> inventario = productos.productoentity;
      return inventario;
    } catch (e) {
      throw Exception(e);
    }
  }

  Map<String, dynamic> itemJson(valueList, List<String> claveList) {
    var h = 0;
    var placeN = {for (var value in valueList) claveList[h++]: value};
    return placeN;
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
}
