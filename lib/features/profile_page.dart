import 'package:flutter/material.dart';
import 'package:audevi/ui/styles/colors_app.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Cabeçalho do perfil com tamanho fixo
          Container(
            height: 200, // Define uma altura fixa para o cabeçalho
            color: context.colors.primary,
            child: Stack(
              children: [
                // Imagem alinhada ao canto inferior esquerdo
                Positioned(
                  bottom: -23,
                  left: screenWidth * 0.05, // Ajusta o espaçamento lateral
                  child: Semantics(
                    label: 'Logotipo do aplicativo',
                    child: Image.asset(
                      'assets/images/logo4.png',
                      width: 160,
                      height: 180,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                // Texto alinhado na parte inferior, ao lado da imagem
                Positioned(
                  bottom: 40, // Ajuste conforme necessário para alinhar o texto
                  left: screenWidth * 0.55, // Espaçamento em relação à imagem
                  child: Semantics(
                    label: 'Nome do usuário: Fulano de Talesson',
                    child: Text(
                      'Fulano de \n Talesson',
                      style: TextStyle(
                        color: context.colors.tertiary,
                        fontFamily: 'Exo',
                        fontSize: screenWidth * 0.06,
                        fontWeight: FontWeight.w900,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Lista de opções de configurações
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(8),
              children: [
                _buildListItem(Icons.notifications, 'Notificações',
                    'Minha central de notificações'),
                const Divider(),
                _buildListItem(Icons.newspaper_outlined, 'Dados da conta',
                    'Informações pessoais, emails e senhas'),
                const Divider(),
                _buildListItem(
                    Icons.credit_card, 'Pagamentos', 'Saldos e cartões'),
                const Divider(),
                _buildListItem(Icons.subscriptions, 'Assinaturas',
                    'Planos e receitas adaptadas'),
                const Divider(),
                _buildListItem(Icons.settings, 'Configurações',
                    'Preferências do aplicativo'),
                const Divider(),
                _buildListItem(Icons.help, 'Ajuda', 'Central de suporte'),
                const Divider(),
                _buildListItem(Icons.logout, 'Sair', 'Desconectar da conta'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Função para construir os itens da lista
  Widget _buildListItem(IconData icon, String title, String subtitle) {
    return Semantics(
      label: '$title, $subtitle',
      child: ListTile(
        leading: Icon(icon, color: ColorsApp.instance.primary, size: 30),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle),
      ),
    );
  }
}
