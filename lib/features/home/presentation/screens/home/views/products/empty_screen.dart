import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gestion_inventario/features/auth/presentation/providers/providers.dart';
import 'package:gestion_inventario/features/home/domain/domain.dart';
import 'package:gestion_inventario/features/home/presentation/providers/providers.dart';
import 'package:gestion_inventario/features/home/presentation/screens/screens.dart';
import 'package:gestion_inventario/features/shared/shared.dart';
import 'package:go_router/go_router.dart';

class EmptyScreen extends ConsumerStatefulWidget {
  static const route = 'empty';

  const EmptyScreen({
    super.key,
  });
  @override
  @override
  ConsumerState<EmptyScreen> createState() => _EmptyScreenState();
}

class _EmptyScreenState extends ConsumerState<EmptyScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final product = ref.watch(productFirebaseProvider).product;
    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _ProductImage(product: product),
              _ProductTitle(product: product),
              _Description(product: product),
              _Stock(product: product),
              _BasePrice(product: product),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          heroTag: 'save',
          onPressed: () async {
            final userId = ref.read(authProvider).user!.id;

            await ref
                .read(productFirebaseProvider.notifier)
                .createProduct(userId)
                .then(
              (productId) {
                try {
                  ref
                      .read(productFirebaseProvider.notifier)
                      .uploadImage(productId: productId, userId: userId);
                  customErrorMessage(context, 'Producto creado exitosamente');
                  context.pushReplacementNamed(
                    HomeScreen.route,
                  );
                } catch (e) {
                  customErrorMessage(context, e.toString());
                }
              },
            );

            await ref
                .read(productsFirebaseProvider.notifier)
                .loadProductsFirebase(ref.read(authProvider).user!.id);
          },
          child: const Icon(Icons.save),
        ));
  }
}

class _ProductImage extends ConsumerWidget {
  const _ProductImage({
    required this.product,
  });

  final ProductEntity product;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final image = ref.watch(productFirebaseProvider).imageUrl;
    final colors = Theme.of(context).colorScheme;

    return Stack(
      children: [
        AspectRatio(
          aspectRatio: 16 / 9,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Hero(
              tag: product.id,
              child: image == ''
                  ? Image.asset(
                      'assets/images/products/no-image.png',
                    )
                  : image.contains('http')
                      ? CachedNetworkImage(
                          imageUrl: image,
                          imageBuilder: (context, imageProvider) => Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: imageProvider,
                                fit: BoxFit.cover,
                                alignment: Alignment.center,
                              ),
                            ),
                          ),
                          placeholder: (context, url) =>
                              CircularProgressIndicator(
                            color: colors.secondary,
                          ),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        )
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.file(
                            File(image),
                            fit: BoxFit.cover,
                            alignment: Alignment.center,
                          ),
                        ),
            ),
          ),
        ),
        Positioned(
          right: 10,
          child: FloatingActionButton(
            heroTag: 'camera',
            onPressed: () async {
              ref.read(productFirebaseProvider.notifier).selectGalleryImage();
            },
            child: const Icon(
              Icons.camera_alt_outlined,
            ),
          ),
        ),
      ],
    );
  }
}

class _BasePrice extends ConsumerWidget {
  final ProductEntity product;
  const _BasePrice({
    required this.product,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Precio Base:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              Text(
                '\$${product.basePrice.toStringAsFixed(2)}',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ],
          ),
          const Divider(
            thickness: 1,
          ),
          CustomTextFormField(
            label: 'Precio Base',
            keyboardType: TextInputType.number,
            height: 20,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Ingrese una cantidad';
              }
              return null;
            },
            onChanged: (value) {
              ref
                  .read(productFirebaseProvider.notifier)
                  .onChangedBasePrice(num.tryParse(value) ?? 0.0);
            },
          ),
        ],
      ),
    );
  }
}

class _Stock extends ConsumerWidget {
  const _Stock({
    required this.product,
  });

  final ProductEntity product;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textStyle = Theme.of(context).textTheme;
    final colors = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Cantidad:',
                style: textStyle.titleLarge?.copyWith(
                  color: colors.primary,
                  fontFamily: 'roboto',
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                '${product.stock}',
                style: textStyle.titleLarge?.copyWith(
                  color: colors.primary,
                  fontFamily: 'roboto',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const Divider(
            thickness: 1,
          ),
          CustomTextFormField(
              label: 'Cantidad',
              keyboardType: TextInputType.number,
              height: 20,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Ingrese una cantidad';
                }
                return null;
              },
              onChanged: (value) => ref
                  .read(productFirebaseProvider.notifier)
                  .onChangedStock(int.tryParse(value) ?? 0)),
        ],
      ),
    );
  }
}

class _Description extends ConsumerWidget {
  const _Description({
    required this.product,
  });

  final ProductEntity product;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Descripción',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: colors.primary,
            ),
          ),
          const Divider(
            thickness: 1,
          ),
          Text(product.description),
          const SizedBox(
            height: 20,
          ),
          CustomTextFormField(
            label: 'Descripción',
            keyboardType: TextInputType.text,
            height: 40,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Ingrese una descripción';
              }
              return null;
            },
            onChanged: (value) {
              ref
                  .read(productFirebaseProvider.notifier)
                  .onChangedDescription(value);
            },
          ),
        ],
      ),
    );
  }
}

class _ProductTitle extends ConsumerWidget {
  const _ProductTitle({
    required this.product,
  });

  final ProductEntity product;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textStyle = Theme.of(context).textTheme;
    final colors = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  product.name,
                  textAlign: TextAlign.left,
                  style: textStyle.titleLarge?.copyWith(
                    fontFamily: 'roboto',
                    fontWeight: FontWeight.w500,
                    color: colors.secondary,
                  ),
                ),
                Text(
                  '\$${product.salePrice.toStringAsFixed(2)}',
                  style: textStyle.titleLarge?.copyWith(
                    color: colors.primary,
                    fontFamily: 'roboto',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          CustomTextFormField(
            label: 'Nombre',
            keyboardType: TextInputType.text,
            height: 10,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Ingrese una nombre';
              }
              return null;
            },
            onChanged: (value) {
              ref.read(productFirebaseProvider.notifier).onChangedName(value);
            },
          ),
          CustomTextFormField(
            label: 'Precio',
            keyboardType: TextInputType.number,
            height: 10,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Ingrese una cantidad';
              }
              return null;
            },
            onChanged: (value) {
              ref.read(productFirebaseProvider.notifier).onChangedSalePrice(
                    num.tryParse(value) ?? 0.0,
                  );
            },
          ),
        ],
      ),
    );
  }
}
