import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gestion_inventario/features/home/presentation/providers/providers.dart';

class CustomBottomNavigatorBar extends ConsumerWidget {
  final int currentIndex;
  const CustomBottomNavigatorBar({
    super.key,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: DotNavigationBar(
        selectedItemColor: colors.primary,
        unselectedItemColor: colors.secondary,
        paddingR: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        marginR: const EdgeInsets.symmetric(horizontal: 30, vertical: 0),
        backgroundColor: Colors.black12,
        currentIndex: currentIndex,
        enablePaddingAnimation: true,
        onTap: (index) {
          ref.read(homeViewProvider.notifier).update((state) => index);
        },
        items: [
          /// Home
          DotNavigationBarItem(
            icon: const Icon(FontAwesomeIcons.sellsy),
          ),

          /// Likes
          DotNavigationBarItem(
            icon: const Icon(Icons.inventory_outlined),
          ),

          /// Search
          DotNavigationBarItem(
            icon: const Icon(FontAwesomeIcons.book),
          ),

          /// Profile
          DotNavigationBarItem(
            icon: const Icon(Icons.person),
          ),
        ],
      ),
    );
  }
}
