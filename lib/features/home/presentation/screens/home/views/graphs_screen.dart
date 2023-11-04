import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gestion_inventario/features/auth/presentation/providers/providers.dart';
import 'package:gestion_inventario/features/home/domain/domain.dart';
import 'package:gestion_inventario/features/home/presentation/providers/providers.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class View0 extends ConsumerStatefulWidget {
  const View0({super.key});
  static const route = 'view_0';
  @override
  ConsumerState<View0> createState() => _View0State();
}

class _View0State extends ConsumerState<View0> {
  @override
  void initState() {
    super.initState();
    final userId = ref.read(authProvider).user!.id;
    ref.read(productsFirebaseProvider.notifier).loadProductsFirebase(userId);
  }

  @override
  Widget build(BuildContext context) {
    final products = ref.watch(productsFirebaseProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Gráficos'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //Initialize the chart widget
            Graphlinear(products: products),
            Graphbar(
              products: products,
            ),
          ],
        ),
      ),
    );
  }
}

class Graphbar extends StatelessWidget {
  const Graphbar({
    super.key,
    required this.products,
  });

  final List<ProductEntity> products;

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      primaryXAxis: CategoryAxis(),
      isTransposed: true,
      series: <BarSeries<ProductEntity, String>>[
        BarSeries<ProductEntity, String>(
          dataSource: products,
          xValueMapper: (ProductEntity product, _) =>
              DateTime.now().month.toString(),
          yValueMapper: (ProductEntity product, _) =>
              (product.sellCount ?? 0) * product.salePrice,
          //  isTrackVisible: true,

          //  trackColor: Colors.red
        ),
      ],
    );
  }
}

class Graphlinear extends StatelessWidget {
  const Graphlinear({
    super.key,
    required this.products,
  });

  final List<ProductEntity> products;

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
        primaryXAxis: CategoryAxis(),
        // Chart title
        title: ChartTitle(text: 'Análisis de Ventas'),
        // Enable legend
        legend: const Legend(isVisible: false),
        // Enable tooltip
        tooltipBehavior: TooltipBehavior(enable: true),
        series: <ChartSeries<ProductEntity, String>>[
          LineSeries<ProductEntity, String>(
            dataSource: products,
            xValueMapper: (ProductEntity product, _) =>
                DateTime.now().month.toString(),
            yValueMapper: (ProductEntity product, _) => double.parse(
                ((product.sellCount ?? 0) * product.salePrice)
                    .toStringAsFixed(2)),
            name: 'Sales',
            // Enable data label
            dataLabelSettings: const DataLabelSettings(isVisible: true),
          )
        ]);
  }
}
