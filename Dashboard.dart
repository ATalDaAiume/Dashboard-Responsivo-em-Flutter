import 'package:flutter/material.dart';

void main() {
  runApp(const MeuDashboardApp());
}

class MeuDashboardApp extends StatelessWidget {
  const MeuDashboardApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dashboard Responsivo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        scaffoldBackgroundColor: Colors.grey.shade50,
      ),
      home: const DashboardHome(),
    );
  }
}

class DashboardHome extends StatelessWidget {
  const DashboardHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // BÔNUS: Verificando a Orientação da tela
    bool isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Dashboard Responsivo 📊',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.5,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.deepPurple.shade600),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(radius: 30, backgroundColor: Colors.white, child: Icon(Icons.person, size: 35, color: Colors.deepPurple)),
                  SizedBox(height: 10),
                  Text('Menu Principal', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            const ListTile(leading: Icon(Icons.dashboard), title: Text('Dashboard')),
            const ListTile(leading: Icon(Icons.settings), title: Text('Configurações')),
          ],
        ),
      ),
      
      body: LayoutBuilder(
        builder: (context, constraints) {
          Widget layoutDeCards;

          // 1. Criando os 4 Cards de Informação
          List<Widget> cards = [
            const DashboardCard(title: 'Vendas', value: 'R\$ 15.000', icon: Icons.shopping_cart, color: Colors.blue),
            const DashboardCard(title: 'Usuários', value: '1.234', icon: Icons.people_alt, color: Colors.orange),
            const DashboardCard(title: 'Acessos', value: '8.560', icon: Icons.touch_app, color: Colors.purple),
            const DashboardCard(title: 'Conversão', value: '3,2%', icon: Icons.trending_up, color: Colors.green),
          ];

          // 2. Layout Responsivo
          if (constraints.maxWidth < 600) {
            layoutDeCards = Column(
              key: const ValueKey('mobile_layout'),
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: cards,
            );
          } else if (constraints.maxWidth < 900) {
            layoutDeCards = Wrap(
              key: const ValueKey('tablet_layout'),
              alignment: WrapAlignment.center,
              spacing: 8,
              runSpacing: 8,
              children: cards.map((c) => SizedBox(width: (constraints.maxWidth / 2) - 20, child: c)).toList(),
            );
          } else {
            layoutDeCards = Row(
              key: const ValueKey('desktop_layout'),
              children: cards.map((c) => Expanded(child: c)).toList(),
            );
          }

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 500),
                  transitionBuilder: (Widget child, Animation<double> animation) {
                    return FadeTransition(opacity: animation, child: child);
                  },
                  child: layoutDeCards,
                ),
                
                const SizedBox(height: 32),
                
                Text(
                  'Desempenho Anual (${isLandscape ? "Modo Paisagem 🔄" : "Modo Retrato 📱"})', 
                  style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black87)
                ),
                const SizedBox(height: 16),
                
                const GraficoSimplesStack(),
              ],
            ),
          );
        },
      ),
    );
  }
}

// Widget Reutilizável DashboardCard
class DashboardCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color color;

  const DashboardCard({
    Key? key,
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
      padding: const EdgeInsets.all(24.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(color: color.withValues(alpha: 0.2), blurRadius: 10, offset: const Offset(0, 5)),
        ],
        border: Border.all(color: color.withValues(alpha: 0.3), width: 1.5),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(color: color.withValues(alpha: 0.1), shape: BoxShape.circle),
            child: Icon(icon, size: 36, color: color),
          ),
          const SizedBox(height: 16),
          Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.grey)),
          const SizedBox(height: 8),
          Text(value, style: TextStyle(fontSize: 26, fontWeight: FontWeight.w900, color: color)),
        ],
      ),
    );
  }
}

// Componente Gráfico usando Stack
class GraficoSimplesStack extends StatelessWidget {
  const GraficoSimplesStack({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(color: Colors.grey.withValues(alpha: 0.1), blurRadius: 10, offset: const Offset(0, 5))
        ],
      ),
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(5, (index) => Container(height: 1, color: Colors.grey.shade200)),
          ),
          Positioned(bottom: 0, left: 20, child: _buildBarra(120, Colors.blue, 'Trim 1')),
          Positioned(bottom: 0, left: 100, child: _buildBarra(180, Colors.orange, 'Trim 2')),
          Positioned(bottom: 0, left: 180, child: _buildBarra(90, Colors.purple, 'Trim 3')),
          Positioned(bottom: 0, left: 260, child: _buildBarra(150, Colors.green, 'Trim 4')),
        ],
      ),
    );
  }

  Widget _buildBarra(double altura, Color cor, String rotulo) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: 45,
          height: altura,
          decoration: BoxDecoration(
            color: cor,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
          ),
        ),
        const SizedBox(height: 8),
        Text(rotulo, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black54)),
      ],
    );
  }
}
