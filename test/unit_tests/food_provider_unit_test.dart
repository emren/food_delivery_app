
import 'package:flutter_test/flutter_test.dart';
import 'package:food_delivery_app/core/models/food_model.dart';
import 'package:food_delivery_app/core/viewmodels/food_provider.dart';

void main(){

  group('Food Provider tests',(){

    setUp((){

    });

    test('Foodlist should add item', (){
      FoodProvider provider = FoodProvider();
      FoodModel food = FoodModel(type: '', price: '', name: '', link: '', description: '');
      provider.addToFoodList(food);
      List foodList = provider.foodList;
      bool isEmpty = foodList.isEmpty;
      expect(isEmpty, false);
    });

    test('Foodlist should start empty', (){
      FoodProvider provider = FoodProvider();
      List foodList = provider.foodList;
      bool isEmpty = foodList.isEmpty;
      expect(isEmpty, true);
    });

    test('GetFood should work', (){
      FoodProvider provider = FoodProvider();
      FoodModel food = FoodModel(type: '', price: '', name: 'salata', link: '', description: '');
      provider.addToFoodList(food);
      expect(food, provider.getFood('salata'));
    });

    test('Favoriteslist should start empty', (){
      FoodProvider provider = FoodProvider();
      List favoritesList = provider.favoritesList;
      bool isEmpty = favoritesList.isEmpty;
      expect(isEmpty, true);
    });

  });


}