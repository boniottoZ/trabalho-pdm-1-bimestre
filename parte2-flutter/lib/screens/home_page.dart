import 'package:flutter/material.dart';
import '../models/instrumento.dart';
import '../models/instrumento_eletronico.dart';
import '../models/loja.dart';
import 'widgets/cartao_instrumento.dart';
import 'detalhe_page.dart';
import 'cadastro_page.dart';

/// Exercício 5 — Estrutura de tela
/// Recurso obrigatório: Scaffold com AppBar
/// Conceito obrigatório: Column com mainAxisAlignment e crossAxisAlignment
///
/// Exercício 10 — Estado
/// Recurso obrigatório: StatefulWidget
/// Conceito obrigatório: setState
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Loja _loja = Loja(
    nome: 'Sons & Cia',
    instrumentos: [
      Instrumento(
        nome: 'Violão Clássico',
        preco: 850.0,
        anoFabricacao: DateTime(2022, 3, 10),
        estoque: 5,
      ),
      Instrumento(
        nome: 'Baixo 4 Cordas',
        preco: 1500.0,
        anoFabricacao: DateTime(2021, 1, 15),
        estoque: 2,
      ),
      InstrumentoEletronico(
        nome: 'Teclado Yamaha PSR',
        preco: 1200.0,
        anoFabricacao: DateTime(2023, 6, 1),
        estoque: 3,
        voltagem: 110.0,
      ),
      Instrumento(
        nome: 'Flauta Doce',
        preco: 45.0,
        anoFabricacao: DateTime(2024, 2, 20),
        estoque: 10,
      ),
      InstrumentoEletronico(
        nome: 'Guitarra c/ Captador Ativo',
        preco: 2100.0,
        anoFabricacao: DateTime(2020, 9, 5),
        estoque: 1,
        voltagem: 9.0,
        necessitaFonte: false,
      ),
      Instrumento(
        nome: 'Bateria Acústica',
        preco: 3200.0,
        anoFabricacao: DateTime(2019, 11, 30),
        estoque: 1,
      ),
    ],
  );

  Future<void> _abrirCadastro() async {
    final novoInstrumento = await Navigator.of(context).push<Instrumento>(
      MaterialPageRoute(builder: (context) => const CadastroPage()),
    );

    if (novoInstrumento != null) {
      setState(() {
        _loja.adicionar(novoInstrumento);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(_loja.nome),
        actions: [
          IconButton(onPressed: _abrirCadastro, icon: const Icon(Icons.add)),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                colors: [colorScheme.primary, colorScheme.tertiary],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              boxShadow: [
                BoxShadow(
                  color: colorScheme.primary.withOpacity(0.25),
                  blurRadius: 16,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Valor total em estoque',
                  style: TextStyle(color: Colors.white70, fontSize: 14),
                ),
                const SizedBox(height: 6),
                Text(
                  'R\$ ${_loja.valorTotalEstoque.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '${_loja.itens.length} itens cadastrados',
                  style: const TextStyle(color: Colors.white70, fontSize: 13),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.only(bottom: 12),
              itemCount: _loja.itens.length,
              itemBuilder: (context, index) {
                final instrumento = _loja.itens[index];
                return CartaoInstrumento(
                  instrumento: instrumento,
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>
                            DetalhePage(instrumento: instrumento),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _abrirCadastro,
        icon: const Icon(Icons.add),
        label: const Text('Novo instrumento'),
      ),
    );
  }
}
