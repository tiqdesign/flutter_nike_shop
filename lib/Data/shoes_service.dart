import 'package:nikeshop/Models/Shoes.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ShoesService{
  static List<Shoes> shoes = new List<Shoes>();
  static String url = "https://s3-us-west-2.amazonaws.com/s.cdpn.io/1315882/shoes.json";
  static ShoesService _singleton = ShoesService._internal();

  factory ShoesService(){
    return _singleton;
  }

  ShoesService._internal();

  static Future<List<Shoes>> getShoes() async {
    final res = await http.get(url);
    if (res.statusCode == 200) {
      var content = res.body;
      var arr = json.decode(content);
      var shoes_list = arr['shoes'] as List;
      return shoes_list.map((e) => Shoes.fromJson(e)).toList();
    }
  }
}

