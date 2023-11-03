class Sales {
  List<SaleEntity> sales;

  Sales({
    required this.sales,
  });
}

class SaleEntity {
  String name;
  int sale;
  String date;

  SaleEntity({
    required this.name,
    required this.sale,
    required this.date,
  });
}
