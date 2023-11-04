import 'package:gestion_inventario/features/home/domain/domain.dart';

class ProductMapper {
  static ProductEntity jsonCsvToEntity({required Map<String, dynamic> json}) =>
      ProductEntity(
        id: '',
        name: json["Nombre"] ?? "No especificado",
        salePrice: setSalePrice(
          num.tryParse(json["Precio base"].toString()) ?? 0.0,
          num.tryParse(json["Precio venta"].toString()) ?? 0.0,
        ),
        description: json["Descripcion"] ?? "Sin descripcion",
        stock: num.tryParse(json["Cantidad"].toString()) ?? 0.0,
        basePrice: num.tryParse(json["Precio base"].toString()) ?? 0.0,
        imageUrl: json["Imagen"] ??
            "https://media.istockphoto.com/id/1409329028/vector/no-picture-available-placeholder-thumbnail-icon-illustration-design.jpg?s=612x612&w=0&k=20&c=_zOuJu755g2eEUioiOUdz_mHKJQJn-tDgIAhQzyeKUQ=",
      );

  static List<ProductEntity> jsonToListProductEntity(
          {required Map<String, dynamic> json}) =>
      List<ProductEntity>.from(
        json["Producto"].map((x) => jsonCsvToEntity(json: x)),
      );
  static ProductEntity mapFirestoreToEntity(
          {required Map<String, dynamic> map, required id}) =>
      ProductEntity(
        sellCount: map["sellCount"],
        sellDate: map["sellDate"],
        id: id,
        sellRegister: map["sellRegister"],
        name: map["name"] ?? "No especificado",
        salePrice: map["saleprice"] ?? 0.0,
        description: map["description"] ?? "Sin descripcion",
        stock: map["stock"] ?? 0.0,
        basePrice: map["baseprice"] ?? 0.0,
        imageUrl: map["imageUrl"] ??
            "https://media.istockphoto.com/id/1409329028/vector/no-picture-available-placeholder-thumbnail-icon-illustration-design.jpg?s=612x612&w=0&k=20&c=_zOuJu755g2eEUioiOUdz_mHKJQJn-tDgIAhQzyeKUQ=",
      );
  static num setSalePrice(num basePrice, num salePrice) {
    if (salePrice > 0) {
      return salePrice;
    }
    if (salePrice < basePrice) {
      return basePrice / (1 - 0.3);
    }
    return basePrice / (1 - 0.3);
  }
}
