import 'dart:async';

import 'package:nikeshop/Data/shoes_service.dart';
import 'package:nikeshop/Models/Shoes.dart';

class ShoesBloc{
  // ignore: close_sinks
  final shoesStreamController = StreamController.broadcast();

  Stream get getStream => shoesStreamController.stream;

  Stream<List<Shoes>> get getAll async* {
    yield await ShoesService.getShoes();
  }
}

final shoesBloc = ShoesBloc();