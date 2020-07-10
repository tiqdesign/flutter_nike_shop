import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nikeshop/Components/ListItem.dart';
import 'package:nikeshop/Constant/C_Colors.dart';
import 'package:nikeshop/Models/Shoes.dart';
import 'package:nikeshop/Services/HexColor.dart';

class CartList extends StatefulWidget {
  final List<Shoes> list;

  const CartList({
    Key key,
    @required this.list,
  }) : super(key: key);

  @override
  _CartListState createState() => _CartListState();
}

class _CartListState extends State<CartList> {
  cn_Colors color;
  double totalPrice = 0;

  @override
  void initState() {
    color = cn_Colors();
    setState(() {
      widget.list.forEach((element) {
        totalPrice += element.price;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
            backgroundColor: color.yellow,
            child: Center(
                child: Text(
                  totalPrice == 0.0 ? ' 0 ' :
              totalPrice.toString(),
              style: TextStyle(
                  color: color.black,
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            )),
            onPressed: () {}),
        body: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(200.0),
              ),
              child: Container(
                color: color.yellow,
                width: 200,
                height: 200,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(25.0, 20.0, 25.0, 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Logo
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 5.0, 0, 0),
                        child: Image.network(
                          'https://s3-us-west-2.amazonaws.com/s.cdpn.io/1315882/pngwave.png',
                          width: 60,
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.arrow_back,
                          size: 35,
                          color: color.yellow,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  //Your Cart
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Text(
                      'Your Cart',
                      style: TextStyle(
                          color: color.black,
                          fontSize: 32,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  FittedBox(
                    fit: BoxFit.cover,
                    child: Container(
                      height: MediaQuery.of(context).size.height - 120,
                      width: MediaQuery.of(context).size.width,
                      child: widget.list.length <= 0
                          ? Center(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.remove_shopping_cart, color: color.black,size: 40,),
                                  SizedBox(height: 5,),
                                  Text(
                                  'Your Cart Is Empty!',
                                  style: TextStyle(
                                      color: color.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24),
                            ),
                                ],
                              ))
                          : ListView.builder(
                              itemCount: widget.list.length,
                              itemBuilder: (context, index) {
                                var listItem = widget.list[index];
                                return ListItem(listItem: listItem);
                              }),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
