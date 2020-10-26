import 'package:flutter/material.dart';
import 'package:after_init/after_init.dart';
import 'package:food_delivery_app/services/size_config.dart';
import 'package:google_fonts/google_fonts.dart';

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
    Future.delayed(Duration(seconds: 15), () {
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
  void didInitState() {}

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
              //height: 150,
              height: 16.75 * SizeConfig.heightMultiplier,
            ),
            // Container(
            //   //width: 150,
            //   width: 36.2 * SizeConfig.widthMultiplier,
            //   //height: 150,
            //   height: 16.75 * SizeConfig.heightMultiplier,
            //   decoration: BoxDecoration(
            //     image: DecorationImage(
            //       image: AssetImage(''),
            //     ),
            //   ),
            // ),
            SizedBox(
              //height: 30,
              height: 3.35 * SizeConfig.heightMultiplier,
            ),
            Center(
              child: Text(
                'FOOD DELIVERY APP',
                style: GoogleFonts.titilliumWeb(
                  textStyle: TextStyle(
                      //color: Colors.blue[800],
                      color: Color(0xFF314CFF),
                      //fontSize: 50,
                      fontSize: 5.58 * SizeConfig.textMultiplier,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Text(
              'order your food with pleasure',
              style: GoogleFonts.titilliumWeb(
                textStyle: TextStyle(
                    //color: Colors.blue[800],
                    color: Color(0xFF314CFF),
                    //fontSize: 20,
                    fontSize: 2.23 * SizeConfig.textMultiplier,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              //height: 150,
              height: 16.75 * SizeConfig.heightMultiplier,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'version',
                  style: GoogleFonts.titilliumWeb(
                    textStyle: TextStyle(
                        //color: Colors.blue[800],
                        color: Color(0xFF314CFF),
                        //fontSize: 15,
                        fontSize: 1.67 * SizeConfig.textMultiplier,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                  ' 1.1.01',
                  style: GoogleFonts.titilliumWeb(
                    textStyle: TextStyle(
                        //color: Colors.blue[800],
                        color: Color(0xFF314CFF),
                        //fontSize: 15,
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
