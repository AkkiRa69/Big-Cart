import 'package:flutter/cupertino.dart';
import 'package:grocery_store/model/card_model.dart';

class CardProvider extends ChangeNotifier {
  List<CardModel> _cardList = [];
  List<CardModel> get cardList => _cardList;
  void addCardToList(CardModel card) {
    _cardList.add(card);
    notifyListeners();
  }
}
