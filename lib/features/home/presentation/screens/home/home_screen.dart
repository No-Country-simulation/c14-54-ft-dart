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
    PageController pageController = PageController();

    return Scaffold(
      body: PageView.builder(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        onPageChanged: (view) {
          ref.read(homeViewProvider.notifier).update((state) => view);
        },
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return views[ref.watch(homeViewProvider)];
        },
        itemCount: views.length,
      ),
      bottomNavigationBar: CustomBottomNavigatorBar(
        currentIndex: ref.watch(homeViewProvider),
      ),
    );
  }
}
