import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gestion_inventario/features/auth/presentation/providers/providers.dart';
import 'package:gestion_inventario/features/home/presentation/providers/providers.dart';
import 'package:gestion_inventario/features/home/presentation/screens/screens.dart';
import 'package:gestion_inventario/features/shared/shared.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({
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
        .loadProductsFirebase(ref.read(authProvider).user!.id);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: ref.watch(homeViewProvider),
        children: const [
          View0(),
          View1(),
          ProductsView(),
          View3(),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigatorBar(
        currentIndex: ref.watch(homeViewProvider),
      ),
    );
  }
}
