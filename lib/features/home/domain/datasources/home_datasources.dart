
import 'package:gestion_inventario/features/home/domain/entities/producto_entity.dart';

abstract class HomeDataSource {
  Future<List<ProductoEntity>> getProducts({
    required String url,
  });

}
