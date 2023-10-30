import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';

class CustomBottomNavigatorBar extends StatelessWidget {
  const CustomBottomNavigatorBar({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: DotNavigationBar(
        selectedItemColor: colors.primary,
        unselectedItemColor: colors.secondary,
        paddingR: const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
        marginR: const EdgeInsets.symmetric(horizontal: 30, vertical: 0),
        backgroundColor: Colors.black12,
        currentIndex: 1,
        enablePaddingAnimation: true,

        onTap: (index) {},
        // dotIndicatorColor: Colors.black,
        items: [
          /// Home
          DotNavigationBarItem(
            icon: const Icon(Icons.home),
          ),

          /// Likes
          DotNavigationBarItem(
            icon: const Icon(Icons.favorite_border),
          ),

          /// Search
          DotNavigationBarItem(
            icon: const Icon(Icons.search),
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
