// Exercício 1 — Modelagem da entidade principal
//
// Recurso obrigatório: construtor com parâmetros nomeados
// Conceito obrigatório: `required` nos campos obrigatórios

/// Representa um par de tênis da coleção.
///
/// Quatro atributos de tipos diferentes, como o exercício pede:
/// [modelo] (String), [tamanho] (int), [preco] (double) e [dataCompra]
/// (DateTime).
class Tenis {
  final String modelo;
  final String marca;
  final int tamanho;
  final double preco;
  final DateTime dataCompra;

  Tenis({
    required this.modelo,
    required this.marca,
    required this.tamanho,
    required this.preco,
    DateTime? dataCompra,
  }) : dataCompra = dataCompra ?? DateTime.now();

  /// Descrição do tênis, usada no relatório.
  ///
  /// Este método existe aqui, na classe pai, para que o Exercício 2
  /// possa sobrescrevê-lo (`@override`) na subclasse.
  String ficha() {
    return 'Tênis: $modelo ($marca) | tamanho $tamanho | '
        'R\$ ${preco.toStringAsFixed(2)}';
  }
}
