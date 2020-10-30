import 'package:food_delivery_app/models/food_model.dart';

class BasketItemModel {
  FoodModel model;
  int quantity;
  int amount;

  BasketItemModel({this.model, this.quantity, this.amount});
}
