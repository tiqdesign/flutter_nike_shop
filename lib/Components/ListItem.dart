import 'dart:math';
import 'package:flutter/material.dart';
import 'package:nikeshop/Constant/C_Colors.dart';
import 'package:nikeshop/Models/Shoes.dart';
import 'package:nikeshop/Services/HexColor.dart';

class ListItem extends StatelessWidget {
  const ListItem({
    Key key,
    @required this.listItem,
  }) : super(key: key);

  final Shoes listItem;

  @override
  Widget build(BuildContext context) {
    cn_Colors color = new cn_Colors();
    return FittedBox(
      child: Card(
        elevation: 0,
        color: Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                      color: HexColor(listItem.color),
                      borderRadius:
                      BorderRadius.circular(120)),
                ),
                Transform.rotate(
                  angle: pi / 4 - 20,
                  child: Transform.translate(
                    offset: Offset(0, 5),
                    child: Image.network(
                      listItem.image,
                      width: 150,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              width: 20.0,
            ),
            Container(
              width:
              MediaQuery.of(context).size.width / 2,
              child: Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [
                  Text(
                    listItem.name,
                    style: TextStyle(
                        color: color.black,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.1),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    listItem.price.toString() + ' TL',
                    style: TextStyle(
                        color: color.black,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
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