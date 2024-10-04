import 'package:audevi/widgets/button.dart';
import 'package:audevi/ui/styles/colors_app.dart';
import 'package:audevi/ui/styles/text_styles.dart';
import 'package:audevi/widgets/logo.dart';
import 'package:flutter/material.dart';

class BluetoothConnectionPage extends StatelessWidget {
  const BluetoothConnectionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.primary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // Logo com Semantics
            Logo(),
            Column(
              children: [
                // Imagem com Semantics
                Image.asset('assets/images/logo-secondary.png'),
                const SizedBox(height: 15),
                // Texto CONECTADO com Semantics
                Semantics(
                  label: 'Status:',
                  child: Text(
                    'CONECTADO',
                    style: context.textStyles.title
                        .copyWith(color: context.colors.secondary),
                  ),
                ),
              ],
            ),
            // Botão com Semantics
            Semantics(
              button: true,
              child: SimpleButton(
                label: 'COMEÇAR A COZINHAR',
                isSecondary: true,
                onPressed: () {
                  Navigator.pushNamed(context, '/homepage');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
