# Trabalho do 1º Bimestre — Programação para Dispositivos Móveis

**Turma:** 4º ESW B
**Professor:** Me. Gustavo Meneghetti Arcolezi
**Integrante(s):** Guilherme Borniotto, Alisson Casalli

## Domínio

O tema escolhido é uma **loja de instrumentos musicais**. As duas entidades que
se relacionam por composição são `Instrumento` (o item individual, como um
violão ou um teclado) e `Loja` (a entidade agrupadora, que contém uma lista de
instrumentos e calcula o valor total em estoque a partir dela).

## Tabela de rastreio

| #  | Exercício           | Arquivo e linha                                                              | O que aparece na tela                                     |
|----|---------------------|-------------------------------------------------------------------------------|------------------------------------------------------------|
| 1  | Entidade principal  | `parte1-dart/bin/models/instrumento.dart:4`                                   | Bloco `[1]` do relatório                                    |
| 2  | Herança             | `parte1-dart/bin/models/instrumento_eletronico.dart:6` (extends), `:11-14` (super), `:19` (@override) | Bloco `[2]` do relatório                                    |
| 3  | Composição          | `parte1-dart/bin/models/loja.dart:17` (`_instrumentos`), `:22` (`adicionar`)   | Bloco `[3]` do relatório                                    |
| 4  | Encapsulamento      | `parte1-dart/bin/models/loja.dart:28` (`get valorTotalEstoque`)                | Bloco `[4]` e o total no topo da tela de lista              |
| 5  | Estrutura de tela   | `parte2-flutter/lib/screens/home_page.dart:83` (Scaffold), `:90` (Column)      | AppBar e corpo da tela inicial                              |
| 6  | Cartão              | `parte2-flutter/lib/screens/widgets/cartao_instrumento.dart:20`                | Cada item da lista                                          |
| 7  | Lista               | `parte2-flutter/lib/screens/home_page.dart:103`                               | Lista rolável com seis itens                                |
| 8  | Navegação           | `parte2-flutter/lib/screens/home_page.dart:110`                               | Toque no item abre o detalhe                                |
| 9  | Formulário          | `parte2-flutter/lib/screens/cadastro_page.dart` (controllers, campos e seletor de tipo) | Cadastro com nome, preço, ano e tipo                         |
| 10 | Estado              | `parte2-flutter/lib/screens/home_page.dart:16` (StatefulWidget), `:75` (setState) | Item novo na lista e total atualizado                       |

## Justificativa: composição em vez de herança (Exercício 3)

`Loja` **tem uma** lista de instrumentos — não faz sentido dizer que "toda loja
é um instrumento". Por isso a relação entre `Loja` e `Instrumento` é
composição (`List<Instrumento>` como atributo), e não herança: a loja agrupa
objetos de `Instrumento`, em vez de se especializar a partir dele.

## Como rodar

### Parte 1 — Dart

```bash
cd parte1-dart
dart pub get
dart analyze
dart run
```

### Parte 2 — Flutter

```bash
cd parte2-flutter
flutter pub get
flutter analyze
flutter run -d chrome
```

O comando `flutter run` precisa de um dispositivo selecionado. Para conferir os
dispositivos disponíveis, use `flutter devices`. Neste projeto, `chrome` é uma
opção prática para executar a aplicação no computador. Também é possível usar
`flutter run -d windows` caso o suporte para Windows esteja disponível.

Para executar as duas partes a partir da raiz do repositório, use dois terminais
ou volte para a raiz com `cd ..` antes de entrar na outra pasta. A Parte 1 roda
no terminal e a Parte 2 abre a interface Flutter no dispositivo escolhido.

## Onde cada parte é demonstrada

A Parte 1 é um projeto Dart puro e deve ser demonstrada com `dart run`. Ela
imprime os quatro blocos do relatório e não possui cadastro interativo. A Parte
2 é o aplicativo Flutter e contém a lista, o detalhe e o cadastro. As classes
dos modelos aparecem nas duas pastas de propósito: o enunciado aceita a cópia
dos modelos para manter os projetos independentes. O cadastro da Parte 2
permite informar nome, preço e ano de fabricação, escolher entre instrumento
normal ou eletrônico e adiciona o novo item à lista. O estoque inicial do item
cadastrado é 1, conforme o limite de campos do formulário.

## Estrutura do repositório

```
trabalho-poo-mobile/
├── README.md
├── parte1-dart/
│   ├── pubspec.yaml
│   └── bin/
│       ├── main.dart
│       └── models/
│           ├── instrumento.dart
│           ├── instrumento_eletronico.dart
│           └── loja.dart
└── parte2-flutter/
    ├── pubspec.yaml
    └── lib/
        ├── main.dart
        ├── models/
        │   ├── instrumento.dart
        │   ├── instrumento_eletronico.dart
        │   └── loja.dart
        └── screens/
            ├── home_page.dart
            ├── detalhe_page.dart
            ├── cadastro_page.dart
            └── widgets/
                └── cartao_instrumento.dart
```
