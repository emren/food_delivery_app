
import 'package:equatable/equatable.dart';

class FoodModel extends Equatable{
  final String type;
  final String name;
  final String description;
  final dynamic price;
  final String link;

  FoodModel({this.type, this.name, this.description,  this.price, this.link});

  @override
  List<Object> get props => [type, name, description, price, link];

  factory FoodModel.fromJson(Map<String, dynamic> parsedJson){
    return FoodModel(
      type: parsedJson['type'],
      name: parsedJson['name'],
      description: parsedJson['description'],
      price: parsedJson['price'],
      link: parsedJson['link'],
    );
  }

  Map<String, dynamic> toJson() => {
    'type': type,
    'name': name,
    'description': description,
    'price': price,
    'link': link,
  };

}