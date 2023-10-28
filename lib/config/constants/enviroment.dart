import 'package:flutter_dotenv/flutter_dotenv.dart';

class Enviroment {
  static String firebaseApiKey =
      dotenv.env['firebaseApiKey'] ?? 'No hay ApiKey';
  static String messagingSenderId =
      dotenv.env['messagingSenderId'] ?? 'No hay messagingSenderId';
  static String projectId = dotenv.env['projectId'] ?? 'No hay projectId';
}
