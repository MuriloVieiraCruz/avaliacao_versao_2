import 'package:avaliacao_versao_2/model/completo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../components/botao.dart';
import '../components/item_component.dart';

class AcoesPage extends StatefulWidget {
  const AcoesPage({super.key});

  @override
  State<AcoesPage> createState() => _AcoesPageState();
}

class _AcoesPageState extends State<AcoesPage> {

  @override
  Widget build(BuildContext context) {

    final completo = ModalRoute.of(context)!.settings.arguments as Completo;

    irBitcoin() {
      Navigator.pushNamed(context, '/bitcoin_page', arguments: completo);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Finanças de Hoje'),
        backgroundColor: const Color.fromARGB(255, 28, 75, 29),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const SizedBox(
            height: 20,
          ),
          const Center(
            child: Text('Ações',
              style: TextStyle(
              fontSize: 15
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Center(
              child: Container(
                height: 250,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  border: Border.all(color: const Color.fromARGB(255, 54, 52, 52), width: 1),
                  borderRadius: const BorderRadius.all(Radius.circular(20))
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: ItemComponent(item: completo.acoes!.ibovespa,)
                        ),
                        Expanded(
                          child: ItemComponent(item: completo.acoes!.ifix,)
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: ItemComponent(item: completo.acoes!.nasdaq,)
                        ),
                        Expanded(
                          child: ItemComponent(item: completo.acoes!.dowjones,)
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: ItemComponent(item: completo.acoes!.cac,)
                        ),
                        Expanded(
                          child: ItemComponent(item: completo.acoes!.nikkei,)
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Botao(
            texto: 'Ir para Bitcoin',
            funcao: irBitcoin,
          )
        ],
      ),
    );
  }
}