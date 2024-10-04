import 'package:audevi/ui/styles/colors_app.dart';
import 'package:flutter/material.dart';

class SimpleButton extends StatelessWidget {
  final String label; // Texto do botão
  final VoidCallback onPressed; // Função a ser chamada ao pressionar o botão
  final bool isSecondary; // Indica se o botão é secundário

  const SimpleButton({
    Key? key,
    required this.label,
    required this.onPressed,
    this.isSecondary = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
          decoration: BoxDecoration(
            color: isSecondary
                ? context.colors.secondary
                : context.colors.primary, // Cor de fundo do botão
            borderRadius: BorderRadius.circular(46.0), // Bordas arredondadas
          ),
          child: Text(
            label,
            style: TextStyle(
                fontWeight: FontWeight.w900,
                color: isSecondary
                    ? context.colors.primary
                    : context.colors.secondary, // Cor do texto
                fontSize: 16,
                fontFamily: 'Exo' // Tamanho da fonte
                ),
          ),
        ),
      ),
    );
  }
}
