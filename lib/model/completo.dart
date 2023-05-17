import 'acoes.dart';
import 'bitcoin.dart';
import 'moeda.dart';

class Completo {
  Moeda? moeda;
  Acoes? acoes;
  Bitcoin? bitcoin;

  Completo(this.moeda,this.acoes,this.bitcoin);

  Completo.inicio() {
    moeda = Moeda.inicio();
    acoes = Acoes.inicio();
    bitcoin = Bitcoin.inicio();
  }
}