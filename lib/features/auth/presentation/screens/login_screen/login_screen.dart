import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
                  child: _LoginIcon(),
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

class _LoginIcon extends StatelessWidget {
  const _LoginIcon();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Container(
      height: 120,
      width: 120,
      decoration: BoxDecoration(
        color: colors.background,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Icon(
        Icons.person_4_rounded,
        color: colors.primary,
        size: 100,
      ),
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
          child: _TitleForm(),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const CustomTextFormField(
                label: 'Correo',
                hint: 'juan@gmail.com',
                keyboardType: TextInputType.emailAddress,
                onChanged: null,
                errorMessage: null,
              ),
              const SizedBox(height: 30),
              CustomTextFormField(
                label: 'Contraseña',
                subfixIcon: IconButton(
                  icon: const Icon(
                    size: 30,
                    Icons.remove_red_eye_outlined,
                  ),
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
            text: 'Ingresar',
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

class _TitleForm extends StatelessWidget {
  const _TitleForm();

  @override
  Widget build(BuildContext context) {
    final textStyles = Theme.of(context).textTheme;
    final colors = Theme.of(context).colorScheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const _BackgroundLine(),
        const SizedBox(
          width: 10,
        ),
        Text(
          'LOGIN',
          style: textStyles.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
            color: colors.primary,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        const _BackgroundLine(),
      ],
    );
  }
}

class _BackgroundLine extends StatelessWidget {
  const _BackgroundLine();

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: LinePainter(),
      size: const Size(120, 3),
    );
  }
}

class LinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.black87;
    final startPoint = Offset(0, size.height / 2);
    final endPoint = Offset(size.width, size.height / 2);
    canvas.drawLine(startPoint, endPoint, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
