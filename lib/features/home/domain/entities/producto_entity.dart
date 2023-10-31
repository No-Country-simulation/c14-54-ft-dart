class ProductoEntitys {
  List<ProductoEntity> productoentity;

  ProductoEntitys({
    required this.productoentity,
  });

  ProductoEntitys copyWith({
    List<ProductoEntity>? productoentity,
  }) =>
      ProductoEntitys(
        productoentity: productoentity ?? this.productoentity,
      );
}

class ProductoEntity {
  String nombre;
  double precioVenta;
  String descripcion;
  int cantidad;
  double precioBase;
  String imagen;

  ProductoEntity({
    required this.nombre,
    required this.precioVenta,
    required this.descripcion,
    required this.cantidad,
    required this.precioBase,
    required this.imagen,
  });

  ProductoEntity copyWith({
    String? nombre,
    double? precioVenta,
    String? descripcion,
    int? cantidad,
    double? precioBase,
    String? imagen,
  }) =>
      ProductoEntity(
        nombre: nombre ?? this.nombre,
        precioVenta: precioVenta ?? this.precioVenta,
        descripcion: descripcion ?? this.descripcion,
        cantidad: cantidad ?? this.cantidad,
        precioBase: precioBase ?? this.precioBase,
        imagen: imagen ?? this.imagen,
      );

  
}
