import 'package:go_router/go_router.dart';

import 'package:gestion_inventario/features/auth/presentation/screens/screens.dart';

final appRouter = GoRouter(
  initialLocation: '/login',
  routes: [
    GoRoute(
      name: LoginScreen.route,
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    )
  ],
);
