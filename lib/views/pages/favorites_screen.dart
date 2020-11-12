import 'package:flutter/material.dart';
import 'package:food_delivery_app/controls/food_provider.dart';
import 'package:food_delivery_app/util/size_config.dart';
import 'package:food_delivery_app/views/widgets/food_card.dart';
import 'package:provider/provider.dart';

class FavoritesScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    FoodProvider foodProvider = Provider.of<FoodProvider>(context);

    return SafeArea(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                foodProvider.clearFavorites();
              },
              child: Padding(
                padding:
                EdgeInsets.only(top: 2.23 * SizeConfig.heightMultiplier),
                child: Container(
                  width: 100 * SizeConfig.widthMultiplier,
                  height: 5.58 * SizeConfig.heightMultiplier,
                  decoration: BoxDecoration(
                    color: Colors.green[800],
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: [
                      BoxShadow(
                          color: Color(0x29000000),
                          offset: Offset(0, 3),
                          blurRadius: 6,
                          spreadRadius: 0)
                    ],
                  ),
                  child: Center(
                    child: Text(
                      "Clean Favorites",
                      style: TextStyle(
                        fontFamily: 'SFProDisplay',
                        color: Color(0xffffffff),
                        fontSize: 2 * SizeConfig.textMultiplier,
                        fontWeight: FontWeight.w900,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                  ),
                ),
              ),
            ),
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
                    children: List.generate(foodProvider.favoritesList.length,
                            (index) {
                          return FoodCard(foodProvider.favoritesList[index].name);
                        })),
              ),
            ),
          ],
        ),
      ),
    );
  }
}