import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gestion_inventario/features/auth/presentation/widgets/widgets.dart';
import 'package:gestion_inventario/features/shared/widgets/shared.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatelessWidget {
  static const route = 'login_screen';

  const LoginScreen({super.key});

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
                  padding: EdgeInsets.only(
                    top: 150,
                    bottom: 80,
                  ),
                  child: FormIcon(),
                ),
                FormContainerBackground(
                  color: colors.background,
                  child: const _LoginForm(),
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}

class _LoginForm extends ConsumerWidget {
  const _LoginForm();
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
          child: FormTitle(title: 'INICIA SESIÓN'),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const CustomTextFormField(
                label: 'Correo',
                hint: 'juandpt@mail.com',
                keyboardType: TextInputType.emailAddress,
                onChanged: null,
                errorMessage: null,
              ),
              CustomTextFormField(
                label: 'Contraseña',
                subfixIcon: IconButton(
                  icon: const Icon(size: 25, FontAwesomeIcons.eye),
                  onPressed: () {},
                ),
                onFieldSubmitted: null,
                obscureText: true,
                onChanged: null,
                errorMessage: null,
              ),
              Align(
                alignment: Alignment.topRight,
                child: TextButton(
                  onPressed: () {},
                  child: const Text('¿Olvidaste tu contraseña?'),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: 250,
          height: 60,
          child: CustomFilledButton(
            text: 'INGRESAR',
            buttonColor: colors.primary,
            onPressed: () {},
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('¿No tienes cuenta?'),
            TextButton(
              onPressed: () => context.push('/register'),
              child: const Text('Crea una aquí'),
            )
          ],
        ),
      ],
    );
  }
}
