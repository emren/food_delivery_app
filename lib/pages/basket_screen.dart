import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/food_provider.dart';
import 'package:food_delivery_app/services/size_config.dart';
import 'package:provider/provider.dart';

class BasketScreen extends StatefulWidget {
  @override
  _BasketScreenState createState() => _BasketScreenState();
}

class _BasketScreenState extends State<BasketScreen> {
  @override
  Widget build(BuildContext context) {
    FoodProvider foodProvider = Provider.of<FoodProvider>(context);

    return SafeArea(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: ListView(

          children: [
            GestureDetector(
              onTap: () {
                foodProvider.clearBasket();
              },
              child: Padding(
                padding:
                    EdgeInsets.only(top: 2.23 * SizeConfig.heightMultiplier),
                child: Container(
                  width: 40 * SizeConfig.widthMultiplier,
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
                      "Clean Basket",
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
            SizedBox(
              height: 10,
            ),
            ListView.builder(
                shrinkWrap: true,
                itemCount: foodProvider.basketList.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(foodProvider.basketList[index].name),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
