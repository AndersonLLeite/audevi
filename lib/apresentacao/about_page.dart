import 'package:audevi/ui/styles/colors_app.dart';
import 'package:audevi/widgets/logo.dart';
import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

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
                Semantics(
                  label: 'Logo do AUDEVI',
                  child: Logo(),
                ),
                const SizedBox(height: 20.0),
                Semantics(
                  label: 'Título:',
                  child: Text(
                    'Sobre o app',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Exo",
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                Semantics(
                  label: 'Descrição:',
                  child: Text(
                    'Bem-vindo ao AUDEVI, somos uma empresa que busca auxiliar você a realizar suas receitas favoritas.',
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
          Positioned(
            bottom: 25,
            right: 20,
            child: Semantics(
              label: 'avançar',
              button: true,
              child: IconButton(
                icon: Icon(Icons.arrow_forward, color: Colors.white, size: 40),
                onPressed: () {
                  Navigator.pushNamed(context, '/how-to-use');
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
