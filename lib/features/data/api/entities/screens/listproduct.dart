import 'package:flutter/material.dart';
import 'package:gestion_inventario/features/data/api/entities/screens/prod_detail.dart';
import 'package:gestion_inventario/features/home/domain/entities/producto_entity.dart';


Scaffold scaffWid(List<dynamic> listdat) {
  return Scaffold(
    body: Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      child: Center(
        child: Column(
          children: [
            Expanded(
              child: Lista(
                listdat: listdat,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

class HomePage extends StatelessWidget {
  final List listdat;
  const HomePage({super.key, required this.listdat});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Productos'),
      ),
      body: SizedBox.expand(
        child: DraggableScrollableSheet(
          builder: (BuildContext context, ScrollController scrollController) {
            return Container(
              color: Color.fromARGB(255, 226, 227, 227),
              child: ListView.builder(
                controller: scrollController,
                itemCount: listdat.length,
                itemBuilder: (BuildContext context, int index) {
                  ProductoEntity prod = listdat[index];
                  var text = Text(prod.nombre);
                  var text2 = Text(prod.descripcion);
                  var img = ClipRRect(
                    borderRadius: BorderRadius.circular(20), // Image border
                    child: SizedBox.fromSize(
                      // size: Size.fromRadius(48), // Image radius
                      size: const Size.square(48), // Image radius
                      child: Image.network(prod.imagen)
                      //  ?? "",
                      //     errorBuilder: (BuildContext context,
                      //         Object exception, StackTrace? stackTrace) {
                      //   return const Image(
                      //       image: AssetImage('assets/img/random.png'));
                      // }, fit: BoxFit.cover),
                      ,
                    ),
                  );
                  return Card(
                    child: ListTile(
                      title: text,
                      subtitle: text2,
                      leading: img,
                      onTap: () {
                        // print("tab");
                        // (context) => DetailPlace(prod);
                     Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailProduct(prod)));

                      },
                    ),
                  );
                  // return ListTile(
                  //   title: text,
                  //   subtitle: text2,
                  //   leading: img,
                  //   onTap: () {

                  //   },
                  // );
                  //             return Card(
                  //   child: ListTile(
                  //     title: text,
                  //     subtitle: text2,
                  //     leading: img,
                  // onTap: () {
                  //   builder: (context) => print("screen new");
                  // },
                  //   ),
                  // );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

class Lista extends StatelessWidget {
  final List listdat;
  const Lista({
    super.key,
    required this.listdat,
  });

  @override
  Widget build(BuildContext context) {
    ScrollController scrollController = ScrollController();
    return ListView.builder(
        controller: scrollController,
        itemCount: listdat.length,
        itemBuilder: (BuildContext context, index) {
          ProductoEntity prod = listdat[index];
          // print("Iter");
          var text = Text(prod.nombre);
          var text2 = Text(prod.descripcion);
          // var text3 = Text(prod.imagen.toString());
          var img = ClipRRect(
            borderRadius: BorderRadius.circular(20), // Image border
            child: SizedBox.fromSize(
              // size: Size.fromRadius(48), // Image radius
              size: const Size.square(48), // Image radius
              child: Image.network(prod.imagen)
              //  ?? "",
              //     errorBuilder: (BuildContext context,
              //         Object exception, StackTrace? stackTrace) {
              //   return const Image(
              //       image: AssetImage('assets/img/random.png'));
              // }, fit: BoxFit.cover),
              ,
            ),
          );

          return Card(
            child: ListTile(
              title: text,
              subtitle: text2,
              leading: img,
              onTap: () {
                // builder: (context) => print("screen new");
              },
            ),
          );
        });
  }
}
