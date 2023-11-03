import 'package:gestion_inventario/features/home/presentation/screens/screens.dart';

import 'package:gestion_inventario/features/auth/presentation/screens/screens.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      name: OnBoardingScreen.route,
      path: '/',
      builder: (context, state) => const OnBoardingScreen(),
      routes: [
        GoRoute(
          name: LoginScreen.route,
          path: 'login',
          builder: (context, state) => const LoginScreen(),
        ),
        GoRoute(
          name: RegisterScreen.route,
          path: 'register',
          builder: (context, state) => const RegisterScreen(),
        ),
        GoRoute(
          name: WelcomeScreen.route,
          path: 'welcome',
          builder: (context, state) => const WelcomeScreen(),
        ),
        GoRoute(
            name: HomeScreen.route,
            path: 'home',
            builder: (context, state) {
              return const HomeScreen();
            },
            routes: [
              GoRoute(
                name: ProductsView.route,
                path: 'products',
                builder: (context, state) {
                  return const ProductsView();
                },
                routes: [
                  GoRoute(
                    name: ProductScreen.route,
                    path: ':productId',
                    builder: (context, state) {
                      final String productId =
                          state.pathParameters['productId'] ?? '';
                      return ProductScreen(
                        productId: productId,
                      );
                    },
                  ),
                ],
              ),
            ]),
      ],
    ),
  ],
);
