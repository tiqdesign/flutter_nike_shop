import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:nikeshop/Models/Shoes.dart';

class NikeService {
  final String url = "https://s3-us-west-2.amazonaws.com/s.cdpn.io/1315882/shoes.json";

  Future<List<Shoes>> getShoes() async {
    final res = await http.get(url);
    if (res.statusCode == 200) {
      var content = res.body;
      var arr = json.decode(content);
      var shoes_list = arr['shoes'] as List;
      return shoes_list.map((e) => fromJson(e)).toList();
    }
  }

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
