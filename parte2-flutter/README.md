# Parte 2 — Aplicação Flutter

Interface da loja de instrumentos musicais. A aplicação inicia com seis
instrumentos, permite abrir os detalhes de um item e cadastrar um novo
instrumento.

## Como executar

Na pasta `parte2-flutter`, execute:

```powershell
flutter pub get
flutter analyze
flutter run -d chrome
```

O Chrome deve estar instalado. Para listar os dispositivos disponíveis:

```powershell
flutter devices
```

Também é possível executar no Windows com:

```powershell
flutter run -d windows
```

Durante a execução, use `r` para hot reload e `q` para encerrar o aplicativo.

## Cadastro

O formulário permite informar nome, preço e ano de fabricação. O seletor de
tipo cria um `Instrumento` normal ou um `InstrumentoEletronico`; o estoque
inicial de um item novo é 1 para manter o formulário dentro do limite de três
campos de texto exigido pelo trabalho.
