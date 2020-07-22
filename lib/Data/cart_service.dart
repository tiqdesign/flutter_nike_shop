import 'package:nikeshop/Models/Cart.dart';

class CartService {
  static List<Cart> cartList = new List<Cart>();

  static CartService  _singleton = CartService._internal();

  factory CartService(){
    return _singleton;
  }

  CartService._internal();

  static void addToCart(Cart cartItem){
    cartList.add(cartItem);
  }

  static void removeFromCart(Cart cartItem){
    cartList.remove(cartItem);
  }

  static List<Cart> getAll(){
    return cartList;
  }
}