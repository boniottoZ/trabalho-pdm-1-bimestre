import 'package:flutter/material.dart';
import '../models/instrumento.dart';
import '../models/instrumento_eletronico.dart';

/// Exercício 9 — Entrada de dados
/// Recurso obrigatório: TextFormField
/// Conceito obrigatório: TextEditingController
class CadastroPage extends StatefulWidget {
  const CadastroPage({super.key});

  @override
  State<CadastroPage> createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  final _nomeController = TextEditingController();
  final _precoController = TextEditingController();
  final _anoController = TextEditingController();
  bool _ehEletronico = false;

  @override
  void dispose() {
    _nomeController.dispose();
    _precoController.dispose();
    _anoController.dispose();
    super.dispose();
  }

  void _confirmar() {
    final nome = _nomeController.text.trim();
    final preco =
        double.tryParse(_precoController.text.replaceAll(',', '.')) ?? 0.0;
    final ano = int.tryParse(_anoController.text) ?? 0;

    if (nome.isEmpty || preco <= 0 || ano < 1900 || ano > DateTime.now().year) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text(
            'Informe nome, preço válido e um ano de fabricação válido.',
          ),
          behavior: SnackBarBehavior.floating,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
      );
      return;
    }

    final novoInstrumento = _ehEletronico
        ? InstrumentoEletronico(
            nome: nome,
            preco: preco,
            anoFabricacao: DateTime(ano),
            estoque: 1,
            voltagem: 110.0,
          )
        : Instrumento(
            nome: nome,
            preco: preco,
            anoFabricacao: DateTime(ano),
            estoque: 1,
          );

    Navigator.of(context).pop(novoInstrumento);
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(title: const Text('Cadastrar Instrumento')),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          Icon(Icons.music_note, size: 48, color: colorScheme.primary),
          const SizedBox(height: 8),
          Text(
            'Novo instrumento',
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 24),
          TextFormField(
            controller: _nomeController,
            decoration: const InputDecoration(
              labelText: 'Nome',
              prefixIcon: Icon(Icons.music_note),
            ),
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: _precoController,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            decoration: const InputDecoration(
              labelText: 'Preço',
              prefixIcon: Icon(Icons.attach_money),
            ),
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: _anoController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: 'Ano de fabricação',
              prefixIcon: Icon(Icons.calendar_today),
            ),
          ),
          const SizedBox(height: 16),
          InputDecorator(
            decoration: const InputDecoration(
              labelText: 'Tipo de instrumento',
              prefixIcon: Icon(Icons.category),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<bool>(
                value: _ehEletronico,
                isExpanded: true,
                items: const [
                  DropdownMenuItem(value: false, child: Text('Normal')),
                  DropdownMenuItem(value: true, child: Text('Eletrônico')),
                ],
                onChanged: (value) {
                  if (value != null) {
                    setState(() => _ehEletronico = value);
                  }
                },
              ),
            ),
          ),
          const SizedBox(height: 28),
          ElevatedButton.icon(
            onPressed: _confirmar,
            icon: const Icon(Icons.check),
            label: const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text('Confirmar'),
            ),
          ),
        ],
      ),
    );
  }
}
