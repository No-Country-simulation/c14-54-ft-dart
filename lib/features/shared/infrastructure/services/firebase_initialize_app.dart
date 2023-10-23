import 'package:firebase_core/firebase_core.dart';
import 'package:gestion_inventario/firebase_options.dart';

class FirebaseInitializeApp {
  static Future<void> initialize() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }
}
