class ProductEntity {
  String id;
  String name;
  num salePrice;
  String description;
  num stock;
  num basePrice;
  String imageUrl;
  dynamic sellDate;
  num? sellCount;
  List<dynamic>? sellRegister;

  ProductEntity({
    this.sellRegister,
    this.sellCount,
    this.sellDate,
    required this.id,
    required this.name,
    required this.salePrice,
    required this.description,
    required this.stock,
    required this.basePrice,
    required this.imageUrl,
  });
}
