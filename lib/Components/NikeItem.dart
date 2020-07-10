import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nikeshop/Constant/C_Colors.dart';
import 'package:nikeshop/Models/Shoes.dart';
import 'package:nikeshop/Services/HexColor.dart';

class NikeItem extends StatefulWidget {

  final Shoes shoes;
  final Function cartItemsChanged;

  const NikeItem({
    Key key,
    @required this.shoes, this.cartItemsChanged
  }) : super(key: key);


  @override
  _NikeItemState createState() => _NikeItemState();
}

class _NikeItemState extends State<NikeItem>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animateIcon;
  Animation<Color> _animateColor;
  Animation<Color> _animateIconColor;
  Curve _curve = Curves.easeIn;
  bool isAdded = false;
  cn_Colors colors;


  animate() {
    if (!isAdded) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
    isAdded = !isAdded;
  }

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300))
          ..addListener(() {
            setState(() {});
          });

    //Change icon size
    _animateIcon = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);

    //For Floating Action Button
    _animateColor = ColorTween(
      begin: Color(0xfff6c90e),
      end: Colors.green,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Interval(
        0.00,
        1.00,
        curve: _curve,
      ),
    ));

    //For icon color
    _animateIconColor = ColorTween(
      begin: Colors.black,
      end: Colors.white,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Interval(
        0.00,
        1.00,
        curve: _curve,
      ),
    ));

    super.initState();
    colors = new cn_Colors();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
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
                      offset: Offset(-20, 0),
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.shoes.price.toString(),
                      style:
                          TextStyle(fontSize: 26, fontWeight: FontWeight.w800),
                    ),
                    FloatingActionButton(
                      onPressed: () {
                        animate();
                        widget.cartItemsChanged(isAdded);
                        //increment the number of cart badge
                      },
                      elevation: 0,
                      backgroundColor: _animateColor.value,
                      // This is awesome -- Custom AnimatedIcons
                      // Stack yapmamın sebebi iki iconu üst üste getirip elimizde bulunan 0-1 arasındaki animasyondan gelen değeri doğru kullanarak hem boyutu değişen
                      // hemde opacity si azalan bir icon animasyonu elde ettik.
                      child: Stack(
                        children:[
                          Opacity(
                            opacity : 1 - _animateIcon.value,
                            child: Icon(
                              Icons.add_shopping_cart,
                              color: _animateIconColor.value,
                              size: 25 - _animateIcon.value * 25,
                            ),
                          ),
                          Opacity(
                            opacity : _animateIcon.value,
                            child: Icon(
                              Icons.shopping_cart,
                              color: _animateIconColor.value,
                              size: _animateIcon.value * 25,
                            ),
                          ),
                      ]
                      ),
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
