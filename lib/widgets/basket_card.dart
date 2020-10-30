import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/basket_provider.dart';
import 'package:food_delivery_app/models/food_provider.dart';
import 'package:food_delivery_app/services/size_config.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BasketCard extends StatelessWidget {
  int index;

  BasketCard(this.index);

  @override
  Widget build(BuildContext context) {
    BasketProvider basketProvider = Provider.of<BasketProvider>(context);
    return ListTile(
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
              color: Colors.deepOrangeAccent,
              shape: BoxShape.circle,
              image: DecorationImage(
                  image:
                      NetworkImage(basketProvider.basketList[index].model.link),
                  fit: BoxFit.cover)),
        ),
      ),
      title: Text(basketProvider.basketList[index].model.name,
          style: GoogleFonts.titilliumWeb(
            textStyle: TextStyle(
                color: Colors.green[800],
                fontSize: 2 * SizeConfig.textMultiplier,
                fontWeight: FontWeight.bold),
          )),
    );
  }
}
