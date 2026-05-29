// ============================================================
// Tarefa: TextField Replicado + Lista de Nomes
// Cole este arquivo em lib/main.dart e execute: flutter run
// ============================================================

import 'package:flutter/material.dart';

void main() {
  runApp(const AppNativo());
}

class AppNativo extends StatelessWidget {
  const AppNativo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Nativo 0.0.1',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const TelaPrincipal(),
    );
  }
}

class TelaPrincipal extends StatefulWidget {
  const TelaPrincipal({super.key});

  @override
  State<TelaPrincipal> createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  // Um único controlador compartilhado pelos dois campos.
  // Isso garante que o que se digita em um reflete no outro.
  final TextEditingController _controller = TextEditingController();

  // Lista de nomes importantes na história da computação
  final List<Map<String, String>> _nomes = [
    {'nome': 'Ada Lovelace',        'desc': 'Primeira programadora da história'},
    {'nome': 'Alan Turing',         'desc': 'Pai da ciência da computação'},
    {'nome': 'Grace Hopper',        'desc': 'Criadora do primeiro compilador'},
    {'nome': 'Tim Berners-Lee',     'desc': 'Inventor da World Wide Web'},
    {'nome': 'Katherine Johnson',   'desc': 'Matemática da NASA'},
    {'nome': 'Dennis Ritchie',      'desc': 'Criador da linguagem C'},
    {'nome': 'Margaret Hamilton',   'desc': 'Software do Apollo 11'},
    {'nome': 'Linus Torvalds',      'desc': 'Criador do Linux'},
    {'nome': 'Hedy Lamarr',         'desc': 'Pioneira do Wi-Fi e Bluetooth'},
    {'nome': 'John von Neumann',    'desc': 'Arquitetura dos computadores modernos'},
  ];

  @override
  void dispose() {
    // Libera o controlador da memória ao sair da tela.
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ── AppBar ────────────────────────────────────────────
      appBar: AppBar(
        title: const Text(
          'App Nativo 0.0.1',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue,
        elevation: 4,
      ),

      // ── Body ──────────────────────────────────────────────
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [

            // ── Lista de nomes — centralizada e alinhada à direita ──
            Expanded(
              child: ListView.builder(
                itemCount: _nomes.length,
                itemBuilder: (context, index) {
                  return Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.85,
                      child: Card(
                        elevation: 2,
                        margin: const EdgeInsets.symmetric(vertical: 4),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 10),
                          child: Column(
                            // Alinha o texto à direita dentro do card
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                _nomes[index]['nome']!,
                                textAlign: TextAlign.right,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue,
                                ),
                              ),
                              Text(
                                _nomes[index]['desc']!,
                                textAlign: TextAlign.right,
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.black54,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 16),
            const Divider(),
            const SizedBox(height: 8),

            // ── TextField normal ──────────────────────────────
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'TextField',
                hintText: 'Digite algo...',
                prefixIcon: Icon(Icons.edit),
                filled: true,
                fillColor: Color(0xFFF0F4FF),
              ),
            ),

            const SizedBox(height: 12),

            // ── OutlinedTextField ─────────────────────────────
            // Mesmo _controller = valor duplicado automaticamente
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'OutlinedTextField (duplicado)',
                hintText: 'Reflete o campo acima...',
                prefixIcon: Icon(Icons.edit_note),
                border: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue, width: 1.5),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue, width: 2.5),
                ),
              ),
            ),

            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}