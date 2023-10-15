// import 'package:mislibros/models/results.dart'v;

// import 'package:gestion_inventario/features/auth/domain/entities/Inventario.dart';

import 'package:gestion_inventario/features/data/model/product_inv.dart';
import 'package:http/http.dart' as http;
import 'package:csv/csv.dart';
// import 'package:flutter_dotenv/flutter_dotenv.dart';

// import 'package:';

class ProductApi {
  
  Future<Inventario> getPlaces(String url) async {
    // await dotenv.load(fileName: "./env");
    // String? url1 = dotenv.env['CSV'] ?? " NO ";
    // String? url =
    //     "https://docs.google.com/spreadsheets/d/e/2PACX-1vRBviMI4ZGElmmd1-HzFKD36Dt1D8lMJeS6qeJkvww59fkfSD_uk5y7IDDoLE9c8zvTa0WpMKCi9J_Y/pub?gid=0&single=true&output=csv" ?? " ";
    // String? name = dotenv.env['Name'] ?? "  NO";
    // "https://docs.google.com/spreadsheets/d/e/2PACX-1vRK86_nSn34gvaxP9T6q1wrXpTZS-sSxLh0wbxZCA4VPKdzG-kWuwWL4n6ciqnclEJp-tKNP22sIyQw/pub?output=csv";
    // String uri = url + parameter;
    // print(url1);
    // print(name);
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      // return Results.fromJson(jsonDecode(response.body));
      var data = response.body;

      Map<String, dynamic> apiPlace = apiInventario(data);
      // return Inventario.fromJson(jsonDecode(_apiPlace));
      // print("JsonDecode");
      // var dat = jsonDecode(apiPlace);
      // print(apiPlace);
      // print("result");
      // print(dat);
      // print(Inventario.fromJson(apiPlace));
      return Inventario.fromJson(apiPlace);
      // return Inventario();
      // return data;
    } else {
      throw Exception("Failed to load books");
    }
  }

  Map<String, dynamic> itemJson(valueList, List<String> claveList) {
    var h = 0;
    // String claveList = claveList;
    var placeN = {for (var value in valueList) claveList[h++]: value};

    return placeN;
  }

  Map<String, dynamic> apiInventario(data) {
    List<List<dynamic>> df = const CsvToListConverter().convert(data);

    // ignore: non_constant_identifier_names
    List ItemsP = [];
    List<String> claveList = List<String>.from(df[0]);
    for (var i = 1; i < df.length; i++) {
      List valueList = df[i];
      Map placeN = itemJson(valueList, claveList);
      ItemsP.add(placeN);
    }

    // ignore: non_constant_identifier_names
    Map<String, dynamic> Api = {"Producto": ItemsP};
    // print(Api.keys);
    // String json = jsonEncode(ItemsP);
    // print(json);
    return Api;
  }
}
