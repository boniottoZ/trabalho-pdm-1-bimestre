import 'models/armario.dart';
import 'models/tenis.dart';
import 'models/tenis_edicao_limitada.dart';

void main() {
  // ===== [1] ENTIDADE PRINCIPAL =====
  print('===== [1] ENTIDADE PRINCIPAL =====');
  final airForce = Tenis(
    modelo: 'Air Force 1',
    marca: 'Nike',
    tamanho: 42,
    preco: 699.90,
    dataCompra: DateTime(2025, 3, 10),
  );
  print(airForce.ficha());
  print('');

  // ===== [2] HERANÇA =====
  print('===== [2] HERANÇA =====');
  final chuck = Tenis(
    modelo: 'Chuck Taylor',
    marca: 'Converse',
    tamanho: 40,
    preco: 349.90,
  );
  final jordan = TenisEdicaoLimitada(
    modelo: 'Air Jordan 1 Retro',
    marca: 'Nike',
    tamanho: 41,
    preco: 1899.90,
    numeroSerie: '0027',
    quantidadeProduzida: 500,
  );
  print('Tênis comum   -> ${chuck.ficha()}');
  print('Edição limitada -> ${jordan.ficha()}');
  print('');

  // ===== [3] COMPOSIÇÃO =====
  print('===== [3] COMPOSIÇÃO =====');
  final armario = Armario(
    nome: 'Coleção do Rafa',
    tenis: [airForce, chuck, jordan],
  );
  print('Armário "${armario.nome}" contém ${armario.quantidade} tênis:');
  for (final tenis in armario.itens) {
    print('  - ${tenis.modelo}');
  }
  print('');

  // ===== [4] ENCAPSULAMENTO =====
  print('===== [4] ENCAPSULAMENTO =====');
  print(
    'Armário "${armario.nome}" -> valor total (calculado): '
    'R\$ ${armario.valorTotal.toStringAsFixed(2)}',
  );
  final novoTenis = Tenis(
    modelo: 'Samba OG',
    marca: 'Adidas',
    tamanho: 39,
    preco: 599.90,
  );
  armario.adicionar(novoTenis);
  print(
    'Após adicionar "${novoTenis.modelo}" '
    '(R\$ ${novoTenis.preco.toStringAsFixed(2)}): '
    'R\$ ${armario.valorTotal.toStringAsFixed(2)}',
  );
}
