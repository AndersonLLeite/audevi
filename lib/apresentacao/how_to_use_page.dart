import 'package:audevi/ui/styles/colors_app.dart';
import 'package:audevi/widgets/logo.dart';
import 'package:flutter/material.dart';

class HowToUsePage extends StatelessWidget {
  const HowToUsePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.primary,
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 100),
                // Logo com Semantics
                Logo(),
                const SizedBox(height: 20.0),
                // Título com Semantics
                Semantics(
                  label: 'Título:',
                  child: const Text(
                    'Como funciona',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Exo",
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                // Texto explicativo com Semantics
                Semantics(
                  label: 'Descrição:',
                  child: const Text(
                    'Este app funciona através do seu comando de voz, aperte no botão de áudio, diga qual unidade de medida você deseja obter e o que você está pesando, que a balança responder via áudio o que você deseja saber.',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontFamily: "Exo",
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Botão de voltar com Semantics
          Positioned(
            bottom: 25,
            left: 20,
            child: Semantics(
              label: 'voltar',
              button: true,
              onTapHint: 'Pressione para voltar à página anterior',
              child: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.white, size: 40),
                onPressed: () {
                  Navigator.pushNamed(context, '/how-to-use');
                },
              ),
            ),
          ),
          // Botão de avançar com Semantics
          Positioned(
            bottom: 25,
            right: 20,
            child: Semantics(
              label: 'avançar',
              button: true,
              onTapHint: 'Pressione para ir para a página da balança',
              child: IconButton(
                icon: Icon(Icons.arrow_forward, color: Colors.white, size: 40),
                onPressed: () {
                  Navigator.pushNamed(context, '/searching');
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
