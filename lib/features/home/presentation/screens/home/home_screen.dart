import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gestion_inventario/features/home/presentation/providers/providers.dart';
import 'package:gestion_inventario/features/home/presentation/screens/screens.dart';
import 'package:gestion_inventario/features/shared/shared.dart';

class HomeScreen extends ConsumerStatefulWidget {
  final String userId;

  const HomeScreen({
    required this.userId,
    super.key,
  });
  static const route = 'home_screen';

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    super.initState();
    ref
        .read(productsFirebaseProvider.notifier)
        .loadProductsFirebase(widget.userId);
  }

  @override
  Widget build(BuildContext context) {
    final products = ref.watch(productsFirebaseProvider);

    return Scaffold(
      body: IndexedStack(
        index: ref.watch(homeViewProvider),
        children: [
          const View0(),
          const View1(),
          View2(products: products),
          const View3(),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigatorBar(
        currentIndex: ref.watch(homeViewProvider),
      ),
    );
  }
}
