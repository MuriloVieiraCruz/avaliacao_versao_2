import 'package:avaliacao_versao_2/telas/acoes_page.dart';
import 'package:avaliacao_versao_2/telas/bitcoin_page.dart';
import 'package:avaliacao_versao_2/telas/moedas_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/moedas_page',
      routes: {
        '/moedas_page' : (context) => const MoedasPage(),
        '/acoes_page' : (context) => const AcoesPage(),
        '/bitcoin_page' : (context) => const BitcoinPage(),
      },
    );
  }
}
