import 'package:audevi/apagar/homepage.dart';
import 'package:audevi/ui/styles/colors_app.dart';
import 'package:audevi/ui/styles/text_styles.dart';
import 'package:audevi/widgets/button.dart';
import 'package:audevi/widgets/logo.dart';
import 'package:flutter/material.dart';

class SearchingPage extends StatefulWidget {
  const SearchingPage({Key? key}) : super(key: key);

  @override
  _SearchingPageState createState() => _SearchingPageState();
}

class _SearchingPageState extends State<SearchingPage>
    with TickerProviderStateMixin {
  late AnimationController _searchController;
  late AnimationController _expandController;
  late Animation<double> _expandAnimation;

  bool _isExpanding = false;

  @override
  void initState() {
    super.initState();

    // Controlador para a animação de busca (pulsação da logo)
    _searchController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat(reverse: true);

    // Inicialize apenas o AnimationController, mas não o Tween/Animation
    _expandController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // Agora, dentro do didChangeDependencies, o MediaQuery já estará disponível
    _expandAnimation =
        Tween<double>(begin: 200, end: MediaQuery.of(context).size.height)
            .animate(_expandController)
          ..addListener(() {
            setState(() {});
          })
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              // Quando a expansão terminar, navega para a próxima página
              Navigator.pushReplacementNamed(context, '/bluetooth');
            }
          });
  }

  @override
  void dispose() {
    _searchController.dispose();
    _expandController.dispose();
    super.dispose();
  }

  void _expandHeader() {
    setState(() {
      _isExpanding = true;
    });
    _expandController.forward(); // Iniciar a animação de expansão
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.secondary,
      body: Stack(
        children: [
          // Conteúdo da tela principal, que some quando a expansão começa
          if (!_isExpanding)
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(height: 280),
                  Column(children: [
                    ScaleTransition(
                      scale: Tween(begin: 1.0, end: 1.2).animate(
                          CurvedAnimation(
                              parent: _searchController,
                              curve: Curves.easeInOut)),
                      child: Semantics(
                        label: 'Logo Audevi em pulsação',
                        child: Image.asset(
                            'assets/images/logo-down.png'), // Logo que será animada
                      ),
                    ),
                    const SizedBox(height: 20),
                    Semantics(
                      child: Text(
                        'PROCURANDO...',
                        style: context.textStyles.title
                            .copyWith(color: context.colors.primary),
                      ),
                    ),
                  ]),
                  const SizedBox(height: 50),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Semantics(
                      button: true,
                      child: SimpleButton(
                        label: 'CONECTE A BALANÇA AUDEVI',
                        onPressed: _expandHeader,
                        isSecondary: false,
                      ),
                    ),
                  ),
                ],
              ),
            ),

          // Parte superior com o logo curvado, que expande
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: AnimatedBuilder(
              animation: _expandAnimation,
              builder: (context, child) {
                return CustomPaint(
                  painter: _HeaderPainter(), // Desenho curvado
                  child: Container(
                    height: _expandAnimation.value, // Altura animada
                    child: Center(
                      child: Logo(),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _HeaderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = ColorsApp.instance.primary // Cor da parte superior
      ..style = PaintingStyle.fill;

    final path = Path();
    path.moveTo(0, 0);
    path.lineTo(0, size.height - 80); // Ajuste para a curva ficar mais visível
    path.quadraticBezierTo(
      size.width / 2, size.height, // Ponto de controle e final da curva
      size.width, size.height - 80, // Ponto final da curva
    );
    path.lineTo(size.width, 0); // Fechar o caminho à direita
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
