import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/food_provider.dart';
import 'package:food_delivery_app/services/size_config.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DetailScreen extends StatefulWidget {
  final String name;

  DetailScreen(this.name);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    FoodProvider foodProvider = Provider.of<FoodProvider>(context);

    return Scaffold(
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: 24.15 * SizeConfig.widthMultiplier,
                      height: 5.58 * SizeConfig.heightMultiplier,
                      child: Icon(
                        Icons.chevron_left,
                        color: Color(0xff000000),
                        //size: 30.0,
                        size: 3.35 * SizeConfig.heightMultiplier,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      if (!foodProvider
                          .isFavorite(foodProvider.getFood(widget.name))) {
                        foodProvider
                            .addToFavorites(foodProvider.getFood(widget.name));
                      } else {
                        foodProvider.removeFromFavorites(
                            foodProvider.getFood(widget.name));
                      }
                      foodProvider
                          .saveFavoriteFoods(foodProvider.favoritesList);
                    },
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: 0.89 * SizeConfig.heightMultiplier,
                          left: 1.93 * SizeConfig.widthMultiplier,
                          right: 1.93 * SizeConfig.widthMultiplier,
                          bottom: 0.89 * SizeConfig.heightMultiplier),
                      child: foodProvider
                              .isFavorite(foodProvider.getFood(widget.name))
                          ? Icon(
                              Icons.star,
                              color: Color(0xff000000),
                              size: 3.35 * SizeConfig.heightMultiplier,
                            )
                          : Icon(
                              Icons.star,
                              color: Color(0xffe3e3e3),
                              //size: 30.0,
                              size: 3.35 * SizeConfig.heightMultiplier,
                            ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                width: 80 * SizeConfig.widthMultiplier,
                height: 30 * SizeConfig.heightMultiplier,
                decoration: BoxDecoration(
                    color: Color(0xffffffff),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                          color: Color(0x29000000),
                          offset: Offset(0, 3),
                          blurRadius: 6,
                          spreadRadius: 0),
                    ],
                    image: DecorationImage(
                        image: NetworkImage(
                          foodProvider.getFood(widget.name).link,
                        ),
                        fit: BoxFit.cover)),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                widget.name,
                style: GoogleFonts.titilliumWeb(
                  textStyle: TextStyle(
                      color: Colors.green[800],
                      fontSize: 3 * SizeConfig.textMultiplier,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                foodProvider.getFood(widget.name).description,
                style: GoogleFonts.titilliumWeb(
                  textStyle: TextStyle(
                      color: Colors.green[800],
                      fontSize: 2 * SizeConfig.textMultiplier,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "₺ " + foodProvider.getFood(widget.name).price,
                style: GoogleFonts.titilliumWeb(
                  textStyle: TextStyle(
                      color: Colors.green[800],
                      fontSize: 5 * SizeConfig.textMultiplier,
                      fontWeight: FontWeight.bold),
                ),
              ),
              GestureDetector(
                onTap: () {
                  _onBuyPressed();
                },
                child: Padding(
                  padding:
                      EdgeInsets.only(top: 2.23 * SizeConfig.heightMultiplier),
                  child: Container(
                    width: 60 * SizeConfig.widthMultiplier,
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
                      child: Text("Buy",
                          style: TextStyle(
                            fontFamily: 'SFProDisplay',
                            color: Color(0xffffffff),
                            fontSize: 2.68 * SizeConfig.textMultiplier,
                            fontWeight: FontWeight.w900,
                            fontStyle: FontStyle.normal,
                          )),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _onBuyPressed() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          FoodProvider foodProvider = Provider.of<FoodProvider>(context);
          int count = 0;
          var price = int.parse(foodProvider.getFood(widget.name).price);

          return StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return Container(
                color: Color(0xFF737373),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xffffffff),
                    borderRadius: BorderRadius.only(
                      topLeft: const Radius.circular(20),
                      topRight: const Radius.circular(20),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        'Items to order:',
                        //foodProvider.getFood(widget.name).description,
                        style: GoogleFonts.titilliumWeb(
                          textStyle: TextStyle(
                              color: Colors.green[800],
                              fontSize: 2 * SizeConfig.textMultiplier,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                count = count + 1;
                              });
                            },
                            child: Container(
                              width: 24.15 * SizeConfig.widthMultiplier,
                              height: 5.58 * SizeConfig.heightMultiplier,
                              child: Icon(
                                Icons.arrow_upward,
                                color: Colors.green[800],
                                size: 5 * SizeConfig.heightMultiplier,
                              ),
                            ),
                          ),
                          Text(
                            count.toString(),
                            style: GoogleFonts.titilliumWeb(
                              textStyle: TextStyle(
                                  color: Colors.green[800],
                                  fontSize: 5 * SizeConfig.textMultiplier,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                if (count > 0) {
                                  count = count - 1;
                                } else if (count <= 0) {
                                  count = 0;
                                }
                              });
                            },
                            child: Container(
                              width: 24.15 * SizeConfig.widthMultiplier,
                              height: 5.58 * SizeConfig.heightMultiplier,
                              child: Icon(
                                Icons.arrow_downward,
                                color: Colors.green[800],
                                size: 5 * SizeConfig.heightMultiplier,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Text(
                        "₺ " + (price * count).toString(),
                        style: GoogleFonts.titilliumWeb(
                          textStyle: TextStyle(
                              color: Colors.green[800],
                              fontSize: 5 * SizeConfig.textMultiplier,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          width: 60 * SizeConfig.widthMultiplier,
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
                            child: Text("Buy",
                                style: TextStyle(
                                  fontFamily: 'SFProDisplay',
                                  color: Color(0xffffffff),
                                  fontSize: 2.68 * SizeConfig.textMultiplier,
                                  fontWeight: FontWeight.w900,
                                  fontStyle: FontStyle.normal,
                                )),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        });
  }
}
