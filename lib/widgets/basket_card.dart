import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/basket_provider.dart';
import 'package:food_delivery_app/services/size_config.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BasketCard extends StatelessWidget {
  int index;

  BasketCard(this.index);

  @override
  Widget build(BuildContext context) {
    BasketProvider basketProvider = Provider.of<BasketProvider>(context);
    return Dismissible(
      key: UniqueKey(),
      background: Container(
        color: Colors.red,
      ),
      onDismissed: (direction) {
        basketProvider.removeFromBasket(basketProvider.basketList[index]);
      },
      confirmDismiss: (DismissDirection direction) async {
        final bool res = await showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              title: Text(
                'Confirm',
                style: GoogleFonts.titilliumWeb(
                  textStyle: TextStyle(
                      color: Colors.green[800],
                      fontSize: 2 * SizeConfig.textMultiplier,
                      fontWeight: FontWeight.bold),
                ),
              ),
              content: Text(
                'Do you want to delete this basket item?',
                style: GoogleFonts.titilliumWeb(
                  textStyle: TextStyle(
                      color: Colors.green[800],
                      fontSize: 2 * SizeConfig.textMultiplier,
                      fontWeight: FontWeight.bold),
                ),
              ),
              actions: <Widget>[
                FlatButton(
                  onPressed: () => Navigator.of(context).pop(true),
                  child: Text(
                    'DELETE',
                    style: GoogleFonts.titilliumWeb(
                      textStyle: TextStyle(
                          color: Colors.green[800],
                          fontSize: 2 * SizeConfig.textMultiplier,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                FlatButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: Text(
                    'CANCEL',
                    style: GoogleFonts.titilliumWeb(
                      textStyle: TextStyle(
                          color: Colors.green[800],
                          fontSize: 2 * SizeConfig.textMultiplier,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            );
          },
        );
        return res;
      },
      child: ListTile(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
                color: Colors.deepOrangeAccent,
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: NetworkImage(
                        basketProvider.basketList[index].model.link),
                    fit: BoxFit.cover)),
          ),
        ),
        title: Text(
          basketProvider.basketList[index].model.name,
          style: GoogleFonts.titilliumWeb(
            textStyle: TextStyle(
                color: Colors.green[800],
                fontSize: 2 * SizeConfig.textMultiplier,
                fontWeight: FontWeight.bold),
          ),
        ),
        trailing: Container(
          width: 100,
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'qty: ' + basketProvider.basketList[index].quantity.toString(),
                style: GoogleFonts.titilliumWeb(
                  textStyle: TextStyle(
                      color: Colors.green[800],
                      fontSize: 2 * SizeConfig.textMultiplier,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Text(
                "₺ " + basketProvider.basketList[index].amount.toString(),
                style: GoogleFonts.titilliumWeb(
                  textStyle: TextStyle(
                      color: Colors.green[800],
                      fontSize: 2 * SizeConfig.textMultiplier,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
