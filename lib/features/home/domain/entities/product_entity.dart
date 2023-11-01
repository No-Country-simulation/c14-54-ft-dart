class ProductEntity {
  String name;
  num salePrice;
  String description;
  num stock;
  num basePrice;
  String imageUrl;

  ProductEntity({
    required this.name,
    required this.salePrice,
    required this.description,
    required this.stock,
    required this.basePrice,
    required this.imageUrl,
  });
}
