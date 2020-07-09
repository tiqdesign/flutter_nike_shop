
class Shoes {
  final int id;
  final String image;
  final String name;
  final String description;
  final double price;
  final String color;
  final bool inCart;

  Shoes({
    this.id,
    this.image,
    this.name,
    this.description,
    this.price,
    this.color,
    this.inCart,
  });

  Shoes fromJson(Map<String, dynamic> json){
    return Shoes(
      id : json['id'],
      image : json['image'],
      name : json['name'],
      description : json['description'],
      price : json['price'],
      color : json['color'],
      inCart : json['inCart'],
    );
  }
}