import 'package:flutter/material.dart';
import 'package:food_delivery_app/services/size_config.dart';

class DetailScreen extends StatefulWidget {
  final String name;

  DetailScreen(this.name);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
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
                    onTap: () {},
                    child: Padding(
                        padding: EdgeInsets.only(
                            top: 0.89 * SizeConfig.heightMultiplier,
                            left: 1.93 * SizeConfig.widthMultiplier,
                            right: 1.93 * SizeConfig.widthMultiplier,
                            bottom: 0.89 * SizeConfig.heightMultiplier),
                        child: Icon(
                          Icons.star,
                          color: Color(0xff000000),
                          size: 3.35 * SizeConfig.heightMultiplier,
                        )),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
