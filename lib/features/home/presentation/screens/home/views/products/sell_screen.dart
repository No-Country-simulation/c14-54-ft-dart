import 'package:flutter/material.dart';
import 'package:gestion_inventario/features/shared/shared.dart';
import 'package:gestion_inventario/features/shared/widgets/custom_text_form_field.dart';
import 'package:go_router/go_router.dart';

class SellScreen extends StatelessWidget {
  static const route = 'sell';
  const SellScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
              keyboardType: TextInputType.number,
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomFilledButton(text: 'Confirmar', onPressed: () {}),
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
