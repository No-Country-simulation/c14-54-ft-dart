import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gestion_inventario/features/auth/presentation/providers/providers.dart';
import 'package:gestion_inventario/features/auth/presentation/screens/screens.dart';
import 'package:gestion_inventario/features/shared/widgets/shared.dart';
import 'package:go_router/go_router.dart';
import 'onboarding.dart';

class OnBoardingScreen extends ConsumerWidget {
  static const route = 'onboarding_screen';

  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageController = PageController();
    final colors = Theme.of(context).colorScheme;
    final pageInt = ref.watch(paginationProvider);

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView(
              onPageChanged: (value) {
                ref.read(paginationProvider.notifier).update((state) => value);
              },
              controller: pageController,
              scrollDirection: Axis.horizontal,
              children: const [
                FirstScreen(),
                SecondScreen(),
                ThirdScreen(),
              ],
            ),
          ),
          _Pagination(pageInt: pageInt),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Align(
              alignment: Alignment.bottomRight,
              child: pageInt != 2
                  ? _OnboardingButton(
                      pageController: pageController,
                      text: ref.watch(textButtonProvider),
                      color: colors.secondary,
                    )
                  : FadeInRight(
                      duration: const Duration(milliseconds: 500),
                      child: _OnboardingButton(
                        pageController: pageController,
                        color: colors.primary,
                        text: 'COMENZAR',
                      ),
                    ),
            ),
          )
        ],
      ),
    );
  }
}

class _Pagination extends StatelessWidget {
  const _Pagination({
    required this.pageInt,
  });

  final int pageInt;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _Pagina(
          active: pageInt == 0 ? true : false,
          displacement: 5,
        ),
        _Pagina(
          active: pageInt == 1 ? true : false,
          displacement: 5,
        ),
        _Pagina(
          active: pageInt == 2 ? true : false,
          displacement: 0,
        ),
      ],
    );
  }
}

class _OnboardingButton extends StatelessWidget {
  final Color color;
  final String text;
  const _OnboardingButton({
    required this.pageController,
    required this.text,
    required this.color,
  });

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    final textStyle = Theme.of(context).textTheme.bodySmall!.copyWith(
          color: colors.background,
          fontWeight: FontWeight.bold,
        );
    return CustomFilledButton(
      buttonColor: color,
      text: text,
      textStyle: textStyle,
      onPressed: () {
        if ((pageController.position.pixels) >=
            pageController.position.maxScrollExtent) {
          context.pushReplacementNamed(LoginScreen.route);
        } else {
          pageController.nextPage(
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeIn,
          );
        }
      },
    );
  }
}

class _Pagina extends StatelessWidget {
  final bool active;
  final double displacement;

  const _Pagina({
    required this.active,
    required this.displacement,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Container(
      margin: EdgeInsets.only(right: displacement),
      height: 10,
      width: 10,
      decoration: BoxDecoration(
        color: active ? colors.primary : colors.secondary,
        borderRadius: BorderRadius.circular(200),
      ),
    );
  }
}
