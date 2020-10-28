
class FoodModel{
  String type;
  String name;
  String description;
  dynamic price;
  String link;

  FoodModel({this.type, this.name, this.description,  this.price, this.link});

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