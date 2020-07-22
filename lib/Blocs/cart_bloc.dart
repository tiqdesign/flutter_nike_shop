import 'dart:async';

import 'package:nikeshop/Data/cart_service.dart';
import 'package:nikeshop/Models/Cart.dart';

class CartBloc {

  final cartStreamController = StreamController.broadcast();

  Stream get getStream => cartStreamController.stream;
  
  void addToCart(Cart cartItem){
    CartService.addToCart(cartItem);
    cartStreamController.sink.add(CartService.getAll());
  }

  void removeFromCart(Cart cartItem){
    CartService.removeFromCart(cartItem);
    cartStreamController.sink.add(CartService.getAll());
  }

  List<Cart> getAll(){
    return CartService.getAll();
  }
}

final cartBloc = CartBloc();