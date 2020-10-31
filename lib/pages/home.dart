import 'package:flutter/material.dart';
import 'package:food_delivery_app/pages/basket_screen.dart';
import 'package:food_delivery_app/pages/drinks_screen.dart';
import 'package:food_delivery_app/pages/favorites_screen.dart';
import 'package:food_delivery_app/pages/pizza_screen.dart';
import 'package:food_delivery_app/pages/salad_screen.dart';
import 'package:food_delivery_app/services/size_config.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentindex = 0;

  final List<Widget> _children = [
    PizzaScreen(),
    SaladScreen(),
    DrinksScreen(),
    FavoritesScreen(),
    BasketScreen(),
  ];

  bool _isPizzaSelected = true;
  bool _isSaladSelected = false;
  bool _isDrinkSelected = false;
  bool _isFavoritesSelected = false;
  bool _isBasketSelected = false;

  void onTabTapped(int index) {
    setState(() {
      _currentindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text(
          'FOOD DELIVERY APP',
          style: GoogleFonts.hennyPenny(
            textStyle: TextStyle(
                color: Colors.green[300],
                fontSize: 3 * SizeConfig.textMultiplier,
                fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: Colors.deepOrangeAccent,
        automaticallyImplyLeading: false,
      ),
      body: _children[_currentindex],
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30), topRight: Radius.circular(30)),
        child: BottomNavigationBar(
          backgroundColor: Colors.white10,
          onTap: onTabTapped,
          currentIndex: _currentindex,
          items: [
            BottomNavigationBarItem(
              icon: IconButton(
                icon: _isPizzaSelected
                    ? Image.asset(
                        'assets/pizza_black.png',
                        height: 3.35 * SizeConfig.heightMultiplier,
                      )
                    : Image.asset(
                        'assets/pizza_white.png',
                        height: 3.35 * SizeConfig.heightMultiplier,
                      ),
                onPressed: () {
                  setState(() {
                    _currentindex = 0;
                    _isPizzaSelected = true;
                    _isSaladSelected = false;
                    _isDrinkSelected = false;
                    _isFavoritesSelected = false;
                    _isBasketSelected = false;
                  });
                },
              ),
              title: Text(
                'Pizza',
                style: TextStyle(
                    height: 0.21 * SizeConfig.heightMultiplier,
                    color: Colors.black),
              ),
            ),
            BottomNavigationBarItem(
              icon: IconButton(
                icon: _isSaladSelected
                    ? Image.asset(
                        'assets/salad_black.png',
                        height: 3.35 * SizeConfig.heightMultiplier,
                      )
                    : Image.asset(
                        'assets/salad_white.png',
                        height: 3.35 * SizeConfig.heightMultiplier,
                      ),
                onPressed: () {
                  setState(() {
                    _currentindex = 1;
                    _isPizzaSelected = false;
                    _isSaladSelected = true;
                    _isDrinkSelected = false;
                    _isFavoritesSelected = false;
                    _isBasketSelected = false;
                  });
                },
              ),
              title: Text(
                'Salad',
                style: TextStyle(
                    height: 0.21 * SizeConfig.heightMultiplier,
                    color: Colors.black),
              ),
            ),
            BottomNavigationBarItem(
              icon: IconButton(
                icon: _isDrinkSelected
                    ? Image.asset(
                        'assets/drink_black.png',
                        height: 3.35 * SizeConfig.heightMultiplier,
                      )
                    : Image.asset(
                        'assets/drink_white.png',
                        //height: 30,
                        height: 3.35 * SizeConfig.heightMultiplier,
                      ),
                onPressed: () {
                  setState(() {
                    _currentindex = 2;
                    _isPizzaSelected = false;
                    _isSaladSelected = false;
                    _isDrinkSelected = true;
                    _isFavoritesSelected = false;
                    _isBasketSelected = false;
                  });
                },
              ),
              title: Text(
                'Drink',
                style: TextStyle(
                    height: 0.21 * SizeConfig.heightMultiplier,
                    color: Colors.black),
              ),
            ),
            BottomNavigationBarItem(
              icon: IconButton(
                icon: _isFavoritesSelected
                    ? Image.asset(
                        'assets/fav_black.png',
                        height: 3.35 * SizeConfig.heightMultiplier,
                      )
                    : Image.asset(
                        'assets/fav_white.png',
                        height: 3.35 * SizeConfig.heightMultiplier,
                      ),
                onPressed: () {
                  setState(() {
                    _currentindex = 3;
                    _isPizzaSelected = false;
                    _isSaladSelected = false;
                    _isDrinkSelected = false;
                    _isFavoritesSelected = true;
                    _isBasketSelected = false;
                  });
                },
              ),
              title: Text(
                'Favs',
                style: TextStyle(
                    height: 0.21 * SizeConfig.heightMultiplier,
                    color: Colors.black),
              ),
            ),
            BottomNavigationBarItem(
              icon: IconButton(
                icon: _isBasketSelected
                    ? Image.asset(
                        'assets/bag_black.png',
                        height: 3.35 * SizeConfig.heightMultiplier,
                      )
                    : Image.asset(
                        'assets/bag_white.png',
                        height: 3.35 * SizeConfig.heightMultiplier,
                      ),
                onPressed: () {
                  setState(() {
                    _currentindex = 4;
                    _isPizzaSelected = false;
                    _isSaladSelected = false;
                    _isDrinkSelected = false;
                    _isFavoritesSelected = false;
                    _isBasketSelected = true;
                  });
                },
              ),
              title: Text(
                'Basket',
                style: TextStyle(
                    height: 0.21 * SizeConfig.heightMultiplier,
                    color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
