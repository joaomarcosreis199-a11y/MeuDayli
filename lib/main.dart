import 'package:flutter/material.dart';

void main() {
  runApp(MeuDiaApp());
}

class MeuDiaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meu Dia',
      theme: ThemeData(
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: Color(0xFFF5F7F8),
      ),
      home: PrincipalScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class PrincipalScreen extends StatefulWidget {
  @override
  State<PrincipalScreen> createState() => _PrincipalScreenState();
}

class _PrincipalScreenState extends State<PrincipalScreen> {
  int _indiceAtual = 0;

  final List<Widget> _telas = [
    DashboardTab(),
    TarefasTab(),
    FinancasTab(),
    SaudeTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meu Dia', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.green,
        actions: [
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.white),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Nenhuma notificação nova')),
              );
            },
          ),
        ],
      ),
      body: _telas[_indiceAtual],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indiceAtual,
        onTap: (index) {
          setState(() {
            _indiceAtual = index;
          });
        },
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Início'),
          BottomNavigationBarItem(icon: Icon(Icons.check_box), label: 'Tarefas'),
          BottomNavigationBarItem(icon: Icon(Icons.account_balance_wallet), label: 'Finanças'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Saúde'),
        ],
      ),
    );
  }
}

class DashboardTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(16.0),
      children: [
        Text(
          'Bom dia, João!',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 4),
        Text('Mais foco, menos estresse. Uma vida melhor.'),
        SizedBox(height: 20),
        Card(
          elevation: 2,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Visão Geral do Dia', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                SizedBox(height: 10),
                LinearProgressIndicator(value: 0.6, color: Colors.green),
                SizedBox(height: 8),
                Text('60% das tarefas concluídas hoje.'),
              ],
            ),
          ),
        ),
        SizedBox(height: 20),
        Text('Acesso Rápido', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _AcessoRapidoIcone(icone: Icons.check_circle, texto: 'Tarefas'),
            _AcessoRapidoIcone(icone: Icons.attach_money, texto: 'Finanças'),
            _AcessoRapidoIcone(icone: Icons.local_drink, texto: 'Água'),
            _AcessoRapidoIcone(icone: Icons.book, texto: 'Biblioteca'),
          ],
        ),
      ],
    );
  }
}

class _AcessoRapidoIcone extends StatelessWidget {
  final IconData icone;
  final String texto;

  _AcessoRapidoIcone({required this.icone, required this.texto});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 25,
          backgroundColor: Colors.green.shade100,
          child: Icon(icone, color: Colors.green.shade800),
        ),
        SizedBox(height: 6),
        Text(texto, style: TextStyle(fontSize: 12)),
      ],
    );
  }
}

class TarefasTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(16.0),
      children: [
        Text('Tarefas de Hoje', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        SizedBox(height: 10),
        CheckboxListTile(title: Text('Comprar pão na padaria'), value: true, onChanged: (v) {}),
        CheckboxListTile(title: Text('Reunião de trabalho às 14h'), value: false, onChanged: (v) {}),
        CheckboxListTile(title: Text('Passear com o cachorro'), value: false, onChanged: (v) {}),
      ],
    );
  }
}

class FinancasTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Saldo Atual', style: TextStyle(fontSize: 16, color: Colors.grey)),
          Text('R\$ 2.480,50', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.green)),
          SizedBox(height: 20),
          Text('Últimos Lançamentos', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Expanded(
            child: ListView(
              children: [
                ListTile(leading: Icon(Icons.remove_circle, color: Colors.red), title: Text('Supermercado'), subtitle: Text('Hoje'), trailing: Text('- R\$ 150,00')),
                ListTile(leading: Icon(Icons.add_circle, color: Colors.green), title: Text('Salário'), subtitle: Text('05/10'), trailing: Text('+ R\$ 3.000,00')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SaudeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(16.0),
      children: [
        Text('Monitoramento de Saúde', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        SizedBox(height: 15),
        ListTile(
          leading: Icon(Icons.local_drink, color: Colors.blue),
          title: Text('Água Consumida'),
          subtitle: Text('1.5L / 2.0L (Meta diária)'),
          trailing: Icon(Icons.add),
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.monitor_weight, color: Colors.orange),
          title: Text('Peso Atual'),
          subtitle: Text('78.5 kg'),
        ),
      ],
    );
  }
}
