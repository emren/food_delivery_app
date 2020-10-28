import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/food_provider.dart';
import 'package:food_delivery_app/services/size_config.dart';
import 'package:food_delivery_app/widgets/food_card.dart';
import 'package:provider/provider.dart';

class DrinksScreen extends StatefulWidget {
  @override
  _DrinksScreenState createState() => _DrinksScreenState();
}

class _DrinksScreenState extends State<DrinksScreen> {
  @override
  Widget build(BuildContext context) {
    FoodProvider foodProvider = Provider.of<FoodProvider>(context);

    return SafeArea(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Flexible(
              child: Padding(
                padding: EdgeInsets.only(
                    right: 4.83 * SizeConfig.widthMultiplier,
                    left: 4.83 * SizeConfig.widthMultiplier),
                child: GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 25,
                    mainAxisSpacing: 25,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    childAspectRatio: 0.8,
                    padding: EdgeInsets.only(
                        top: 3.34 * SizeConfig.heightMultiplier,
                        bottom: 3.34 * SizeConfig.heightMultiplier,
                        left: 7.25 * SizeConfig.widthMultiplier,
                        right: 7.25 * SizeConfig.widthMultiplier),
                    children: List.generate(foodProvider.getDrinkList().length,
                            (index) {
                          return FoodCard(foodProvider.getDrinkList()[index].name);
                        })),
              ),
            ),
          ],
        ),
      ),
    );
  }
}