import 'package:flutter/material.dart';
import 'package:food_delivery_app/controls/basket_provider.dart';
import 'package:food_delivery_app/controls/food_provider.dart';
import 'package:food_delivery_app/util/size_config.dart';
import 'package:food_delivery_app/views/widgets/basket_card.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BasketScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    BasketProvider basketProvider = Provider.of<BasketProvider>(context);

    return SafeArea(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: ListView(
          children: [
            GestureDetector(
              onTap: () {
                basketProvider.clearBasket();
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
              height: 1.07 * SizeConfig.heightMultiplier,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Total \$ : ' + basketProvider.totalAmount.toString(),
                  style: GoogleFonts.titilliumWeb(
                    textStyle: TextStyle(
                        color: Colors.green[800],
                        fontSize: 4 * SizeConfig.textMultiplier,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 1.07 * SizeConfig.heightMultiplier,
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: basketProvider.basketList.length,
              itemBuilder: (BuildContext context, int index) {
                return BasketCard(index);
              },
            ),
          ],
        ),
      ),
    );
  }
}
