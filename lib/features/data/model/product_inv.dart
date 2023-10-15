// To parse this JSON data, do
//
//     final inventario = inventarioFromJson(jsonString);

import 'dart:convert';

Inventario inventarioFromJson(String str) =>
    Inventario.fromJson(json.decode(str));

String inventarioToJson(Inventario data) => json.encode(data.toJson());

class Inventario {
  List<Producto> producto;

  Inventario({
    required this.producto,
  });

  factory Inventario.fromJson(Map<String, dynamic> json) => Inventario(
        producto: List<Producto>.from(
            json["Producto"].map((x) => Producto.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Producto": List<dynamic>.from(producto.map((x) => x.toJson())),
      };
}

class Producto {
  var uid;
  String producto;
  String categoria;
  String descripcion;
  String proveedor;
  int cantidad;
  int precio;
  String imagen;

  Producto({
    required this.producto,
    required this.categoria,
    required this.descripcion,
    required this.proveedor,
    required this.cantidad,
    required this.precio,
    required this.imagen,
  });

  factory Producto.fromJson(Map<String, dynamic> json) => Producto(
        producto: json["Producto"],
        categoria: json["Categoria"].toString(),
        descripcion: json["Descripcion"],
        proveedor: json["Proveedor"],
        cantidad: json["Cantidad"],
        precio: json["Precio"],
        imagen: json["Imagen"],
      );

  Map<String, dynamic> toJson() => {
        "Producto": producto,
        "Categoria": categoria,
        "Descripcion": descripcion,
        "proveedor": proveedor,
        "Cantidad": cantidad,
        "Precio": precio,
        "Imagen": imagen,
      };
}
