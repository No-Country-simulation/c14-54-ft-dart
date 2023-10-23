import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gestion_inventario/features/auth/presentation/providers/auth_providers/auth_provider.dart';
import 'package:gestion_inventario/features/shared/shared.dart';
import 'welcome.dart';

class WelcomeScreen extends ConsumerWidget {
  static const route = 'welcome_screen';
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authProvider).user;

    final colors = Theme.of(context).colorScheme;
    final textStyle = Theme.of(context)
        .textTheme
        .bodyMedium!
        .copyWith(color: colors.primary, fontWeight: FontWeight.bold);
    return Scaffold(
      body: Stack(
        children: [
          WelcomeBackground(
            color: colors.primary,
          ),
          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _WelcomeTitle(text: 'Hola ${user!.displayName}'),
                    const SizedBox(
                      height: 10,
                    ),
                    const _WelcomeSubTitle(
                        text: 'Bienvenido a Gestión de inventarios'),
                    const _ProfilePicture(
                        path: 'assets/images/user/profile/profile.svg'),
                    CustomFilledButton(
                      text: 'Cambiar imagen de perfil',
                      buttonColor: colors.background,
                      textStyle: textStyle,
                      onPressed: () {},
                    ),
                    const SizedBox(
                      height: 100,
                    ),
                    CustomFilledButton(
                      text: 'Hola mundo',
                      buttonColor: colors.background,
                      textStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: colors.primary,
                      ),
                      onPressed: () {},
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Saltar',
                        style: TextStyle(
                          color: colors.background,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _WelcomeTitle extends StatelessWidget {
  final String text;
  const _WelcomeTitle({required this.text});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final textStyle = Theme.of(context).textTheme.titleLarge!.copyWith(
          color: colors.background,
          fontSize: 35,
          fontWeight: FontWeight.bold,
        );
    return Text(
      text,
      style: textStyle,
    );
  }
}

class _WelcomeSubTitle extends StatelessWidget {
  final String text;
  const _WelcomeSubTitle({required this.text});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final textStyle = Theme.of(context).textTheme.bodyMedium!.copyWith(
          color: colors.background,
          fontSize: 18,
          fontWeight: FontWeight.w400,
        );
    return Text(
      text,
      style: textStyle,
    );
  }
}

class _ProfilePicture extends StatelessWidget {
  final String path;
  const _ProfilePicture({required this.path});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 50),
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: colors.background,
        borderRadius: BorderRadius.circular(250),
      ),
      height: 100,
      width: 100,
      child: SvgPicture.asset(
        path,
        fit: BoxFit.cover,
        colorFilter: ColorFilter.mode(colors.primary, BlendMode.srcIn),
      ),
    );
  }
}
