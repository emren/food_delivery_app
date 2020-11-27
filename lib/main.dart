import 'package:flutter/material.dart';
import 'package:food_delivery_app/ui/pages/splash_screen.dart';
import 'package:food_delivery_app/core/util/size_config.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'core/viewmodels/basket_provider.dart';
import 'core/viewmodels/food_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(
          builder: (context, orientation) {
            SizeConfig().init(constraints, orientation);
            return MultiProvider(
              providers: [
                ChangeNotifierProvider(
                  create: (context) => FoodProvider(),
                ),
                ChangeNotifierProvider(
                  create: (context) => BasketProvider(),
                ),
              ],
              child: MaterialApp(
                debugShowCheckedModeBanner: false,
                home: SplashScreen(),
              ),
            );
          },
        );
      },
    );
  }
}
