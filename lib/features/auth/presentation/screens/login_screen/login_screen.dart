import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gestion_inventario/features/auth/presentation/widgets/widgets.dart';
// import 'package:gestion_inventario/features/data/api/entities/user_emp.dart';
import 'package:gestion_inventario/features/data/api/repository/firebase_api.dart';
import 'package:gestion_inventario/features/shared/widgets/shared.dart';
import 'package:go_router/go_router.dart';
import 'package:logging/logging.dart';

class LoginScreen extends StatelessWidget {
  static const route = 'login_screen';

  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
          body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            const CustomBackground(color: Colors.blue),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 80),
              child: _LoginIcon(),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: size.height / 2 - 50,
              ),
              child: FormContainerBackground(
                color: colors.background,
                child: const _LoginForm(),
              ),
            ),
          ],
        ),
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
      height: 150,
      width: 150,
      decoration: BoxDecoration(
        color: colors.primary,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Icon(
        Icons.person_4_rounded,
        color: colors.surface,
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
    final email = TextEditingController();
    final password = TextEditingController();
    // UserEnt Userload = UserEnt.Empty();
    final FirebaseApi firebaseApi = FirebaseApi();
    void validate() async {
      try {
        var result = await firebaseApi.logInUser(email.text, password.text);
        Logger(result.toString());
        // () => context.push('/api');
        void got() => context.push('/api');
        got();
        //  Navigator.pushReplacement(
        //       context, MaterialPageRoute(builder: (context) => const ScreenProduct()));
      } catch (e) {
        Logger("FirebaseException  $e");
      }
    }

    final colors = Theme.of(context).colorScheme;
    final emailL = TextFormField(
      controller: email,
      decoration: const InputDecoration(
        icon: Icon(Icons.email),
        border: OutlineInputBorder(
            borderRadius:  BorderRadius.all( Radius.circular(80.0))),
        labelText: 'Email',
      ),
      // obscureText: true,
      keyboardType: TextInputType.emailAddress,
    );

    final passwordL = TextField(
        controller: password,
        keyboardType: TextInputType.visiblePassword,
        obscureText: true,
        decoration: const InputDecoration(
          icon: Icon(Icons.lock_open_outlined),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(80.0))),
          hintText: 'Password',
        ));

    final loginBtn = ElevatedButton(
        style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
          // side: BorderSide(color: Colors.red)
        ))),
        onPressed: () {
          // _validateUser();
          validate();
          // print("login");
        },
        child: const Text("Iniciar sesion"));
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
              emailL,
              passwordL,
              loginBtn,
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
            ],
          ),
        ),
        const SizedBox(height: 50),
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
        const Spacer(flex: 1),
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
