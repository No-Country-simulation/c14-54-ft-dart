import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gestion_inventario/config/config.dart';
import 'package:gestion_inventario/features/shared/infrastructure/services/services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FirebaseInitializeApp.initialize();
  runApp(
    ProviderScope(
      child: DevicePreviewHelper.buildWithDevicePreview(
        enabled: false,
        myApp: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,
      theme: AppTheme().getAppTheme(),
      debugShowCheckedModeBanner: false,
    );
  }
}
