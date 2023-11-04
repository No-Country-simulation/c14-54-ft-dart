import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gestion_inventario/features/auth/presentation/providers/providers.dart';
import 'package:gestion_inventario/features/home/presentation/providers/providers.dart';
import 'package:gestion_inventario/features/shared/shared.dart';

import 'package:go_router/go_router.dart';

class SellScreen extends ConsumerWidget {
  static const route = 'sell';
  const SellScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userId = ref.watch(authProvider).user!.id;
    final productId = ref.watch(productFirebaseProvider).product.id;
    final colors = Theme.of(context).colorScheme;
    return AlertDialog(
      title: const Text('¿Cuantas Unidades Desea vender?'),
      content: SizedBox(
        height: 150,
        width: 200,
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Cantidad',
                hintText: '10',
              ),
              onChanged: (quanty) {
                ref
                    .read(productFirebaseProvider.notifier)
                    .onChangedQuantity(num.tryParse(quanty) ?? 0);
              },
              keyboardType: TextInputType.number,
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomFilledButton(
                    text: 'Confirmar',
                    onPressed: () async {
                      await ref
                          .read(productFirebaseProvider.notifier)
                          .sellProduct(
                            userId: userId,
                            date: DateTime.utc(
                              DateTime.now().year,
                              DateTime.now().month,
                              DateTime.now().day,
                            ),
                          )
                          .then((resultado) {
                        ref
                            .read(productFirebaseProvider.notifier)
                            .loadProductbyIdFirebase(
                                id: productId, userId: userId);
                        ref
                            .read(productsFirebaseProvider.notifier)
                            .loadProductsFirebase(userId);

                        customErrorMessage(context, resultado);
                        context.pop();
                      });
                    }),
                CustomFilledButton(
                  text: 'Cancelar',
                  onPressed: () {
                    context.pop();
                  },
                  buttonColor: colors.secondary,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
