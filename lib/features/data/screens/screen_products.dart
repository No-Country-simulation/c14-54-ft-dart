import 'package:flutter/material.dart';
import 'package:gestion_inventario/features/data/api/datasource/product_api.dart';
import 'package:gestion_inventario/features/data/model/product_inv.dart';
import 'package:gestion_inventario/features/data/widget/view_widget.dart';

class ScreenProduct extends StatefulWidget {
  static const route = 'product_screen';
  const ScreenProduct({super.key});

  @override
  State<ScreenProduct> createState() => _ScreenProductState();
}

class _ScreenProductState extends State<ScreenProduct> {
  ProductApi productoApi = ProductApi();
  List<Producto> listdat = <Producto>[];

  // final _parameter = TextEditingController();


  // PlacesAPi _placeApi = PlacesAPi();
  // FirebaseApi _firebaseApi
  // List<Place1> listPlace = <Place1>[];
  // final FirebaseApi _firebaseApi = FirebaseApi();
  @override
  void initState() {
    _getPlace();
    // _searchMovie();
    super.initState();
  }

  Future _getPlace() async {
   
    String url =
        "https://docs.google.com/spreadsheets/d/e/2PACX-1vRBviMI4ZGElmmd1-HzFKD36Dt1D8lMJeS6qeJkvww59fkfSD_uk5y7IDDoLE9c8zvTa0WpMKCi9J_Y/pub?gid=0&single=true&output=csv";
    // "https://docs.google.com/spreadsheets/d/e/2PACX-1vRBviMI4ZGElmmd1-HzFKD36Dt1D8lMJeS6qeJkvww59fkfSD_uk5y7IDDoLE9c8zvTa0WpMKCi9J_Y/pub?gid=0&single=true&output=csv";
    Inventario resultInv = await productoApi.getPlaces(url);

    setState(() {
      for (var element in resultInv.producto) {
        listdat.add(element);
        // print(element[0]);
      }
      // print(listdat[0].cantidad);
    });

    // print(listdat.length);
  }
  // Future _searchMovie() async {
  //   Place resultsFuture = await _movieApi.getPlaces();

  //   setState(() {
  //     resultsFuture.place?.forEach((element) {
  //       listMovie.add(element);
  //       // print("data");
  //       // print(element);
  //       // var createPlace = _firebaseApi.createPlace(element);
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    // print(listdat.length);
    // return scaffWid(listdat);

    return  HomePage( listdat: listdat,);
  }
}
