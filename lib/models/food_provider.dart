import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'food_model.dart';

class FoodProvider extends ChangeNotifier {

  List<FoodModel> _foodList = [];
  List<FoodModel> _basketList = [];
  List<FoodModel> _favoritesList = [];

  Future<String> loadFoodListJson() async {
    return await rootBundle.loadString('json/food.json');
  }

  Future<List> loadMapObjects() async {
    String jsonString = await loadFoodListJson();
    final jsonResponse = json.decode(jsonString);
    List<FoodModel> mapper = [];
    if (jsonResponse != null) {
      mapper =
          List<FoodModel>.from(jsonResponse.map((i) => FoodModel.fromJson(i)));
    }
    this._foodList = mapper;
    return _foodList;
  }

  void initFoodList() {
    loadMapObjects().whenComplete(() => print('food list loaded'));
  }

  List<FoodModel> getPizzaList(){
    List list = _foodList.where((i) => i.type == "pizza").toList();
    return list;
  }

  List<FoodModel> getSaladList(){
    List list = _foodList.where((i) => i.type == "salad").toList();
    return list;
  }

  List<FoodModel> getDrinkList(){
    List list = _foodList.where((i) => i.type == "drink").toList();
    return list;
  }

  FoodModel getFood(String name){
    FoodModel food = _foodList.firstWhere((i) => i.name == name,  orElse: () => null);
    return food;
  }

  List get basketList => _basketList;

  void addToBasket(FoodModel foodModel) {
    _basketList.add(foodModel);
    notifyListeners();
  }

  void removeFromBasket(FoodModel foodModel){
    _basketList.remove(foodModel);
    notifyListeners();
  }

  void clearBasket(){
    _basketList.clear();
    notifyListeners();
  }

  List get favoritesList => _favoritesList;

  void addToFavorites(FoodModel foodModel) {
    _favoritesList.add(foodModel);
    notifyListeners();
  }

  void removeFromFavorites(FoodModel foodModel){
    _favoritesList.remove(foodModel);
    notifyListeners();
  }

  void clearFavorites(){
    _favoritesList.clear();
    notifyListeners();
  }

  bool isFavorite(FoodModel foodModel){
    if(_favoritesList.contains(foodModel)){
      return true;
    }
    return false;
  }
}
