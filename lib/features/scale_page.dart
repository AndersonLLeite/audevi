import 'dart:math';
import 'package:audevi/ui/styles/colors_app.dart';
import 'package:audevi/widgets/logo.dart';
import 'package:audio_wave/audio_wave.dart';
import 'package:flutter/material.dart';
import 'dart:async'; // Para o temporizador

class ScalePage extends StatefulWidget {
  const ScalePage({super.key});

  @override
  State<ScalePage> createState() => _ScalePageState();
}

class _ScalePageState extends State<ScalePage> {
  String weightText = '0.000'; // Texto inicial do peso
  bool isRecording = false; // Estado para controlar se o microfone está ativo

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Stack(
            clipBehavior: Clip
                .none, // Permite que o Positioned exceda os limites do Stack
            children: [
              Container(
                height: 220,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: context.colors.secondary,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Logo(
                    isMini: true,
                    isPrimary: true,
                  ),
                ],
              ),
              Positioned(
                bottom:
                    -70, // Posiciona a lista para que metade dela sobreponha o container
                left: 0,
                right: 0,
                child: SizedBox(
                  height: 150,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      recipeItem('assets/images/cuzcuz.png', 'Cuscuz'),
                      recipeItem('assets/images/pizza.jpg', 'Pizza'),
                      recipeItem('assets/images/feijoada.jpg', 'Feijoada'),
                      recipeItem('assets/images/bolo.png', 'Bolo'),
                      recipeItem(
                          'assets/images/macarronada.jpg', 'Macarronada'),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
              height: 50), // Espaço para acomodar a lista que está sobrepondo
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Container(
                  height: 200,
                  decoration: BoxDecoration(
                    color: context.colors.secondary, // Cor do display
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        top: isRecording ? 50 : 20,
                        left: isRecording ? 55 : 20,
                        child: isRecording
                            ? AudioWave(
                                bars: List.generate(
                                  12,
                                  (index) {
                                    final randomHeight = Random().nextDouble();
                                    return AudioWaveBar(
                                      heightFactor: randomHeight,
                                      color: context.colors.primary,
                                    );
                                  },
                                ),
                                height: 50,
                                width: 150,
                                animationLoop: 3,
                              )
                            : Semantics(
                                label: 'Peso atual: $weightText gramas',
                                child: Text(
                                  weightText, // Valor de exemplo
                                  style: const TextStyle(
                                    fontFamily: 'Digital',
                                    fontSize: 70,
                                    color: Color(0xFF003b4d), // Cor dos números
                                  ),
                                ),
                              ),
                      ),
                      Positioned(
                        bottom: -6,
                        right: -15,
                        child: Container(
                          width: 100,
                          height: 70,
                          padding: const EdgeInsets.all(11),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(21),
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              color: context.colors.secondary,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Center(
                              child: Text(
                                'g',
                                style: TextStyle(
                                  color: Color(0xFF003b4d),
                                  fontSize: 30,
                                  fontWeight: FontWeight.w900,
                                  fontFamily: 'Exo',
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 50, top: 10),
            child: Semantics(
              label: 'Botão de gravação de peso',
              child: Container(
                height: 120,
                width: 125,
                decoration: BoxDecoration(
                  color: context.colors.tertiary,
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: IconButton(
                  iconSize: 90,
                  icon: const Icon(Icons.mic, color: Colors.white),
                  onPressed: () {
                    startRecording(); // Iniciar a gravação
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void startRecording() {
    setState(() {
      isRecording = true;
      weightText = ''; // Esvazia o valor atual
    });

    Timer(const Duration(seconds: 5), () {
      setState(() {
        isRecording = false;
        weightText = '0.200'; // Atualiza o valor do peso
      });
    });
  }

  Widget recipeItem(String imagePath, String label) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Semantics(
        label: label, // Acessibilidade para cada item da receita
        child: Column(
          children: [
            Stack(children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(imagePath,
                    width: 100, height: 100, fit: BoxFit.cover),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Stack(children: [
                  Container(
                    height: 40,
                    width: 40,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    child: Container(
                      height: 12,
                      width: 40,
                      decoration: BoxDecoration(
                        color: context.colors.secondary,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(6),
                            topLeft: Radius.circular(6)),
                      ),
                    ),
                  )
                ]),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Icon(Icons.volume_down,
                    color: context.colors.primary, size: 40),
              ),
            ]),
            const SizedBox(height: 5),
            Text(label, style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
