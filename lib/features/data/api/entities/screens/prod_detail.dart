// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:fluttertravelwild/boxes.dart';
// import 'package:fluttertravelwild/models/local_sities.dart';
// import 'package:fluttertravelwild/models/Product.dart';
// import 'package:flutter_rating_bar/flutter_rating_bar.dart';
// import 'package:fluttertravelwild/pages/LocationApp.dart';
// import 'package:fluttertravelwild/pages/Login_page.dart';
// import 'package:fluttertravelwild/pages/location.dart';
// import 'package:fluttertravelwild/pages/map_page.dart';
import 'package:gestion_inventario/features/home/domain/entities/producto_entity.dart';
// import 'package:moviedb/model/result.dart';

class DetailProduct extends StatefulWidget {
  final ProductoEntity Product;
   static const route = 'deta';

  // const DetailMovie({super.key});
  const DetailProduct(this.Product, {super.key});

  @override
  State<DetailProduct> createState() => _DetailProductState();
}

class _DetailProductState extends State<DetailProduct> {
  // final box = Boxes.getFavoritesBox();

  bool isSaved = false;

  // void _onFavoritesButtonClicked() {
  //   var localProduct = LocalSities()
  //     ..description = generateDescription()
  //     ..imageLink = widget.Product.imagen
  //     ..id = widget.Product.nombresitio
  //     ..name = widget.Product.nombresitio;

  //   bool isPresent = checkIfSaved(localProduct.name!);

  //   if (isPresent) {
  //     print("The Product is already saved ${widget.Product.nombresitio}");
  //   } else {
  //     print("Adding Product to the box with name ${widget.Product.nombresitio}");
  //     box.add(localProduct);

  //     setState(() {
  //       isSaved = true;
  //     });
  //   }
  // }

  // void _onRemoveFavoritesButtonClicked() {
  //   bool isPresent = false;
  //   dynamic ProductKey;

  //   box.values.forEach(
  //     (Product) {
  //       if (Product.name == widget.Product.nombresitio) {
  //         isPresent = true;
  //         ProductKey = Product.key;
  //       }
  //     },
  //   );

  //   if (isPresent) {
  //     print("Deliting Product with name ${widget.Product.nombresitio}");
  //     box.delete(ProductKey);
  //     setState(() {
  //       isSaved = false;
  //     });
  //   }
  // }

  // bool checkIfSaved(String name) {
  //   bool isPresent = false;
  //   box.values.forEach(
  //     (Product) {
  //       if (Product.name == name) {
  //         isPresent = true;
  //       }
  //     },
  //   );

  //   return isPresent;
  // }

  String generateDescription() {
    return '''Hermoso  ${widget.Product.nombre}, unidades disponibles ${widget.Product.cantidad}:
     Precio  ${widget.Product.precioVenta}, no te  lo puedes perder.''';
  }

  @override
  Widget build(BuildContext context) {
    // double _rating = 3.0;

    // isSaved = checkIfSaved(widget.Product.nombresitio!);

    // final rating = RatingBar.builder(
        // initialRating: 3,
        // maxRating: 1,
        // direction: Axis.horizontal,
        // allowHalfRating: true,
        // itemCount: 5,
        // itemBuilder: (context, _) => const Icon(
        //       Icons.star,
        //       color: Colors.amber,
        //     ),
        // onRatingUpdate: (rating) {
        //   _rating = rating;
        // });
    Widget titleSection = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            /*1*/
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /*2*/
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    widget.Product.cantidad.toString(),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: const Text(
                    'Descripción',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  generateDescription(),
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          /*3*/
          // Icon(
          //   Icons.star,
          //   color: Colors.red[500],
          // ),
          // Text('11'),
        ],
      ),
    );
    // Color color = Theme.of(context).primaryColor;

    Widget buttonSection = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButtonColumn(context, widget.Product),
        // _buildButtonColumn(color, Icons.near_me, 'ROUTE'),
        // _buildButtonColumn(color, Icons.share, 'SHARE'),
      ],
    );

    Widget contenSection = Container(
      padding: const EdgeInsets.all(32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildTitlesection(Icons.abc, "Producto:", widget.Product.nombre),
          buildTitlesection(Icons.shopping_cart_rounded, "Descripción:", widget.Product.descripcion ),
          buildTitlesection(
              Icons.monetization_on_outlined, "Precio:", widget.Product.precioVenta.toString()),
        ],
      ),
    );

    return Scaffold(
      // appBar: AppBar(title: Text(Product.tipoatractivo ?? "Detalle")),
      appBar: AppBar(
          title: const Text(
        "Producto",
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      )),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
        child: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Image.network(
                  widget.Product.imagen,
                  errorBuilder: (BuildContext context, Object exception,
                      StackTrace? stackTrace) {
                    return const Image(image: AssetImage('assets/img/baggage'));
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                // rating,
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                        child: isSaved
                            ? IconButton(
                                alignment: Alignment.topRight,
                                icon: const Icon(Icons.favorite),
                                color: Colors.red,
                                onPressed: (() {
                                  // _onRemoveFavoritesButtonClicked();
                                }),
                              )
                            : IconButton(
                                alignment: Alignment.topRight,
                                icon: const Icon(Icons.favorite_border),
                                color: Colors.red,
                                onPressed: (() {
                                  // _onFavoritesButtonClicked();
                                }))),
                  ],
                ),
                contenSection,
                titleSection,
                buttonSection,
              ]),
        ),
      ),
    );
  }
}

Column _buildButtonColumn(context, Product) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      FloatingActionButton(
        onPressed: () {
          // Add your onPressed code here!
          // Navigator.pushReProductment(
              // context, MaterialPageRoute(builder: (context) => LocationAppExample(Product)));
              // context,
              // MaterialPageRoute(builder: (context) => SimpleExample(Product)));
        },
        // backgroundColor: Colors.green,
        child: const Icon(Icons.map),
      ),
    ],
  );
}

Row buildTitlesection(IconData icon, String title, String content) {
  return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
            )),
        const SizedBox(
          width: 30,
        ),
        Text(content,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
            )),
        const Spacer(),
        Icon(
          icon,
          color: Colors.green,
        ),
        const SizedBox(
          width: 30,
        )
      ]);
}
