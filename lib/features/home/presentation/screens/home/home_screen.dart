import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gestion_inventario/features/auth/domain/entities/user_entity.dart';
import 'package:gestion_inventario/features/auth/presentation/providers/providers.dart';
import 'package:gestion_inventario/features/auth/presentation/screens/screens.dart';
import 'package:gestion_inventario/features/home/presentation/providers/providers.dart';
import 'package:gestion_inventario/features/home/presentation/screens/screens.dart';
import 'package:gestion_inventario/features/shared/shared.dart';
import 'package:go_router/go_router.dart';

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
    final user = ref.watch(authProvider).user!;
    final colors = Theme.of(context).colorScheme;
    final textStyle = Theme.of(context).textTheme.titleMedium;
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: Drawer(
        width: size.width * 0.5,
        elevation: 10,
        child: Column(
          children: [
            DrawerHeader(
              child: Column(
                children: [
                  Text(
                    user.businessname,
                    style: textStyle?.copyWith(
                      shadows: [
                        Shadow(
                          offset: const Offset(3, 2),
                          color: colors.secondary.withOpacity(0.4),
                          blurRadius: 10,
                        ),
                      ],
                    ),
                  ),
                  user.photoPath == ''
                      ? _SvgPicture(colors: colors)
                      : user.photoPath!.contains('http')
                          ? _NetworkImage(colors: colors, user: user)
                          : _LocalImage(user: user),
                ],
              ),
            ),
            Text(
              user.username,
              style: textStyle?.copyWith(fontSize: 15),
            ),
            Text(
              user.email,
              style: textStyle?.copyWith(fontSize: 15),
            ),
            const SizedBox(height: 20),
            CustomFilledButton(
                text: 'Editar Perfil',
                onPressed: () {
                  context.pushNamed(WelcomeScreen.route);
                }),
            TextButton(
              style: TextButton.styleFrom(backgroundColor: colors.onPrimary),
              child: const Text('Cerrar Sesión'),
              onPressed: () {
                context.pushReplacementNamed(LoginScreen.route);
              },
            ),
          ],
        ),
      ),
      body: IndexedStack(
        index: ref.watch(homeViewProvider),
        children: const [
          View0(),
          View1(),
          ProductsView(),
          ChatScreen(),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigatorBar(
        currentIndex: ref.watch(homeViewProvider),
      ),
    );
  }
}

class _LocalImage extends StatelessWidget {
  const _LocalImage({
    required this.user,
  });

  final UserEntity user;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(100),
      child: Image.file(
        File(user.photoPath!),
        fit: BoxFit.cover,
        alignment: Alignment.center,
      ),
    );
  }
}

class _NetworkImage extends StatelessWidget {
  const _NetworkImage({
    required this.colors,
    required this.user,
  });

  final ColorScheme colors;
  final UserEntity user;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(100),
      child: Container(
        height: 100,
        width: 100,
        decoration: BoxDecoration(
          color: colors.secondaryContainer.withOpacity(0.4),
        ),
        child: CachedNetworkImage(
          imageUrl: user.photoPath!,
          imageBuilder: (context, imageProvider) => Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.cover,
                alignment: Alignment.center,
              ),
            ),
          ),
          placeholder: (context, url) => CircularProgressIndicator(
            color: colors.secondary,
          ),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
      ),
    );
  }
}

class _SvgPicture extends StatelessWidget {
  const _SvgPicture({
    required this.colors,
  });

  final ColorScheme colors;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/images/user/profile/profile.svg',
      fit: BoxFit.cover,
      colorFilter: ColorFilter.mode(colors.primary, BlendMode.srcIn),
    );
  }
}
