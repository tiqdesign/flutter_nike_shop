import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nikeshop/Components/NikeItem.dart';
import 'package:nikeshop/Constant/C_Colors.dart';
import 'package:nikeshop/Services/NikeService.dart';
import 'package:nikeshop/Models/Shoes.dart';


class NikeList extends StatefulWidget {
  @override
  _NikeListState createState() => _NikeListState();
}

class _NikeListState extends State<NikeList> {
  cn_Colors colors;
  NikeService _service = new NikeService();
  Future<List<Shoes>> shoes;

  @override
  void initState() {
    super.initState();
    shoes = _service.getShoes();
    colors = new cn_Colors();
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      child: ListView(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(200.0),
                ),
                child: Container(
                  color: colors.yellow,
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
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 5.0, 0, 0),
                      child: Image.network(
                        'https://s3-us-west-2.amazonaws.com/s.cdpn.io/1315882/pngwave.png',
                        width: 60,
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    //PickedItems
                    Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: Text(
                        'Picked items',
                        style: TextStyle(
                            color: colors.black,
                            fontSize: 32,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    //NikeItems
                    FutureBuilder(
                      future: shoes,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return NikeItem(shoes: snapshot.data[5]);
                        } else if (snapshot.hasError) {
                        }
                        return CircularProgressIndicator();
                      },
                    ),
                    SizedBox(
                      height: 70,
                    ),
                    FutureBuilder(
                      future: shoes,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return NikeItem(shoes: snapshot.data[1]);
                        } else if (snapshot.hasError) {
                        }
                        return CircularProgressIndicator();
                      },
                    ),
                    SizedBox(
                      height: 70,
                    ),
                    FutureBuilder(
                      future: shoes,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return NikeItem(shoes: snapshot.data[0]);
                        } else if (snapshot.hasError) {
                        }
                        return CircularProgressIndicator();
                      },
                    ),
                    SizedBox(
                      height: 70,
                    ),
                    FutureBuilder(
                      future: shoes,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return NikeItem(shoes: snapshot.data[2]);
                        } else if (snapshot.hasError) {
                        }
                        return CircularProgressIndicator();
                      },
                    ),
                    SizedBox(
                      height: 70,
                    ),
                    FutureBuilder(
                      future: shoes,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return NikeItem(shoes: snapshot.data[3]);
                        } else if (snapshot.hasError) {
                        }
                        return CircularProgressIndicator();
                      },
                    ),
                    SizedBox(
                      height: 70,
                    ),
                    FutureBuilder(
                      future: shoes,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return NikeItem(shoes: snapshot.data[4]);
                        } else if (snapshot.hasError) {
                        }
                        return CircularProgressIndicator();
                      },
                    ),
                    SizedBox(
                      height: 70,
                    ),
                    FutureBuilder(
                      future: shoes,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return NikeItem(shoes: snapshot.data[6]);
                        } else if (snapshot.hasError) {
                        }
                        return CircularProgressIndicator();
                      },
                    ),
                    SizedBox(
                      height: 70,
                    ),
                    FutureBuilder(
                      future: shoes,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return NikeItem(shoes: snapshot.data[7]);
                        } else if (snapshot.hasError) {
                        }
                        return CircularProgressIndicator();
                      },
                    ),
                    SizedBox(
                      height: 70,
                    ),
                    FutureBuilder(
                      future: shoes,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return NikeItem(shoes: snapshot.data[8]);
                        } else if (snapshot.hasError) {
                        }
                        return CircularProgressIndicator();
                      },
                    ),
                    SizedBox(
                      height: 70,
                    ),
                    FutureBuilder(
                      future: shoes,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return NikeItem(shoes: snapshot.data[9]);
                        } else if (snapshot.hasError) {
                        }
                        return CircularProgressIndicator();
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
