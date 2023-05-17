import 'dart:convert';

import 'package:avaliacao_versao_2/components/botao.dart';
import 'package:avaliacao_versao_2/components/item_component.dart';
import 'package:avaliacao_versao_2/model/acoes.dart';
import 'package:avaliacao_versao_2/model/bitcoin.dart';
import 'package:avaliacao_versao_2/model/item.dart';
import 'package:avaliacao_versao_2/model/moeda.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../model/completo.dart';

class MoedasPage extends StatefulWidget {
  const MoedasPage({super.key});

  @override
  State<MoedasPage> createState() => _MoedasPageState();
}

class _MoedasPageState extends State<MoedasPage> {

  Completo completo = Completo.inicio();

  buscarAPI() async {
    String urlHgBrasil = 'https://api.hgbrasil.com/finance?key=0811678f&format=json-cors';
    Response resposta = await get (Uri.parse(urlHgBrasil));
    Map resultado = json.decode(resposta.body);

    Item dollar = Item('Dollar', resultado['results']['currencies']['USD']['buy'], resultado['results']['currencies']['USD']['variation']);
    Item euro = Item('Euro', resultado['results']['currencies']['EUR']['buy'], resultado['results']['currencies']['EUR']['variation']);
    Item peso = Item('Peso', resultado['results']['currencies']['ARS']['buy'], resultado['results']['currencies']['ARS']['variation']);
    Item yen = Item('Yen', resultado['results']['currencies']['JPY']['buy'], resultado['results']['currencies']['JPY']['variation']);

    Moeda moeda = Moeda(dollar, euro, peso, yen);

    Item ibovespa = Item(
      'Ibovespa', resultado['results']['stocks']['IBOVESPA']['points'], resultado['results']['stocks']['IBOVESPA']['variation']);
    Item nasdaq = Item(
      'Nasdaq', resultado['results']['stocks']['NASDAQ']['points'], resultado['results']['stocks']['NASDAQ']['variation']);
    Item cac = Item(
      'Cac', resultado['results']['stocks']['CAC']['points'], resultado['results']['stocks']['CAC']['variation']);
    Item ifix = Item(
      'Ifix', resultado['results']['stocks']['IFIX']['points'], resultado['results']['stocks']['IFIX']['variation']);
    Item dowjones = Item(
      'Dowjones', resultado['results']['stocks']['DOWJONES']['points'], resultado['results']['stocks']['DOWJONES']['variation']);
    Item nikkei = Item(
      'Nikkei', resultado['results']['stocks']['NIKKEI']['points'], resultado['results']['stocks']['NIKKEI']['variation']);

    Acoes acoes = Acoes(ibovespa, nasdaq, cac, ifix, dowjones, nikkei);

    Item blockchain = Item(
      'Blockchain', resultado['results']['bitcoin']['blockchain_info']['last'], resultado['results']['bitcoin']['blockchain_info']['variation']);
    Item bitStamp = Item(
      'BitStamp', resultado['results']['bitcoin']['bitstamp']['last'], resultado['results']['bitcoin']['bitstamp']['variation']);
    Item mercadoBitcoin = Item(
      'MercadoBitcoin', resultado['results']['bitcoin']['mercadobitcoin']['last'], resultado['results']['bitcoin']['mercadobitcoin']['variation']);
    Item coinbase = Item(
      'Coinbase', resultado['results']['bitcoin']['coinbase']['last'], resultado['results']['bitcoin']['coinbase']['variation']);
    Item foxBit = Item('FoxBit', resultado['results']['bitcoin']['foxbit']['last'], resultado['results']['bitcoin']['foxbit']['variation']);

    Bitcoin bitcoin = Bitcoin(blockchain, bitStamp, mercadoBitcoin, coinbase, foxBit);

    setState(() {
      completo = Completo(moeda, acoes, bitcoin);
    });
    
  }

  irAcoes() {
    Navigator.pushNamed(context, '/acoes_page', arguments: completo);
  }


  @override
  Widget build(BuildContext context) {

    buscarAPI();

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
            child: Text('MOEDAS',
              style: TextStyle(
              fontSize: 15
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Center(
              child: Container(
                height: 200,
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
                          child: ItemComponent(item: completo.moeda!.dollar,)
                        ),
                        Expanded(
                          child: ItemComponent(item: completo.moeda!.euro,)
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: ItemComponent(item: completo.moeda!.peso,)
                        ),
                        Expanded(
                          child: ItemComponent(item: completo.moeda!.yen,)
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Botao(
            texto: 'Ir para Ações',
            funcao: irAcoes,
          )
        ],
      ),
    );
  }
}