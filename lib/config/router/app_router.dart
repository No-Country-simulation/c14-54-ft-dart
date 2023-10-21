import 'package:gestion_inventario/features/auth/presentation/screens/onboarding_screen/onboarding.dart';
import 'package:gestion_inventario/features/data/screens/profile_page.dart';
import 'package:gestion_inventario/features/data/screens/register_page.dart';
import 'package:go_router/go_router.dart';
import 'package:gestion_inventario/features/auth/presentation/screens/screens.dart';

final appRouter = GoRouter(
  // initialLocation: '/P',
  initialLocation: '/onboarding',
  routes: [
    GoRoute(
      name: LoginScreen.route,
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),
     GoRoute(
      name: RegisterPage.route,
      path: '/R',
      builder: (context, state) => const RegisterPage(),
    ),
        GoRoute(
      name: ProfilePage.route,
      path: '/P',
      builder: (context, state) => const ProfilePage(),
    ),
    GoRoute(
      name: RegisterScreen.route,
      path: '/register',
      builder: (context, state) => const RegisterScreen(),
      // builder: (context, state) => const RegisterPage(),
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
