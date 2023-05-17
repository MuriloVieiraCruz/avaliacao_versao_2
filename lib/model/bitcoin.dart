import 'item.dart';

class Bitcoin {
  Item? blockchain;
  Item? bitStamp;
  Item? mercadoBitcoin;
  Item? coinbase;
  Item? foxBit;

  Bitcoin(this.blockchain,this.bitStamp,this.mercadoBitcoin,this.coinbase,this.foxBit);

  Bitcoin.inicio() {
    blockchain = Item.inicio();
    bitStamp = Item.inicio();
    mercadoBitcoin = Item.inicio();
    coinbase = Item.inicio();
    foxBit = Item.inicio();
  }
}