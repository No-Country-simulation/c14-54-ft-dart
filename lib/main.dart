import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gestion_inventario/config/config.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:logging/logging.dart';
import 'firebase_options.dart';

<<<<<<< HEAD
final log = Logger('ExampleLogger');
void main() async {
// void main() {
  Logger.root.level = Level.ALL; // defaults to Level.INFO
  Logger.root.onRecord.listen((record) {
  print('${record.level.name}: ${record.time}: ${record.message}');
  });
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    DevicePreviewHelper.buildWithDevicePreview(
      myApp: const MyApp(),
      enabled: false,
    ),
  );
}
=======
void main() => runApp(
      DevicePreviewHelper.buildWithDevicePreview(
        myApp: const ProviderScope(child: MyApp()),
        enabled: false,
      ),
    );
>>>>>>> 109f5d6660fd29f34f71a18bb4bad283e58abdcc

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
