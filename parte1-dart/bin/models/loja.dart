import 'instrumento.dart';

/// Exercício 3 — Composição
/// Recurso obrigatório: atributo do tipo List<T> de outra classe
/// Conceito obrigatório: distinção entre "é um" e "tem um"
///
/// Loja "tem uma" lista de instrumentos — não faria sentido dizer que
/// "toda loja é um instrumento". Por isso a relação é composição, e não
/// herança: Loja agrupa objetos de Instrumento em vez de se especializar
/// a partir dele.
///
/// Exercício 4 — Encapsulamento
/// Recurso obrigatório: atributo privado com _
/// Conceito obrigatório: get que devolve um valor calculado
class Loja {
  final String nome;
  final List<Instrumento> _instrumentos;

  Loja({required this.nome, List<Instrumento>? instrumentos})
      : _instrumentos = instrumentos ?? [];

  void adicionar(Instrumento instrumento) {
    _instrumentos.add(instrumento);
  }

  List<Instrumento> get itens => List.unmodifiable(_instrumentos);

  double get valorTotalEstoque {
    var total = 0.0;
    for (final instrumento in _instrumentos) {
      total += instrumento.preco * instrumento.estoque;
    }
    return total;
  }
}
