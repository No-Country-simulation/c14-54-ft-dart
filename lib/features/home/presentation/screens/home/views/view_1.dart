import 'package:flutter/material.dart';
import 'package:gestion_inventario/features/shared/shared.dart';

class View1 extends StatelessWidget {
  const View1({super.key});
  static const route = 'view_1';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Calculadora de rentabilidad'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 30),
                child: CustomTextFormField(
                  marginBottom: 0,
                  label: 'Ingrese sus costos fijos',
                  keyboardType: TextInputType.number,
                  hint: '1000',
                ),
              ),
              CustomFilledButton(
                  text: 'Calcular',
                  onPressed: () {
                    return customErrorMessage(
                        context, 'Aun faltan \$200 para ser rentable');
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
