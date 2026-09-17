import 'instrumento.dart';

/// Exercício 2 — Herança
/// Recurso obrigatório: extends
/// Conceito obrigatório: super no construtor e @override de um método
class InstrumentoEletronico extends Instrumento {
  final double voltagem;
  final bool necessitaFonte;

  InstrumentoEletronico({
    required super.nome,
    required super.preco,
    required super.anoFabricacao,
    super.estoque,
    required this.voltagem,
    this.necessitaFonte = true,
  });

  @override
  String ficha() {
    final fonte = necessitaFonte ? 'com fonte' : 'sem fonte';
    return '${super.ficha()}, ${voltagem}V, $fonte';
  }
}
