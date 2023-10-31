import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gestion_inventario/features/home/infrastructure/datasources/home_datasource_firebase.dart';
import 'package:gestion_inventario/features/home/infrastructure/repositories/home_repository_impl.dart';

// Este repositorio es inmutable
final productRepositoryProvider = Provider((ref) {
  return HomeRepositoryImpl(HomeDatasourceFirebase());
});
