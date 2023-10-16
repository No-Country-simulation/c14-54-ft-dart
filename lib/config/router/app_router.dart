import 'package:gestion_inventario/features/auth/presentation/screens/onboarding_screen/onboarding.dart';
import 'package:go_router/go_router.dart';
import 'package:gestion_inventario/features/auth/presentation/screens/screens.dart';

final appRouter = GoRouter(
  initialLocation: '/onboarding',
  routes: [
    GoRoute(
      name: LoginScreen.route,
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      name: RegisterScreen.route,
      path: '/register',
      builder: (context, state) => const RegisterScreen(),
    ),
    GoRoute(
        name: OnBoardingScreen.route,
        path: '/onboarding',
        builder: (context, state) => const OnBoardingScreen(),
        routes: [
          GoRoute(
              name: FirstScreen.route,
              path: 'first_screen',
              builder: (context, state) => const FirstScreen()),
          GoRoute(
            name: SecondScreen.route,
            path: 'second_screen',
            builder: (context, state) => const SecondScreen(),
          ),
          GoRoute(
            name: ThirdScreen.route,
            path: 'third_screen',
            builder: (context, state) => const ThirdScreen(),
          ),
        ]),
    GoRoute(
      name: WelcomeScreen.route,
      path: '/welcome_screen',
      builder: (context, state) => const WelcomeScreen(),
    ),
  ],
);
