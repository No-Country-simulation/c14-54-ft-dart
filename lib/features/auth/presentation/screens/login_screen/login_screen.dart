import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gestion_inventario/features/auth/presentation/providers/providers.dart';
import 'package:gestion_inventario/features/auth/presentation/screens/register_screen/register_screen.dart';
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
<<<<<<< HEAD
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
=======
    final loginForm = ref.watch(loginFormProvider);
    ref.listen(authProvider, (previous, next) {
      if (next.errorMessage.isEmpty) return;
      showSnackbar(context, next.errorMessage);
    });
>>>>>>> 109f5d6660fd29f34f71a18bb4bad283e58abdcc

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
          child: FormTitle(title: 'INICIA SESIÓN'),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              CustomTextFormField(
                label: 'Correo',
                hint: 'juandpt@mail.com',
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) =>
                    ref.read(loginFormProvider.notifier).onEmailChanged(value),
                errorMessage: loginForm.isFormPosted
                    ? loginForm.email.errorMessage
                    : null,
              ),
<<<<<<< HEAD
              const SizedBox(height: 30),
              emailL,
              passwordL,
              loginBtn,
=======
>>>>>>> 109f5d6660fd29f34f71a18bb4bad283e58abdcc
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
                onFieldSubmitted: (_) =>
                    ref.read(loginFormProvider.notifier).onFormSubmit(),
                obscureText: ref.watch(obscureTextProvider),
                onChanged: (value) => ref
                    .read(loginFormProvider.notifier)
                    .onPasswordChanged(value),
                errorMessage: loginForm.isFormPosted
                    ? loginForm.password.errorMessage
                    : null,
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
            onPressed: loginForm.isPosting
                ? null
                : ref.read(loginFormProvider.notifier).onFormSubmit,
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('¿No tienes cuenta?'),
            TextButton(
              onPressed: () {
                context.pushNamed(RegisterScreen.route);
                ref.invalidate(obscureTextProvider);
              },
              child: const Text('Crea una aquí'),
            )
          ],
        ),
      ],
    );
  }
}
