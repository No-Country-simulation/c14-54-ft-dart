import 'package:flutter/material.dart';
import 'package:gestion_inventario/features/home/domain/entities/product_entity.dart';
// import 'package:gestion_inventario/features/data/model/product_inv.dart';

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
        title: const Text('DraggableScrollableSheet'),
      ),
      body: SizedBox.expand(
        child: DraggableScrollableSheet(
          builder: (BuildContext context, ScrollController scrollController) {
            return Container(
              color: const Color.fromARGB(255, 144, 197, 239),
              child: ListView.builder(
                controller: scrollController,
                itemCount: listdat.length,
                itemBuilder: (BuildContext context, int index) {
                  ProductEntity prod = listdat[index];
                  var text = Text(prod.name);
                  var text2 = Text(prod.description);
                  var img = ClipRRect(
                    borderRadius: BorderRadius.circular(20), // Image border
                    child: SizedBox.fromSize(
                      // size: Size.fromRadius(48), // Image radius
                      size: const Size.square(48), // Image radius
                      child: Image.network(prod.imageUrl)
                      //  ?? "",
                      //     errorBuilder: (BuildContext context,
                      //         Object exception, StackTrace? stackTrace) {
                      //   return const Image(
                      //       image: AssetImage('assets/img/random.png'));
                      // }, fit: BoxFit.cover),
                      ,
                    ),
                  );
                  return ListTile(
                    title: text,
                    subtitle: text2,
                    leading: img,
                  );
                  //             return Card(
                  //   child: ListTile(
                  //     title: text,
                  //     subtitle: text2,
                  //     leading: img,
                  //     // onTap: () {
                  //     //   // builder: (context) => print("screen new");
                  //     // },
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
          ProductEntity prod = listdat[index];
          // print("Iter");
          var text = Text(prod.name);
          var text2 = Text(prod.description);
          // var text3 = Text(prod.imagen.toString());
          var img = ClipRRect(
            borderRadius: BorderRadius.circular(20), // Image border
            child: SizedBox.fromSize(
              // size: Size.fromRadius(48), // Image radius
              size: const Size.square(48), // Image radius
              child: Image.network(prod.imageUrl)
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
