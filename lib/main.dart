import 'package:flutter/material.dart';
import 'package:gestion_inventario/config/config.dart';

void main() => runApp(
      DevicePreviewHelper.buildWithDevicePreview(
        myApp: const MyApp(),
        enabled: false,
      ),
    );

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
