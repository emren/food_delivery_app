import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/food_provider.dart';
import 'package:food_delivery_app/services/size_config.dart';
import 'package:provider/provider.dart';

class FoodCard extends StatelessWidget {
  final String name;

  FoodCard(this.name);

  @override
  Widget build(BuildContext context) {
    FoodProvider foodProvider = Provider.of<FoodProvider>(context);

    return GestureDetector(
      onTap: () {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) => Detail(name)),
        // );
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
          children: <Widget>[
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                  color: Colors.deepOrangeAccent,
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: NetworkImage(
                        "https://picsum.photos/250?image=9",
                      ),
                      fit: BoxFit.cover)),
            ),
            Text(name),
          ],
        ),
      ),
    );
  }
}
