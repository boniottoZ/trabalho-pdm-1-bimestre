// Exercício 3 — Composição
//
// Recurso obrigatório: atributo do tipo List<T> de outra classe sua
// Conceito obrigatório: distinção entre "é um" e "tem um"
//
// Exercício 4 — Encapsulamento
//
// Recurso obrigatório: atributo privado com `_`
// Conceito obrigatório: `get` que devolve um valor calculado
//
// Um armário não É UM tênis: ele TEM vários tênis. Por isso a relação
// entre Armario e Tenis é composição, e não herança.

import 'tenis.dart';

/// Agrupa vários [Tenis], como um armário de verdade guarda vários pares.
class Armario {
  final String nome;

  // Exercício 4: a lista fica privada (prefixo `_`), então só este
  // arquivo pode mexer nela diretamente. Quem está fora só enxerga o
  // que os métodos e getters abaixo permitem.
  final List<Tenis> _tenis;

  Armario({required this.nome, List<Tenis>? tenis}) : _tenis = tenis ?? [];

  /// Único jeito de colocar um tênis novo no armário. Será reaproveitado
  /// no Exercício 10, quando o cadastro do Flutter chamar este método.
  void adicionar(Tenis tenis) {
    _tenis.add(tenis);
  }

  /// Cópia somente-leitura da lista, para quem quiser percorrer os
  /// itens sem poder alterar a lista interna diretamente.
  List<Tenis> get itens => List.unmodifiable(_tenis);

  int get quantidade => _tenis.length;

  /// Getter calculado: soma os preços na hora da chamada, direto da
  /// lista privada. Não existe um campo "valorTotal" guardado em lugar
  /// nenhum — se existisse, alguém precisaria lembrar de atualizá-lo
  /// toda vez que um tênis entrasse ou saísse.
  double get valorTotal {
    var total = 0.0;
    for (final tenis in _tenis) {
      total += tenis.preco;
    }
    return total;
  }
}
