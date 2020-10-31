import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/food_provider.dart';
import 'package:food_delivery_app/pages/detail_screen.dart';
import 'package:food_delivery_app/services/size_config.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FoodCard extends StatelessWidget {
  final String name;

  FoodCard(this.name);

  @override
  Widget build(BuildContext context) {
    FoodProvider foodProvider = Provider.of<FoodProvider>(context);

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DetailScreen(name)),
        );
      },
      child: Container(
        width: 33.82 * SizeConfig.widthMultiplier,
        height: 20.42 * SizeConfig.heightMultiplier,
        decoration: BoxDecoration(
          color: Color(0xffffffff),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                color: Color(0x29000000),
                offset: Offset(0, 3),
                blurRadius: 6,
                spreadRadius: 0)
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 1 * SizeConfig.heightMultiplier,
            ),
            /*
            Hero tag will create our animation from foodscreens to detailscreen.
             */
            Hero(
              tag: name,
              child: Container(
                height: 10 * SizeConfig.heightMultiplier,
                width: 23.36 * SizeConfig.widthMultiplier,
                decoration: BoxDecoration(
                    color: Colors.deepOrangeAccent,
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: NetworkImage(
                          foodProvider.getFood(name).link,
                        ),
                        fit: BoxFit.cover)),
              ),
            ),
            SizedBox(
              height: 1 * SizeConfig.heightMultiplier,
            ),
            Text(name,
                style: GoogleFonts.titilliumWeb(
                  textStyle: TextStyle(
                      color: Colors.green[800],
                      fontSize: 2 * SizeConfig.textMultiplier,
                      fontWeight: FontWeight.bold),
                )),
            SizedBox(
              height: 1 * SizeConfig.heightMultiplier,
            ),
            Text("\$ "+foodProvider.getFood(name).price,
                style: GoogleFonts.titilliumWeb(
                  textStyle: TextStyle(
                      color: Colors.green[800],
                      fontSize: 2 * SizeConfig.textMultiplier,
                      fontWeight: FontWeight.bold),
                )),
          ],
        ),
      ),
    );
  }
}
