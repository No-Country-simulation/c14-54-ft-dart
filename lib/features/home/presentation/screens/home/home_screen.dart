import 'package:flutter/material.dart';
import 'package:gestion_inventario/features/shared/shared.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const route = 'home_screen';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: IndexedStack(
        children: [
          _HomeView(),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigatorBar(),
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView();

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
