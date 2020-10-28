import 'package:flutter/material.dart';
import 'package:after_init/after_init.dart';
import 'package:food_delivery_app/models/food_provider.dart';
import 'package:food_delivery_app/services/size_config.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'home.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with AfterInitMixin<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 5), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Home()),
      );
    });
  }

/*
Afterinit package adds didInitState method which is called after initState and before Widget build just for once.
This will be a good place to load states and shared prefs.
 */

  @override
  void didInitState() {
    FoodProvider foodProvider = Provider.of<FoodProvider>(context);
    foodProvider.initFoodList();
    foodProvider.loadFavoriteFoods();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 16.75 * SizeConfig.heightMultiplier,
            ),
            Container(
              height: 400,
              width: 400,
              decoration: BoxDecoration(
                  color: Colors.deepOrangeAccent, shape: BoxShape.circle),
              child: Center(
                child: Text(
                  'FOOD DELIVERY APP',
                  style: GoogleFonts.hennyPenny(
                    textStyle: TextStyle(
                        color: Colors.green[300],
                        fontSize: 4 * SizeConfig.textMultiplier,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 3.35 * SizeConfig.heightMultiplier,
            ),
            Text(
              'order your food with pleasure',
              style: GoogleFonts.titilliumWeb(
                textStyle: TextStyle(
                    color: Colors.green[800],
                    fontSize: 2.23 * SizeConfig.textMultiplier,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 16.75 * SizeConfig.heightMultiplier,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'version',
                  style: GoogleFonts.titilliumWeb(
                    textStyle: TextStyle(
                        color: Colors.green[800],
                        fontSize: 1.67 * SizeConfig.textMultiplier,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                  ' 1.1.01',
                  style: GoogleFonts.titilliumWeb(
                    textStyle: TextStyle(
                        color: Colors.green[800],
                        fontSize: 1.67 * SizeConfig.textMultiplier,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
