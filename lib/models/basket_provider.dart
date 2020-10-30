import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/basket_item_model.dart';

class BasketProvider extends ChangeNotifier {
  List<BasketItemModel> _basketList = [];

  List get basketList => _basketList;

  void addToBasket(BasketItemModel item) {
    _basketList.add(item);
    notifyListeners();
  }

  void removeFromBasket(BasketItemModel item) {
    _basketList.remove(item);
    notifyListeners();
  }

  void clearBasket() {
    _basketList.clear();
    notifyListeners();
  }
}
