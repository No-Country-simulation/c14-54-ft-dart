import 'package:flutter/material.dart';

class View1 extends StatelessWidget {
  const View1({super.key});
  static const route = 'view_1';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('View1'),
      ),
    );
  }
}
