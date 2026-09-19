import 'package:flutter/material.dart';
import '../models/instrumento.dart';
import '../models/instrumento_eletronico.dart';

/// Exercício 8 — Navegação com passagem de dados
/// Recurso obrigatório: Navigator.of(context).push com MaterialPageRoute
/// Conceito obrigatório: passagem do objeto pelo construtor da tela de destino
class DetalhePage extends StatelessWidget {
  final Instrumento instrumento;

  const DetalhePage({super.key, required this.instrumento});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final eletronico =
        instrumento is InstrumentoEletronico ? instrumento as InstrumentoEletronico : null;

    return Scaffold(
      appBar: AppBar(title: Text(instrumento.nome)),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 28),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                colors: eletronico != null
                    ? [Colors.deepPurple, Colors.indigo]
                    : [colorScheme.primary, colorScheme.tertiary],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Column(
              children: [
                Icon(
                  eletronico != null ? Icons.electric_bolt : Icons.music_note,
                  color: Colors.white,
                  size: 40,
                ),
                const SizedBox(height: 10),
                Text(
                  instrumento.nome,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          _InfoTile(
            icon: Icons.attach_money,
            label: 'Preço',
            value: 'R\$ ${instrumento.preco.toStringAsFixed(2)}',
          ),
          _InfoTile(
            icon: Icons.calendar_today,
            label: 'Ano de fabricação',
            value: '${instrumento.anoFabricacao.year}',
          ),
          _InfoTile(
            icon: Icons.inventory_2,
            label: 'Estoque disponível',
            value: '${instrumento.estoque}',
          ),
          if (eletronico != null) ...[
            _InfoTile(
              icon: Icons.bolt,
              label: 'Voltagem',
              value: '${eletronico.voltagem}V',
            ),
            _InfoTile(
              icon: Icons.power,
              label: 'Necessita fonte',
              value: eletronico.necessitaFonte ? 'Sim' : 'Não',
            ),
          ],
        ],
      ),
    );
  }
}

class _InfoTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _InfoTile({required this.icon, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: colorScheme.primaryContainer,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: colorScheme.onPrimaryContainer, size: 20),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label, style: TextStyle(color: Colors.grey.shade600, fontSize: 13)),
                const SizedBox(height: 2),
                Text(value, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}