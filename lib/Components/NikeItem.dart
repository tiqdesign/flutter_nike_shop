import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nikeshop/Constant/C_Colors.dart';
import 'package:nikeshop/Models/Shoes.dart';
import 'package:nikeshop/Services/HexColor.dart';

class NikeItem extends StatefulWidget {

  const NikeItem({
    Key key,
    @required this.shoes,

  }) : super(key: key);

  final Shoes shoes;

  @override
  _NikeItemState createState() => _NikeItemState();
}

class _NikeItemState extends State<NikeItem> {

  cn_Colors colors;

  @override
  void initState() {
    super.initState();
    colors = new cn_Colors();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 460,
            width: MediaQuery.of(context).size.width,
            child: Card(
              color: HexColor(widget.shoes.color),
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              child: Center(
                child: Transform.rotate(
                    angle: pi / 4 - 20,
                    child: Transform.translate(
                      offset: Offset(-20,0),
                      child: Image.network(
                        widget.shoes.image,
                        width: 400,
                      ),
                    )),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  widget.shoes.name,
                  style: TextStyle(
                      wordSpacing: 1.2,
                      color: colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  widget.shoes.description,
                  style: TextStyle(
                    color: colors.black,
                    wordSpacing: 1.2,
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.shoes.price.toString(),
                      style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w800),
                    ),
                    FloatingActionButton(
                      onPressed: () {},
                      elevation: 0,
                      backgroundColor: colors.yellow,
                      child: Icon(Icons.check,
                          size: 30, color: colors.black),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
