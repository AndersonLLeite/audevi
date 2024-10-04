import 'package:audevi/features/profile_page.dart';
import 'package:audevi/features/receita.dart';
import 'package:audevi/features/recipe_page.dart';
import 'package:audevi/features/scale_page.dart';
import 'package:audevi/ui/styles/colors_app.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();
  bool isReceitaPage = false;

  // Função para atualizar o índice selecionado
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _pageController.jumpToPage(index);
  }

  void _changeReceitaPageToFalse() {
    setState(() {
      isReceitaPage = false;
    });
  }

  void _changeReceitaPageToTrue() {
    setState(() {
      isReceitaPage = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
            if (index == 1) {
              _changeReceitaPageToFalse();
            }
          });
        },
        children: [
          ScalePage(), // Tela da balança
          isReceitaPage
              ? Receita()
              : RecipePage(
                  onChangeToReceita:
                      _changeReceitaPageToTrue), // Tela de receitas
          ProfilePage(),
        ],
      ),
      // Barra de navegação inferior com imagens e barra indicativa
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          BottomNavigationBar(
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
            selectedLabelStyle: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w900,
              color: context.colors.secondary,
              fontFamily: 'Exo',
            ),
            unselectedLabelStyle: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
              color: context.colors.secondary,
              fontFamily: 'Exo',
            ),
            items: [
              BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/images/weight.png',
                  width: 35,
                  height: 35,
                ),
                label: 'Balança',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/images/book.png',
                  width: 35,
                  height: 35,
                ),
                label: 'Receitas',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/images/person.png',
                  width: 35,
                  height: 35,
                ),
                label: 'Perfil',
              ),
            ],
          ),
          Row(
            children: [
              Container(
                height: 15,
                width: MediaQuery.of(context).size.width / 3,
                color: _selectedIndex == 0
                    ? context.colors.primary
                    : context.colors.secondary,
                margin: const EdgeInsets.only(bottom: 10),
              ),
              Container(
                height: 15,
                width: MediaQuery.of(context).size.width / 3,
                color: _selectedIndex == 1
                    ? context.colors.primary
                    : context.colors.secondary,
                margin: const EdgeInsets.only(bottom: 10),
              ),
              Container(
                height: 15,
                width: MediaQuery.of(context).size.width / 3,
                color: _selectedIndex == 2
                    ? context.colors.primary
                    : context.colors.secondary,
                margin: const EdgeInsets.only(bottom: 10),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
