import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gestion_inventario/features/home/infrastructure/infrastructure.dart';

// Este repositorio es inmutable
final productRepositoryProvider = Provider((ref) {
  return HomeRepositoryImpl(HomeDatasourceFirebase());
});


