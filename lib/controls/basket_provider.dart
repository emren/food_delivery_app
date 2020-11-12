import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/basket_item_model.dart';

class BasketProvider extends ChangeNotifier {
  List<BasketItemModel> _basketList = [];

  List get basketList => _basketList;

  int _totalAmount = 0;
  int get totalAmount => _totalAmount;

  void addToBasket(BasketItemModel item) {
    _basketList.add(item);
    _totalAmount += item.amount;
    notifyListeners();
  }

  void removeFromBasket(BasketItemModel item) {
    _basketList.remove(item);
    _totalAmount -= item.amount;
    notifyListeners();
  }

  void clearBasket() {
    _basketList.clear();
    _totalAmount = 0;
    notifyListeners();
  }
}
