import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gestion_inventario/features/home/infrastructure/infrastructure.dart';

final linkCsvRepositoryProvider = StateProvider((ref) {
  return HomeRepositoryImpl(HomeDatasourceCsv());
});
