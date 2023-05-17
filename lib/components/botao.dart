import 'package:flutter/material.dart';

class Botao extends StatefulWidget {

  final funcao;
  final texto;


  const Botao({super.key, this.funcao, this.texto});

  @override
  State<Botao> createState() => _BotaoState();
}

class _BotaoState extends State<Botao> {
  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.only(top: 20, right: 30),
    child: ElevatedButton(onPressed: widget.funcao,
    style: const ButtonStyle(
      backgroundColor: MaterialStatePropertyAll(Color.fromARGB(255, 28, 75, 29))
    ),
     child: Text(widget.texto)),
    );
  }
}