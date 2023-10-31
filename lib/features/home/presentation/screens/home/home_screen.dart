import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gestion_inventario/features/home/presentation/providers/providers.dart';
import 'package:gestion_inventario/features/home/presentation/screens/screens.dart';
import 'package:gestion_inventario/features/shared/shared.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({
    super.key,
  });
  static const route = 'home_screen';
  final views = const [
    View0(),
    View1(),
    View2(),
    View3(),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: IndexedStack(
        index: ref.watch(homeViewProvider),
        children: views,
      ),
      bottomNavigationBar: CustomBottomNavigatorBar(
        currentIndex: ref.watch(homeViewProvider),
      ),
    );
  }
}
