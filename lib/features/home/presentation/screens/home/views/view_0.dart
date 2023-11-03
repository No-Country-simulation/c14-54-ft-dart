import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';


class View0 extends StatelessWidget {
  const View0({super.key});
  static const route = 'view_0';
  @override
  Widget build(BuildContext context) {
      List<_SalesData> data = [
      _SalesData('01/11/2023', 35),
      _SalesData('Feb', 28),
      _SalesData('Mar', 34),
      _SalesData('Apr', 100),
      _SalesData('May', 40),
      _SalesData('OCt', 15)
    ];
    return Scaffold(
        appBar: AppBar(
          title: const Text('DATA'),
        ),
        body: Column(children: [
          //Initialize the chart widget
          Graphlinear(data: data),
          Graphbar(data: data),
        ]));
  }
}

class _ChartApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      home: _MyHomePage(),
    );
  }
}

class _MyHomePage extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  _MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<_MyHomePage> {
  List<_SalesData> data = [
    _SalesData('01/11/2023', 35),
    _SalesData('Feb', 28),
    _SalesData('Mar', 34),
    _SalesData('Apr', 100),
    _SalesData('May', 40),
    _SalesData('May', 15)
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('DATA'),
        ),
        body: Column(children: [
          //Initialize the chart widget
          Graphlinear(data: data),
          Graphbar(data: data),
        ]));
  }
}

class Graphbar extends StatelessWidget {
  const Graphbar({
    super.key,
    required this.data,
  });

  final List<_SalesData> data;

  @override
  Widget build(BuildContext context) {
    return  SfCartesianChart(
       primaryXAxis: CategoryAxis(),
       isTransposed: true,
       series: <BarSeries<_SalesData, String>>[
         BarSeries<_SalesData, String>(
    dataSource: data,
    xValueMapper:  (_SalesData sales, _) => sales.year,
    yValueMapper:  (_SalesData sales, _) => sales.sales,
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

  final List<_SalesData> data;

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
        primaryXAxis: CategoryAxis(),
        // Chart title
        title: ChartTitle(text: 'Half yearly sales analysis'),
        // Enable legend
        legend: Legend(isVisible: false),
        // Enable tooltip
        tooltipBehavior: TooltipBehavior(enable: true),
        series: <ChartSeries<_SalesData, String>>[
          LineSeries<_SalesData, String>(
              dataSource: data,
              xValueMapper: (_SalesData sales, _) => sales.year,
              yValueMapper: (_SalesData sales, _) => sales.sales,
              name: 'Sales',
              // Enable data label
              dataLabelSettings: DataLabelSettings(isVisible: true))
        ]
        );
  }
}

class _SalesData {
  _SalesData(this.year, this.sales);

  final String year;
  final double sales;
}
