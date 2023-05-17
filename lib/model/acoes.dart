import 'item.dart';

class Acoes {
  Item? ibovespa;
  Item? nasdaq;
  Item? cac;
  Item? ifix;
  Item? dowjones;
  Item? nikkei;

  Acoes(this.ibovespa,this.nasdaq,this.cac,this.ifix,this.dowjones,this.nikkei);

  Acoes.inicio() {
    ibovespa = Item.inicio();
    nasdaq = Item.inicio();
    cac = Item.inicio();
    ifix = Item.inicio();
    dowjones = Item.inicio();
    nikkei = Item.inicio();
  }
}