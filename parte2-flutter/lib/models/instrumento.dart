/// Exercício 1 — Entidade principal
/// Recurso obrigatório: class com construtor de parâmetros nomeados
/// Conceito obrigatório: required
class Instrumento {
  final String nome;
  final double preco;
  final DateTime anoFabricacao;
  final int estoque;

  Instrumento({
    required this.nome,
    required this.preco,
    required this.anoFabricacao,
    this.estoque = 0,
  });

  String ficha() {
    return '$nome, R\$ ${preco.toStringAsFixed(2)}, '
        'fabricado em ${anoFabricacao.year}, estoque: $estoque';
  }
}
