import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

// class _MyHomePageState extends State<_MyHomePage> {
// List<_SalesData> data = [
//   _SalesData('01/11/2023', 35),
//   _SalesData('Feb', 28),
//   _SalesData('Mar', 34),
//   _SalesData('Apr', 100),
//   _SalesData('May', 40),
//   _SalesData('May', 15)
// ];
// @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: const Text('DATA'),
//         ),
//         body: Column(children: [
//           //Initialize the chart widget
//           Graphlinear(data: data),
//           Graphbar(data: data),
//         ]));
//   }
// }

class Graphbar extends StatelessWidget {
  const Graphbar({
    super.key,
    required this.data,
  });

  final List<SalesData> data;

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      primaryXAxis: CategoryAxis(),
      isTransposed: true,
      series: <BarSeries<SalesData, String>>[
        BarSeries<SalesData, String>(
          dataSource: data,
          xValueMapper: (SalesData sales, _) => sales.date,
          yValueMapper: (SalesData sales, _) => sales.sales,
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
    required this.data,
  });

  final List<SalesData> data;

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
        primaryXAxis: CategoryAxis(),
        // Chart title
        title: ChartTitle(text: 'Sales'),
        // Enable legend
        legend: const Legend(isVisible: false),
        // Enable tooltip
        tooltipBehavior: TooltipBehavior(enable: true),
        series: <ChartSeries<SalesData, String>>[
          LineSeries<SalesData, String>(
              dataSource: data,
              xValueMapper: (SalesData sales, _) => sales.date,
              yValueMapper: (SalesData sales, _) => sales.sales,
              name: 'Sales',
              // Enable data label
              dataLabelSettings: const DataLabelSettings(isVisible: true))
        ]);
  }
}

class SalesData {
  SalesData(this.date, this.sales);

  final String date;
  final double sales;
}
