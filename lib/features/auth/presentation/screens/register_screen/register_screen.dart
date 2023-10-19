import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gestion_inventario/features/auth/presentation/providers/providers.dart';
import 'package:gestion_inventario/features/auth/presentation/screens/screens.dart';
import 'package:gestion_inventario/features/auth/presentation/widgets/widgets.dart';
import 'package:gestion_inventario/features/shared/widgets/shared.dart';
import 'package:go_router/go_router.dart';

class RegisterScreen extends StatelessWidget {
  static const route = 'register_screen';
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
          body: Stack(
        alignment: Alignment.topCenter,
        children: [
          SingleChildScrollView(
              child: CustomBackground(
            color: colors.primary,
          )),
          SingleChildScrollView(
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 30),
                  child: FormIcon(scale: 0.8, icon: Icons.person_2),
                ),
                FormContainerBackground(
                  color: colors.background,
                  child: const _RegisterForm(),
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}

class _RegisterForm extends ConsumerWidget {
  const _RegisterForm();
  void showSnackbar(BuildContext context, String errorMessage) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(errorMessage),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = Theme.of(context).colorScheme;

    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 30),
          child: FormTitle(title: 'REGÍSTRATE'),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const CustomTextFormField(
                label: 'Nombre de usuario',
                hint: 'juandpt',
                keyboardType: TextInputType.name,
                onChanged: null,
                errorMessage: null,
              ),
              const CustomTextFormField(
                label: 'Correo',
                hint: 'juandpt@mail.com',
                keyboardType: TextInputType.emailAddress,
                onChanged: null,
                errorMessage: null,
              ),
              const CustomTextFormField(
                label: 'Teléfono',
                hint: '3123456789',
                keyboardType: TextInputType.phone,
                onChanged: null,
                errorMessage: null,
              ),
              CustomTextFormField(
                label: 'Contraseña',
                subfixIcon: IconButton(
                  icon: ref.watch(obscureTextProvider)
                      ? const Icon(size: 25, FontAwesomeIcons.eye)
                      : const Icon(
                          FontAwesomeIcons.eyeSlash,
                          size: 25,
                        ),
                  onPressed: () {
                    ref
                        .read(obscureTextProvider.notifier)
                        .update((state) => !state);
                  },
                ),
                onFieldSubmitted: null,
                obscureText: ref.watch(obscureTextProvider),
                onChanged: null,
                errorMessage: null,
              ),
              CustomTextFormField(
                label: 'Confirme la contraseña',
                subfixIcon: IconButton(
                  icon: ref.watch(obscureTextProvider)
                      ? const Icon(size: 25, FontAwesomeIcons.eye)
                      : const Icon(
                          FontAwesomeIcons.eyeSlash,
                          size: 25,
                        ),
                  onPressed: () {
                    ref
                        .read(obscureTextProvider.notifier)
                        .update((state) => !state);
                  },
                ),
                onFieldSubmitted: null,
                obscureText: ref.watch(obscureTextProvider),
                onChanged: null,
                errorMessage: null,
              ),
            ],
          ),
        ),
        SizedBox(
          width: 250,
          height: 60,
          child: CustomFilledButton(
            text: 'CONFIRMAR',
            buttonColor: colors.primary,
            onPressed: () {},
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('¿Ya tienes cuenta?'),
            TextButton(
              onPressed: () {
                context.pushNamed(LoginScreen.route);
                ref.invalidate(obscureTextProvider);
              },
              child: const Text('Inicia sesión'),
            )
          ],
        ),
      ],
    );
  }
}
