import 'package:flutter_test/flutter_test.dart';
import 'package:food_delivery_app/core/models/basket_item_model.dart';
import 'package:food_delivery_app/core/viewmodels/basket_provider.dart';
import 'package:food_delivery_app/core/models/food_model.dart';


void main(){

  group('Basket Provider tests',(){

    setUp((){

    });

    test('Basket should be empty', (){
      BasketProvider provider = BasketProvider();
      List basketList = provider.basketList;
      provider.clearBasket();
      bool empty = basketList.isEmpty;
      expect(empty, true);
    });

    test('Basket should add item', (){
      BasketProvider provider = BasketProvider();
      FoodModel food = FoodModel(description: '', link: '', name: '', price: '', type: '');
      BasketItemModel item = BasketItemModel(amount: 4, quantity: 5,model: food);
      List basketList = provider.basketList;
      provider.addToBasket(item);
      bool isEmpty = basketList.isEmpty;
      expect(isEmpty, false);
    });

    test('Basket should remove item', (){
      BasketProvider provider = BasketProvider();
      FoodModel food = FoodModel(description: '', link: '', name: '', price: '', type: '');
      BasketItemModel item = BasketItemModel(amount: 4, quantity: 5,model: food);
      List basketList = provider.basketList;
      provider.addToBasket(item);
      provider.removeFromBasket(item);
      bool isEmpty = basketList.isEmpty;
      expect(isEmpty, true);
    });

    test('Basket should start empty', (){
      BasketProvider provider = BasketProvider();
      List basketList = provider.basketList;
      bool empty = basketList.isEmpty;
      expect(empty, true);
    });

  });


}