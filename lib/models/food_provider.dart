import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'food_model.dart';

class FoodProvider extends ChangeNotifier {
  List<FoodModel> foodList = [];

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
    this.foodList = mapper;
    return foodList;
  }

  void initFoodList() {
    loadMapObjects().whenComplete(() => print(foodList));
  }
}
