import 'package:audevi/apagar/homepage.dart';
import 'package:audevi/ui/styles/colors_app.dart';
import 'package:flutter/material.dart';

class ReceitasPage extends StatefulWidget {
  const ReceitasPage({super.key});

  @override
  State<ReceitasPage> createState() => _ReceitasPageState();
}

class _ReceitasPageState extends State<ReceitasPage> {
  final List<Map<String, String>> receitas = [
    {
      'titulo': 'Bolo de Chocolate',
      'imagem': 'assets/images/bolo.png',
    },
    {
      'titulo': 'Macarronada',
      'imagem': 'assets/images/macarronada.jpg',
    },
    {
      'titulo': 'Cuzcuz de leite',
      'imagem': 'assets/images/cuzcuz.png',
    },
    {
      'titulo': 'Pizza',
      'imagem': 'assets/images/pizza.jpg',
    }
    // Adicione mais receitas aqui
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      backgroundColor: context.colors.primary,
      drawer: DrawerMenu(),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Text(
            'Receitas',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.white, // Ajuste a cor do texto conforme necessário
            ),
          ),
          const SizedBox(height: 10), // Espaço entre o título e a lista
          Expanded(
            // Expande a lista para ocupar o espaço restante
            child: ListView.builder(
              itemCount: receitas.length,
              itemBuilder: (context, index) {
                final receita = receitas[index];
                return RecipeCard(receita: receita);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class RecipeCard extends StatelessWidget {
  final Map<String, String> receita;

  const RecipeCard({required this.receita});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          '/receita',
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
        child: Card(
          color: context.colors.secondary,
          child: Column(
            children: [
              Container(
                color: context.colors.secondary,
                padding: EdgeInsets.all(8.0), // Adicione padding para o texto
                child: Text(
                  receita['titulo']!,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  semanticsLabel: '${receita['titulo']}',
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: context.colors.secondary,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(
                        16), // Arredondar o canto inferior esquerdo
                    bottomRight: Radius.circular(
                        16), // Arredondar o canto inferior direito
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(16),
                    bottomRight: Radius.circular(16),
                  ),
                  child: Image.asset(
                    receita['imagem']!,
                    fit: BoxFit.cover,
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
