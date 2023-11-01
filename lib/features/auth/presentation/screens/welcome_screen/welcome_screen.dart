import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gestion_inventario/features/auth/presentation/providers/providers.dart';

import 'package:gestion_inventario/features/home/presentation/providers/providers.dart';
import 'package:gestion_inventario/features/home/presentation/screens/screens.dart';
import 'package:gestion_inventario/features/shared/shared.dart';
import 'package:go_router/go_router.dart';
import 'welcome.dart';

class WelcomeScreen extends ConsumerStatefulWidget {
  static const route = 'welcome_screen';
  const WelcomeScreen({super.key});

  @override
  ConsumerState<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends ConsumerState<WelcomeScreen> {
  @override
  void initState() {
    super.initState();
    ref.read(authProvider.notifier).updateUser();
  }

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(authProvider).user;
    final path = ref.watch(profileImageProvider).path;

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
          GestureDetector(
            onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
            child: SafeArea(
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      _WelcomeTitle(text: 'Hola ${user!.username}'),
                      const SizedBox(
                        height: 10,
                      ),
                      const _WelcomeSubTitle(
                          text: 'Bienvenido a Gestión de inventarios de'),
                      const SizedBox(
                        height: 10,
                      ),
                      _WelcomeTitle(text: user.businessname),
                      _ProfilePicture(path: path),
                      CustomFilledButton(
                        text: 'Elige foto de perfil',
                        buttonColor: colors.background,
                        textStyle: textStyle,
                        onPressed: () async {
                          await ref
                              .read(profileImageProvider.notifier)
                              .selectGalleryImage();
                        },
                      ),
                      CustomFilledButton(
                        text: 'Guardar',
                        buttonColor: colors.background,
                        textStyle: textStyle,
                        onPressed: () async {
                          final url = ref.read(profileImageProvider).path;
                          await ref
                              .read(profileImageProvider.notifier)
                              .uploadImage(id: user.id)
                              .whenComplete(() {
                            if (url != '') {
                              return customErrorMessage(
                                  context, 'Imagen guardada con exito');
                            } else {
                              return customErrorMessage(context, url);
                            }
                          });
                        },
                      ),
                      const SizedBox(
                        height: 100,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: CustomTextFormField(
                          label: 'Link de descarga de archivo csv',
                          hint: 'http://bit.ly/3Sc2v46',
                          onChanged: (link) {
                            return ref
                                .read(linkCsvProvider.notifier)
                                .update((state) => link);
                          },
                        ),
                      ),
                      CustomFilledButton(
                        text: 'Cargar Inventario',
                        buttonColor: colors.background,
                        textStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: colors.primary,
                        ),
                        onPressed: () async {
                          await ref
                              .read(loadCsvProvider.notifier)
                              .loadCsvByQuery(
                                ref.read(linkCsvProvider),
                              )
                              .then((response) async {
                            if (response.isNotEmpty) {
                              await ref
                                  .read(loadCsvProvider.notifier)
                                  .upLoadProductsFirebase(response, user.id)
                                  .then(
                                    (_) => context.pushReplacementNamed(
                                      HomeScreen.route,
                                      pathParameters: {'userId': user.id},
                                    ),
                                  );
                            } else {
                              return customErrorMessage(context,
                                  'Error en el formato no se pudo cargar el archivo');
                            }
                          });
                        },
                      ),
                      TextButton(
                        onPressed: () {
                          context.pushReplacementNamed(
                            HomeScreen.route,
                            pathParameters: {'userId': user.id},
                          );
                        },
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
        shadows: [
          BoxShadow(
            color: colors.shadow.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ]);

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
        fontSize: 20,
        fontWeight: FontWeight.w500,
        shadows: [
          BoxShadow(
            color: colors.shadow.withOpacity(0.8),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ]);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Text(
        text,
        style: textStyle,
        textAlign: TextAlign.center,
      ),
    );
  }
}

class _ProfilePicture extends ConsumerWidget {
  final String path;
  const _ProfilePicture({required this.path});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = Theme.of(context).colorScheme;

    return Container(
      margin: const EdgeInsets.only(top: 50, bottom: 10),
      decoration: BoxDecoration(
        color: colors.secondaryContainer,
        borderRadius: BorderRadius.circular(100),
      ),
      height: 150,
      width: 150,
      child: path == ''
          ? SvgPicture.asset(
              'assets/images/user/profile/profile.svg',
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(colors.primary, BlendMode.srcIn),
            )
          : path.contains('http')
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                      color: colors.secondaryContainer.withOpacity(0.4),
                    ),
                    child: CachedNetworkImage(
                      imageUrl: path,
                      imageBuilder: (context, imageProvider) => Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                            alignment: Alignment.center,
                          ),
                        ),
                      ),
                      placeholder: (context, url) => CircularProgressIndicator(
                        color: colors.secondary,
                      ),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  ),
                )
              : ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.file(
                    File(path),
                    fit: BoxFit.cover,
                    alignment: Alignment.center,
                  ),
                ),
    );
  }
}
