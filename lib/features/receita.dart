import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:audevi/ui/styles/colors_app.dart';

class Receita extends StatefulWidget {
  const Receita({super.key});

  @override
  State<Receita> createState() => _ReceitaState();
}

class _ReceitaState extends State<Receita> {
  late AudioPlayer audioPlayer;
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();
    audioPlayer = AudioPlayer();

    // Configura o modo de liberação do player
    audioPlayer.setReleaseMode(ReleaseMode.stop);

    // Listener para saber quando a reprodução termina
    audioPlayer.onPlayerComplete.listen((event) {
      setState(() {
        isPlaying = false; // Atualiza o estado de reprodução
      });
    });
  }

  @override
  void dispose() {
    // Libera os recursos do player quando a tela é destruída
    audioPlayer.dispose();
    super.dispose();
  }

  Future<void> _playPauseAudio() async {
    if (isPlaying) {
      await audioPlayer.pause(); // Pausa a reprodução
      setState(() {
        isPlaying = false;
      });
    } else {
      // Reproduz o áudio local a partir dos assets
      await audioPlayer.play(AssetSource('audio/bolo.wav'));
      setState(() {
        isPlaying = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Cabeçalho
          Container(
            height: 50,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
              color: context.colors.tertiary, // Cor do cabeçalho
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
            ),
          ),
          // Imagem do bolo de chocolate
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.grey, // Cor de fundo do container da imagem
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
              ),
              margin: const EdgeInsets.symmetric(vertical: 20),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(15)),
                child: Image.asset(
                  'assets/images/bolo.png', // Caminho da imagem do bolo
                  fit: BoxFit.fill,
                  height: 180, // Altura da imagem
                  width: double.infinity, // Largura da imagem
                ),
              ),
            ),
          ),
          // Título
          const Text(
            'Bolo de chocolate', // Título da receita
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          // Conteúdo com Scroll
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors
                      .grey[200], // Cor de fundo para o container do texto
                  borderRadius:
                      BorderRadius.circular(12), // Bordas arredondadas
                ),
                child: Scrollbar(
                  thumbVisibility: true, // Barra de rolagem visível
                  thickness: 5, // Tamanho da barra de rolagem
                  radius: const Radius.circular(12), // Arredondamento da barra
                  child: ListView(
                    padding: const EdgeInsets.all(8.0),
                    children: [
                      Semantics(
                        label:
                            'Receita de Bolo de Chocolate com Ingredientes e Modo de Preparo',
                        child: Text(
                          'INGREDIENTES BOLO\n\n'
                          '2 xícaras de farinha de trigo\n'
                          '¾ xícara de cacau em pó\n'
                          '1 e ½ colheres de chá de fermento em pó\n'
                          '1 e ½ colheres de chá de bicarbonato de sódio\n'
                          '1 colher de chá de sal\n'
                          '1 e ½ xícaras de açúcar\n'
                          '2 ovos grandes\n'
                          '1 xícara de leite integral\n'
                          '½ xícara de óleo vegetal\n'
                          '2 colheres de chá de extrato de baunilha\n'
                          '1 xícara de água fervente\n\n'
                          'INGREDIENTES COBERTURA\n\n'
                          '200g de chocolate meio amargo\n'
                          '1 caixinha de creme de leite\n'
                          '1 colher de sopa de manteiga\n'
                          '2 colheres de sopa de mel (opcional)\n\n'
                          'MODO DE PREPARO\n\n'
                          'Para preparar um bolo de chocolate, comece pré-aquecendo o forno a 180°C. '
                          'Em uma tigela grande, peneire 2 xícaras de farinha de trigo, ¾ xícara de cacau em pó, '
                          '1 e ½ colheres de chá de fermento em pó, 1 e ½ colheres de chá de bicarbonato de sódio '
                          'e 1 colher de chá de sal. Adicione 1 e ½ xícaras de açúcar e misture bem. '
                          'Em outra tigela, bata 2 ovos grandes, 1 xícara de leite integral, ½ xícara de óleo vegetal '
                          'e 2 colheres de chá de extrato de baunilha até a mistura ficar homogênea. Junte os líquidos '
                          'aos secos e mexa até incorporar. Depois, adicione 1 xícara de água fervente e misture novamente. '
                          'Despeje a massa em uma forma redonda de aproximadamente 22cm de diâmetro untada com manteiga e farinha, '
                          'e asse o bolo por cerca de 30 a 35 minutos, até que um palito inserido no centro saia limpo. '
                          'Deixe o bolo esfriar por 10 minutos antes de desenformá-lo.\n\n'
                          'Enquanto o bolo esfria, prepare a cobertura. Derreta 200g de chocolate meio amargo em banho-maria '
                          'ou no micro-ondas e misture com o creme de leite, a manteiga e o mel (opcional). '
                          'Quando o bolo estiver completamente frio, espalhe a ganache sobre ele com uma espátula. '
                          'Para finalizar, decore com raspas de chocolate ou frutas, se desejar.',
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          // Botão de áudio
          Semantics(
            label: isPlaying ? 'Pausar áudio' : 'Tocar áudio',
            child: Container(
              height: 110,
              width: 110,
              decoration: BoxDecoration(
                color: context.colors.tertiary,
                borderRadius: BorderRadius.circular(12),
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
                onPressed: _playPauseAudio,
                icon: Icon(isPlaying ? Icons.pause : Icons.volume_down_alt),
                color: Colors.white,
                iconSize: 80,
              ),
            ),
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
