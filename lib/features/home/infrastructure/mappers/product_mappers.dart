
import 'package:gestion_inventario/features/home/domain/entities/producto_entity.dart';

class ProductMapper {
  static ProductoEntity productoFirebaseToEntity(ProductoEntity producto ) => ProductoEntity(
        nombre: producto.nombre,
        precioVenta: producto.precioVenta,
        descripcion: producto.descripcion,
        cantidad: producto.cantidad,
        precioBase: producto.precioBase,
        imagen: producto.imagen,
      );
  static ProductoEntity jsonFirestoreToEntity(
          {required Map<String, dynamic> json}) =>
      ProductoEntity(
        nombre: json["Nombre"] ?? "E",
        precioVenta: json["Precio venta"] ?? 0,
        descripcion: json["Descripcion"] ?? "",
        cantidad: json["Cantidad"] ?? 0,
        precioBase: json["Precio base"] ?? 0,
        imagen: json["Imagen"] ?? "E",
      );

 static ProductoEntitys listFirestoreEntitys(
     {required Map<String, dynamic> json})=> ProductoEntitys(
       productoentity:   List<ProductoEntity>.from(
            json["Producto"].map((x) => jsonFirestoreToEntity( json: x))),
      );
}
