import 'package:audevi/ui/styles/colors_app.dart';
import 'package:flutter/material.dart';

class RecipePage extends StatelessWidget {
  final VoidCallback onChangeToReceita;

  const RecipePage({super.key, required this.onChangeToReceita});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Logo no topo
          Container(
            padding: const EdgeInsets.symmetric(vertical: 20),
            color: context.colors.tertiary,
            child: Center(
              child: Image.asset(
                'assets/images/logo3.png', // Substitua pelo caminho da sua logo
                width: 260,
                height: 200,
                semanticLabel: 'Logo da aplicação', // Semântica para a logo
              ),
            ),
          ),

          // Grid de receitas
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.75, // Proporção para ajustar as imagens
                children: [
                  _buildRecipeCard('Bolo de chocolate', '60 min',
                      'assets/images/bolo.png', context),
                  _buildRecipeCard('Cuscuz recheado', '30 min',
                      'assets/images/cuzcuz.png', context),
                  _buildRecipeCard('Pizza marguerita', '60 min',
                      'assets/images/pizza.jpg', context),
                  _buildRecipeCard('Feijoada', '30 min',
                      'assets/images/feijoada.jpg', context),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Função para construir um card de receita
  Widget _buildRecipeCard(
      String title, String time, String imagePath, BuildContext context) {
    return GestureDetector(
      onTap: () {
        onChangeToReceita();
      },
      child: Semantics(
        label: '$title, tempo de preparo $time', // Descrição semântica do card
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.cover,
                    semanticLabel: title, // Descrição semântica da imagem
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 4),
                    Text(
                      time,
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
