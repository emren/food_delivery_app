import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_delivery_app/core/models/food_model.dart';

import 'package:shared_preferences/shared_preferences.dart';

class FoodProvider extends ChangeNotifier {
  List<FoodModel> _foodList = [];
  List<FoodModel> _favoritesList = [];

  /* The code below is to use the app with the embedded
  json/food.json file. In order to do that just uncomment below
  code as well as the initFoodList() at the splashscreen.
  Additionally comment the service.takedata() methods at the splashscreen to
  use the app without local server.


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
  */

  void addToFoodList(FoodModel food) {
    _foodList.add(food);
    notifyListeners();
  }

  List<FoodModel> getPizzaList() {
    List list = _foodList.where((i) => i.type == "pizza").toList();
    return list;
  }

  List<FoodModel> getSaladList() {
    List list = _foodList.where((i) => i.type == "salad").toList();
    return list;
  }

  List<FoodModel> getDrinkList() {
    List list = _foodList.where((i) => i.type == "drink").toList();
    return list;
  }

  FoodModel getFood(String name) {
    FoodModel food =
        _foodList.firstWhere((i) => i.name == name, orElse: () => null);
    return food;
  }

  List get favoritesList => _favoritesList;

  void addToFavorites(FoodModel foodModel) {
    _favoritesList.add(foodModel);
    notifyListeners();
  }

  void removeFromFavorites(FoodModel foodModel) {
    _favoritesList.remove(foodModel);
    notifyListeners();
  }

  void clearFavorites() {
    _favoritesList.clear();
    saveFavoriteFoods(_favoritesList);
    notifyListeners();
  }

  bool isFavorite(FoodModel foodModel) {
    if (_favoritesList.contains(foodModel)) {
      return true;
    }
    return false;
  }

  Future<List> loadFavoriteFoods() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    List<String> foods = sharedPreferences.getStringList('favorites');
    List<FoodModel> favorites = [];
    if (foods != null) {
      favorites = foods.map((f) => FoodModel.fromJson(json.decode(f))).toList();
    }
    _favoritesList = favorites;
    notifyListeners();
    return favorites;
  }

  Future saveFavoriteFoods(List<FoodModel> list) async {
    int count = list.length;
    List<String> foods = list.map((f) => json.encode(f.toJson())).toList();
    List<String> favorites = [];
    print(foods);
    for (var i = 0; i < count; i++) {
      favorites.add(foods[i]);
    }
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setStringList('favorites', favorites);
  }
}
