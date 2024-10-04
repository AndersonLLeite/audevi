import 'package:audevi/ui/styles/colors_app.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  bool isRecording = false; // Indica se está gravando ou não
  String recordedText = ''; // Texto a ser preenchido no campo de entrada
  String peso = '0.000'; // Peso atual

  // Função para simular gravação de voz
  void startRecording() {
    setState(() {
      isRecording = true; // Começa a gravação
    });

    // Simula um atraso de 3 segundos para "gravação"
    Timer(const Duration(seconds: 3), () {
      setState(() {
        isRecording = false; // Termina a gravação
        recordedText =
            'quero 0.250 gramas'; // Preenche o campo de texto com valor simulado
        peso = '0.250'; // Atualiza o peso
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF003b4d), // Cor de fundo
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Builder(
          builder: (BuildContext context) {
            return Semantics(
              label: 'Menu',
              child: IconButton(
                iconSize: 60, // Aumenta o tamanho do ícone do menu
                icon: Icon(Icons.menu, color: Colors.white),
                onPressed: () {
                  Scaffold.of(context).openDrawer(); // Abre o drawer
                },
              ),
            );
          },
        ),
        centerTitle: true,
        title: Image.asset(
          'assets/images/Variant2.png', // Caminho para o ícone no centro da AppBar
          height: 50,
        ),
      ),

      // Cabeçalho com a imagem e botão de fechar
      drawer: DrawerMenu(),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 70),
              // Display de peso
              Semantics(
                label: '${"Peso atual:" + peso + "quilogramas"}',
                hint: 'Tela de exibição do peso',
                child: Container(
                  height: 250,
                  decoration: BoxDecoration(
                    color: const Color(0xFFd0dde2), // Cor do display
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Stack(
                    children: [
                      // Texto do peso
                      Center(
                        child: Text(
                          peso, // Valor de exemplo
                          style: TextStyle(
                            fontFamily: 'Digital', // Utilize uma fonte digital
                            fontSize: 75,
                            color: const Color(0xFF003b4d), // Cor dos números
                          ),
                        ),
                      ),
                      // Container com o KG na parte inferior direita
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: const Color(0xFFd0dde2),
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: const Color(0xFF003b4d), // Cor da borda
                              width: 10,
                            ),
                          ),
                          child: Text(
                            'KG',
                            style: TextStyle(
                              color: const Color(0xFF003b4d),
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30),
              // Campo de entrada de texto com botão de envio
              Semantics(
                label: 'Campo de entrada para peso desejado',
                hint: 'Digite o valor do peso desejado',
                textField: true,
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 50),
                        decoration: BoxDecoration(
                          color: const Color(0xFFd0dde2), // Fundo cinza claro
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: TextField(
                          controller: TextEditingController(text: recordedText),
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: '', // Texto vazio
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              // Botão de microfone
              Semantics(
                label: 'Botão de comando por voz',
                button: true,
                child: GestureDetector(
                  onTap: startRecording,
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: const Color(0xFFd0dde2),
                      shape: BoxShape.circle,
                    ),
                    child: isRecording
                        ? const CircularProgressIndicator() // Animação durante a gravação
                        : Icon(
                            Icons.mic,
                            color: const Color(0xFF003b4d),
                            size: 100,
                          ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: context.colors.secondary,
        child: Column(
          children: [
            // Cabeçalho com a imagem e botão de fechar
            DrawerHeader(
              decoration: BoxDecoration(
                color: context.colors.secondary,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Imagem do logo no Drawer
                  Image.asset(
                    'assets/images/logo_drawer.png', // Imagem no Drawer
                    height: 80,
                    width: 220,
                  ),
                  // Botão de fechar o Drawer
                  Semantics(
                    label: 'Fechar Menu',
                    hint: 'Botão para fechar o menu lateral',
                    button: true,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop(); // Fecha o Drawer
                      },
                      child: Image.asset(
                        'assets/images/back.png', // Ícone de fechar o Drawer
                        height: 40,
                        width: 40,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Opção de navegação - Início
            Semantics(
              hint: 'Ir para a tela inicial',
              button: true,
              child: ListTile(
                leading: Image.asset(
                  'assets/images/inicio.png', // Ícone da tela de início
                  height: 30,
                ),
                title: const Text('Início'),
                onTap: () {
                  Navigator.pushNamed(context, '/homepage');
                },
              ),
            ),
            const Divider(),
            // Opção de navegação - Receitas
            Semantics(
              hint: 'Ir para a tela de receitas',
              button: true,
              child: ListTile(
                leading: Image.asset(
                  'assets/images/receita.png', // Ícone da tela de receitas
                  height: 30,
                ),
                title: const Text('Receitas'),
                onTap: () {
                  Navigator.pushNamed(context, '/receitas');
                },
              ),
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }
}
