import 'models/instrumento.dart';
import 'models/instrumento_eletronico.dart';
import 'models/loja.dart';

void main() {
  // ===== [1] ENTIDADE PRINCIPAL =====
  final violao = Instrumento(
    nome: 'Violão Clássico',
    preco: 850.0,
    anoFabricacao: DateTime(2022, 3, 10),
    estoque: 5,
  );
  print('===== [1] ENTIDADE PRINCIPAL =====');
  print(
    'Instrumento: ${violao.nome} | R\$ ${violao.preco.toStringAsFixed(2)} | '
    '${violao.anoFabricacao.year} | Estoque: ${violao.estoque}',
  );
  print('');

  // ===== [2] HERANÇA =====
  final teclado = InstrumentoEletronico(
    nome: 'Teclado Yamaha PSR',
    preco: 1200.0,
    anoFabricacao: DateTime(2023, 6, 1),
    estoque: 3,
    voltagem: 110.0,
  );
  print('===== [2] HERANÇA =====');
  print('Instrumento comum -> ficha: "${violao.ficha()}"');
  print('InstrumentoEletronico -> ficha: "${teclado.ficha()}"');
  print('');

  // ===== [3] COMPOSIÇÃO =====
  final loja = Loja(
    nome: 'Sons & Cia',
    instrumentos: [
      violao,
      teclado,
      Instrumento(
        nome: 'Baixo 4 Cordas',
        preco: 1500.0,
        anoFabricacao: DateTime(2021, 1, 15),
        estoque: 2,
      ),
    ],
  );
  print('===== [3] COMPOSIÇÃO =====');
  print('Loja "${loja.nome}" contém ${loja.itens.length} instrumentos:');
  for (final instrumento in loja.itens) {
    print('  - ${instrumento.nome}');
  }
  print('');

  // ===== [4] ENCAPSULAMENTO =====
  print('===== [4] ENCAPSULAMENTO =====');
  print(
    'Loja "${loja.nome}" -> valor total em estoque (calculado): '
    'R\$ ${loja.valorTotalEstoque.toStringAsFixed(2)}',
  );
  loja.adicionar(
    Instrumento(
      nome: 'Flauta Doce',
      preco: 45.0,
      anoFabricacao: DateTime(2024, 2, 20),
      estoque: 10,
    ),
  );
  print(
    'Após adicionar "Flauta Doce" (10 un. a R\$ 45,00): '
    'R\$ ${loja.valorTotalEstoque.toStringAsFixed(2)}',
  );
}
