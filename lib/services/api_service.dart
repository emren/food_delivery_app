import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/food_model.dart';
import 'package:food_delivery_app/controls/food_provider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io' show HttpException, Platform, SocketException;
import 'package:provider/provider.dart';

class ApiService {
  BuildContext context;

  ApiService({this.context});

  Future<String> takeData(String type) async {
    FoodProvider foodProvider = Provider.of<FoodProvider>(context);
    /*
    In order to reach local server we need to use
    IOS 127.0.0.1
    ANDROID 10.0.2.2
    as the localhost
     */

    String url = Platform.isIOS
        ? 'http://127.0.0.1:3000/' + type
        : 'http://10.0.2.2:3000/' + type;

    try{
      final response = await http.get(url);
      String data = response.body;
      if (response.statusCode != 200) throw HttpException('${response.statusCode}');
      if (response.statusCode == 200 && response.body.isNotEmpty) {
        final jsonResponse = json.decode(data);
        for (var i = 0; i < jsonResponse.length; i++) {
          FoodModel food = FoodModel.fromJson(jsonResponse[i]);
          foodProvider.addToFoodList(food);
        }
      }
    } on SocketException{
      print("Socket exception: No Internet connection");
    } on HttpException {
      print("Http exception: Couldn't find the request");
    } on FormatException {
      print("Format exception: Bad response format");
    }

  }
}
