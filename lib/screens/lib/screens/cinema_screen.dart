import 'package:flutter/material.dart';

class CinemaScreen extends StatefulWidget {
  const CinemaScreen({Key? key}) : super(key: key);

  @override
  State<CinemaScreen> createState() => _CinemaScreenState();
}

class _CinemaScreenState extends State<CinemaScreen> {
  final _movieTitleController = TextEditingController(text: 'Toy Story 5');
  final _shoppingController = TextEditingController(text: 'Kinoplex Madureira');
  final _seatController = TextEditingController(text: 'G12, G13');
  final _ticketPriceController = TextEditingController(text: '35.00');
  final _foodPriceController = TextEditingController(text: '25.00');
  final _transportPriceController = TextEditingController(text: '10.00');

  DateTime _watchDate = DateTime.now();
  TimeOfDay _watchTime = const TimeOfDay(hour: 17, minute: 50);
  
  String _audioOption = 'DUBLADO';
  bool _setAlarm = true;
  bool _isWatched = false;
  String? _userRating;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cinema & Hobbies - Meudayli'),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Detalhes da Sessão', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.green)),
                    const SizedBox(height: 12),
                    TextField(
                      controller: _movieTitleController,
                      decoration: const InputDecoration(labelText: 'Nome do Filme', prefixIcon: Icon(Icons.movie)),
                    ),
                    const SizedBox(height: 12),
                    TextField(
                      controller: _shoppingController,
                      decoration: const InputDecoration(labelText: 'Cinema / Shopping', prefixIcon: Icon(Icons.location_on)),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _seatController,
                            decoration: const InputDecoration(labelText: 'Assento(s)', prefixIcon: Icon(Icons.event_seat)),
                          ),
                        ),
                        const SizedBox(width: 12),
                        DropdownButton<String>(
                          value: _audioOption,
                          items: <String>['DUBLADO', 'LEGENDADO'].map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            setState(() => _audioOption = newValue!);
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Custos do Rolê / Finanças', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.green)),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _ticketPriceController,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(labelText: 'Ingresso (R$)', prefixIcon: Icon(Icons.confirmation_number)),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: TextField(
                            controller: _foodPriceController,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(labelText: 'Pipoca/Comida', prefixIcon: Icon(Icons.fastfood)),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    TextField(
                      controller: _transportPriceController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(labelText: 'Transporte (Uber/Gasolina)', prefixIcon: Icon(Icons.directions_car)),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    CheckboxListTile(
                      title: const Text('Já assisti (Marcar como Visto)', style: TextStyle(fontWeight: FontWeight.bold)),
                      subtitle: const Text('Envia os gastos diretamente para o Gráfico de Lazer e Finanças'),
                      value: _isWatched,
                      activeColor: Colors.green,
                      onChanged: (val) {
                        setState(() => _isWatched = val ?? false);
                      },
                    ),
                    if (_isWatched) ...[
                      const Divider(),
                      const Text('O que achou do filme?'),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            icon: Icon(Icons.thumb_up, color: _userRating == 'Gostei' ? Colors.green : Colors.grey),
                            onPressed: () => setState(() => _userRating = 'Gostei'),
                          ),
                          const Text('Gostei'),
                          const SizedBox(width: 20),
                          IconButton(
                            icon: Icon(Icons.thumb_down, color: _userRating == 'Não Gostei' ? Colors.red : Colors.grey),
                            onPressed: () => setState(() => _userRating = 'Não Gostei'),
                          ),
                          const Text('Não Gostei'),
                        ],
                      ),
                    ]
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Dados salvos com sucesso!')),
                  );
                },
                child: const Text('Salvar no Meudayli', style: TextStyle(color: Colors.white, fontSize: 16)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
