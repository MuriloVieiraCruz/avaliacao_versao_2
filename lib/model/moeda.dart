import 'item.dart';

class Moeda {
  Item? dollar;
  Item? euro;
  Item? peso;
  Item? yen;

  Moeda(this.dollar,this.euro,this.peso,this.yen);

  Moeda.inicio() {
    dollar = Item.inicio();
    euro = Item.inicio();
    peso = Item.inicio();
    yen = Item.inicio();
  }
}