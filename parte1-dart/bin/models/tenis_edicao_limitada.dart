// Exercício 2 — Herança
//
// Recurso obrigatório: `extends`
// Conceito obrigatório: `super` no construtor e `@override` de um método
//
// Teste do "é um": todo tênis de edição limitada É UM tênis, só que com
// informações extras. Por isso aqui cabe herança, e não composição.

import 'tenis.dart';

/// Um tênis de edição limitada é um [Tenis] especializado: além dos
/// atributos herdados, guarda o número de série e quantos pares foram
/// produzidos no mundo todo.
class TenisEdicaoLimitada extends Tenis {
  final String numeroSerie;
  final int quantidadeProduzida;

  TenisEdicaoLimitada({
    required super.modelo,
    required super.marca,
    required super.tamanho,
    required super.preco,
    super.dataCompra,
    required this.numeroSerie,
    required this.quantidadeProduzida,
  });

  /// Sobrescreve a ficha do pai, acrescentando o que só a edição
  /// limitada tem.
  @override
  String ficha() {
    return '${super.ficha()} | edição limitada nº$numeroSerie '
        'de $quantidadeProduzida pares';
  }
}
