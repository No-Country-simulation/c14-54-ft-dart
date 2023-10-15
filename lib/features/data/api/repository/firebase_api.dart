import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gestion_inventario/features/data/api/entities/user_emp.dart';
import 'package:gestion_inventario/features/data/model/product_inv.dart';
import 'package:logging/logging.dart';

// import 'package:fluttertravelwild/models/User.dart' as UserApp;

// import 'package:fluttertravelwild/models/place.dart';

//  Auth with try catch
class FirebaseApi {
  //  Register

  Future<String?> registerUser(String email, String password) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return credential.user?.uid;
    } on FirebaseAuthException catch (e) {
      Logger.root.level = Level.ALL;
      Logger("FirebaseAuthException  ${e.code}");
      return e.code;
    } on FirebaseException catch (e) {
      Logger("FirebaseException  ${e.code}");

      return e.code;
    }
  }

  //  Loggin
  Future<String?> logInUser(String email, String password) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      // print(credential.additionalUserInfo);
      // print(credential.user?.email);
      // print(credential);
      // print("FIREBASE");

      return credential.user?.uid;
    } on FirebaseAuthException catch (e) {
      Logger("FirebaseAuthException  ${e.code}");
      return e.code;
    } on FirebaseException catch (e) {
      Logger("FirebaseException  ${e.code}");

      return e.code;
    }
  }

//  CreateUser
  Future<String?> createUser(UserEnt user) async {
    try {
      // final document =
          // await FirebaseFirestore.instance.collection("users").add(user.toJson());
          await FirebaseFirestore.instance
              .collection("users")
              .doc(user.uid)
              .set(user.toJson());
      // Logger("${document}");
      return user.uid;
      // return document.
    } on FirebaseException catch (e) {
      Logger("FirebaseException  ${e.code}");

      return e.code;
    }
  }

  Future<UserEnt> getUser(UserEnt user) async {
    try {
      final document =
          // await FirebaseFirestore.instance.collection("users").add(user.toJson());
          await FirebaseFirestore.instance
              .collection("users")
              .doc(user.uid)
              .get();
      // UserApp.User retU = UserApp.User.Empty();
      Logger("Query");
      Logger(user.uid);
      Logger("${document.data()}");
      Logger("Exit");
      // Persona per = Persona.fromJson(document.get());
      // UserEnt d = UserEnt.Empty();
      var dat = document.data();

      // jsonDecode(dat);

      return UserEnt.fromJson(dat!);
    } on FirebaseException catch (e) {
      Logger("FirebaseException  ${e.code}");
      Map<String, dynamic> dat = {'Error': e.code};
      // return user.toJson();
      Logger("$dat");
      return UserEnt.Empty();
    }
  }

//  CreateUser
  Future<String?> createPlace(Producto producto) async {
    try {
      final document =
          // await FirebaseFirestore.instance.collection("users").add(user.toJson());
          await FirebaseFirestore.instance
              .collection("producto")
              .add(producto.toJson());
      Logger("$document");
      return producto.uid;
    } on FirebaseException catch (e) {
      Logger("FirebaseException  ${e.code}");

      return e.code;
    }
  }
}
