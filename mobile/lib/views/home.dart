import 'dart:ui';

//Views for Navigator
import './login.dart';
import './register.dart';

//Included widgets
import '../inc/nav.dart';
import '../inc/bottomMenu.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomAppBar(
          color: const Color(0xff303744),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                  icon: FaIcon(
                    FontAwesomeIcons.home,
                    color: Colors.white,
                  ),
                  onPressed: () {}),
              IconButton(
                  icon: FaIcon(
                    FontAwesomeIcons.search,
                    color: Colors.white,
                  ),
                  onPressed: () {}),
              IconButton(
                  icon: FaIcon(
                    FontAwesomeIcons.heart,
                    color: Colors.white,
                  ),
                  onPressed: () {}),
              IconButton(
                  icon: FaIcon(
                    FontAwesomeIcons.shoppingCart,
                    color: Colors.white,
                  ),
                  onPressed: () {}),
              IconButton(
                  icon: FaIcon(
                    FontAwesomeIcons.userCircle,
                    color: Colors.white,
                  ),
                  onPressed: () {}),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(color: const Color(0xfff5f5f5)),
              child: Row(
                children: [
                  Expanded(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Nav(),
                      //Tile Category List
                      Container(
                        padding: EdgeInsets.only(top: 20, bottom: 20, left: 10),
                        height: 140.0,
                        child: new ListView(children: [
                          //Redirect to shop with this category applied as filter - RTV/AGD
                          GestureDetector(
                            onTap: () {},
                            child: Card(
                                child: new Container(
                              width: 80.0,
                              padding: EdgeInsets.all(5),
                              child: new Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  FaIcon(FontAwesomeIcons.plug,
                                      color: const Color(0xffcfcfcf), size: 35),
                                  Text("RTV/AGD",
                                      style: TextStyle(
                                          color: const Color(0xffcfcfcf),
                                          fontWeight: FontWeight.w600))
                                ],
                              ),
                              alignment: Alignment.center,
                            )),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Card(
                                child: new Container(
                              width: 80.0,
                              padding: EdgeInsets.all(5),
                              child: new Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  FaIcon(FontAwesomeIcons.tshirt,
                                      color: const Color(0xffcfcfcf), size: 35),
                                  Text("Clothing",
                                      style: TextStyle(
                                          color: const Color(0xffcfcfcf),
                                          fontWeight: FontWeight.w600))
                                ],
                              ),
                              alignment: Alignment.center,
                            )),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Card(
                                child: new Container(
                              width: 80.0,
                              padding: EdgeInsets.all(5),
                              child: new Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  FaIcon(FontAwesomeIcons.couch,
                                      color: const Color(0xffcfcfcf), size: 35),
                                  Text("Furniture",
                                      style: TextStyle(
                                          color: const Color(0xffcfcfcf),
                                          fontWeight: FontWeight.w600))
                                ],
                              ),
                              alignment: Alignment.center,
                            )),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Card(
                                child: new Container(
                              width: 80.0,
                              padding: EdgeInsets.all(5),
                              child: new Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  FaIcon(FontAwesomeIcons.paperclip,
                                      color: const Color(0xffcfcfcf), size: 35),
                                  Text("Office",
                                      style: TextStyle(
                                          color: const Color(0xffcfcfcf),
                                          fontWeight: FontWeight.w600))
                                ],
                              ),
                              alignment: Alignment.center,
                            )),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Card(
                                child: new Container(
                              width: 80.0,
                              padding: EdgeInsets.all(5),
                              child: new Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  FaIcon(FontAwesomeIcons.basketballBall,
                                      color: const Color(0xffcfcfcf), size: 35),
                                  Text("Sport",
                                      style: TextStyle(
                                          color: const Color(0xffcfcfcf),
                                          fontWeight: FontWeight.w600))
                                ],
                              ),
                              alignment: Alignment.center,
                            )),
                          )
                        ], scrollDirection: Axis.horizontal),
                      ),
                      //Section Title
                      Container(
                        color: Colors.white,
                        padding: EdgeInsets.only(left: 10, top: 10, bottom: 10),
                        child: Row(
                          children: [
                            Text(
                              "Sale",
                              style: TextStyle(
                                  color: const Color(0xff304744),
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                      ),
                      //Sale product list
                      Container(
                        child: Container(
                          padding:
                              EdgeInsets.only(top: 10, bottom: 10, left: 10),
                          color: const Color(0xffffffff),
                          height: 300.0,
                          child: new ListView(children: [
                            GestureDetector(
                              onTap: () {},
                              child: Card(
                                  child: new Container(
                                width: 150.0,
                                padding: EdgeInsets.all(5),
                                child: new Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Image.asset('assets/images/backpack.png'),
                                    Text(
                                      "Backpack Adidas Premium",
                                      style: TextStyle(
                                          color: const Color(0xff303744),
                                          fontWeight: FontWeight.w600),
                                      textAlign: TextAlign.center,
                                    ),
                                    Text(
                                      "69.99 \$",
                                      style: TextStyle(
                                          color: const Color(0xff9e9e9e),
                                          fontWeight: FontWeight.w600,
                                          fontSize: 12,
                                          decoration:
                                              TextDecoration.lineThrough),
                                      textAlign: TextAlign.center,
                                    ),
                                    Text(
                                      "49.90 \$",
                                      style: TextStyle(
                                          color: const Color(0xffcf4e6c),
                                          fontWeight: FontWeight.w800,
                                          fontSize: 20),
                                      textAlign: TextAlign.center,
                                    ),
                                    TextButton(
                                        onPressed: () {},
                                        child: Container(
                                          padding: EdgeInsets.only(
                                              top: 5, bottom: 5),
                                          color: const Color(0xffcf4e6c),
                                          child: (Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              FaIcon(
                                                FontAwesomeIcons.cartArrowDown,
                                                color: Colors.white,
                                                size: 15,
                                              )
                                            ],
                                          )),
                                        ))
                                  ],
                                ),
                                alignment: Alignment.center,
                              )),
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Card(
                                  child: new Container(
                                width: 150.0,
                                padding: EdgeInsets.all(5),
                                child: new Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Image.asset('assets/images/blender.png'),
                                    Text(
                                      "Blender",
                                      style: TextStyle(
                                          color: const Color(0xff303744),
                                          fontWeight: FontWeight.w600),
                                      textAlign: TextAlign.center,
                                    ),
                                    Text(
                                      "69.99 \$",
                                      style: TextStyle(
                                          color: const Color(0xff9e9e9e),
                                          fontWeight: FontWeight.w600,
                                          fontSize: 12,
                                          decoration:
                                              TextDecoration.lineThrough),
                                      textAlign: TextAlign.center,
                                    ),
                                    Text(
                                      "49.90 \$",
                                      style: TextStyle(
                                          color: const Color(0xffcf4e6c),
                                          fontWeight: FontWeight.w800,
                                          fontSize: 20),
                                      textAlign: TextAlign.center,
                                    ),
                                    TextButton(
                                        onPressed: () {},
                                        child: Container(
                                          padding: EdgeInsets.only(
                                              top: 5, bottom: 5),
                                          color: const Color(0xffcf4e6c),
                                          child: (Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              FaIcon(
                                                FontAwesomeIcons.cartArrowDown,
                                                color: Colors.white,
                                                size: 15,
                                              )
                                            ],
                                          )),
                                        ))
                                  ],
                                ),
                                alignment: Alignment.center,
                              )),
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Card(
                                  child: new Container(
                                width: 150.0,
                                padding: EdgeInsets.all(5),
                                child: new Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Image.asset(
                                        'assets/images/sample-product.jpg'),
                                    Text(
                                      "Black/White T-Shirt",
                                      style: TextStyle(
                                          color: const Color(0xff303744),
                                          fontWeight: FontWeight.w600),
                                      textAlign: TextAlign.center,
                                    ),
                                    Text(
                                      "69.99 \$",
                                      style: TextStyle(
                                          color: const Color(0xff9e9e9e),
                                          fontWeight: FontWeight.w600,
                                          fontSize: 12,
                                          decoration:
                                              TextDecoration.lineThrough),
                                      textAlign: TextAlign.center,
                                    ),
                                    Text(
                                      "49.90 \$",
                                      style: TextStyle(
                                          color: const Color(0xffcf4e6c),
                                          fontWeight: FontWeight.w800,
                                          fontSize: 20),
                                      textAlign: TextAlign.center,
                                    ),
                                    TextButton(
                                        onPressed: () {},
                                        child: Container(
                                          padding: EdgeInsets.only(
                                              top: 5, bottom: 5),
                                          color: const Color(0xffcf4e6c),
                                          child: (Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              FaIcon(
                                                FontAwesomeIcons.cartArrowDown,
                                                color: Colors.white,
                                                size: 15,
                                              )
                                            ],
                                          )),
                                        ))
                                  ],
                                ),
                                alignment: Alignment.center,
                              )),
                            ),
                          ], scrollDirection: Axis.horizontal),
                        ),
                      ),
                      //Section Title
                      Container(
                        color: Colors.white,
                        margin: EdgeInsets.only(top: 30),
                        padding: EdgeInsets.only(left: 10, top: 10, bottom: 10),
                        child: Row(
                          children: [
                            Text(
                              "Trending",
                              style: TextStyle(
                                  color: const Color(0xff304744),
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                      ),
                      //Trending Section
                      Container(
                        child: Container(
                          padding:
                              EdgeInsets.only(top: 10, bottom: 10, left: 10),
                          color: const Color(0xffffffff),
                          height: 300.0,
                          child: new ListView(children: [
                            GestureDetector(
                              onTap: () {},
                              child: Card(
                                  child: new Container(
                                width: 150.0,
                                padding: EdgeInsets.all(5),
                                child: new Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Image.asset('assets/images/backpack.png'),
                                    Text(
                                      "Backpack Adidas Premium",
                                      style: TextStyle(
                                          color: const Color(0xff303744),
                                          fontWeight: FontWeight.w600),
                                      textAlign: TextAlign.center,
                                    ),
                                    Text(
                                      "49.90 \$",
                                      style: TextStyle(
                                          color: const Color(0xffcf4e6c),
                                          fontWeight: FontWeight.w800,
                                          fontSize: 20),
                                      textAlign: TextAlign.center,
                                    ),
                                    TextButton(
                                        onPressed: () {},
                                        child: Container(
                                          padding: EdgeInsets.only(
                                              top: 5, bottom: 5),
                                          color: const Color(0xffcf4e6c),
                                          child: (Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              FaIcon(
                                                FontAwesomeIcons.cartArrowDown,
                                                color: Colors.white,
                                                size: 15,
                                              )
                                            ],
                                          )),
                                        ))
                                  ],
                                ),
                                alignment: Alignment.center,
                              )),
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Card(
                                  child: new Container(
                                width: 150.0,
                                padding: EdgeInsets.all(5),
                                child: new Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Image.asset('assets/images/blender.png'),
                                    Text(
                                      "Blender",
                                      style: TextStyle(
                                          color: const Color(0xff303744),
                                          fontWeight: FontWeight.w600),
                                      textAlign: TextAlign.center,
                                    ),
                                    Text(
                                      "49.90 \$",
                                      style: TextStyle(
                                          color: const Color(0xffcf4e6c),
                                          fontWeight: FontWeight.w800,
                                          fontSize: 20),
                                      textAlign: TextAlign.center,
                                    ),
                                    TextButton(
                                        onPressed: () {},
                                        child: Container(
                                          padding: EdgeInsets.only(
                                              top: 5, bottom: 5),
                                          color: const Color(0xffcf4e6c),
                                          child: (Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              FaIcon(
                                                FontAwesomeIcons.cartArrowDown,
                                                color: Colors.white,
                                                size: 15,
                                              )
                                            ],
                                          )),
                                        ))
                                  ],
                                ),
                                alignment: Alignment.center,
                              )),
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Card(
                                  child: new Container(
                                width: 150.0,
                                padding: EdgeInsets.all(5),
                                child: new Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Image.asset(
                                        'assets/images/sample-product.jpg'),
                                    Text(
                                      "Black/White T-Shirt",
                                      style: TextStyle(
                                          color: const Color(0xff303744),
                                          fontWeight: FontWeight.w600),
                                      textAlign: TextAlign.center,
                                    ),
                                    Text(
                                      "49.90 \$",
                                      style: TextStyle(
                                          color: const Color(0xffcf4e6c),
                                          fontWeight: FontWeight.w800,
                                          fontSize: 20),
                                      textAlign: TextAlign.center,
                                    ),
                                    TextButton(
                                        onPressed: () {},
                                        child: Container(
                                          padding: EdgeInsets.only(
                                              top: 5, bottom: 5),
                                          color: const Color(0xffcf4e6c),
                                          child: (Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              FaIcon(
                                                FontAwesomeIcons.cartArrowDown,
                                                color: Colors.white,
                                                size: 15,
                                              )
                                            ],
                                          )),
                                        ))
                                  ],
                                ),
                                alignment: Alignment.center,
                              )),
                            ),
                          ], scrollDirection: Axis.horizontal),
                        ),
                      ),
                      Container(
                        color: Colors.white,
                        margin: EdgeInsets.only(top: 30),
                        padding: EdgeInsets.only(left: 10, top: 10, bottom: 10),
                        child: Row(
                          children: [
                            Text(
                              "Your Picks",
                              style: TextStyle(
                                  color: const Color(0xff304744),
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                      ),
                      //Your Picks Section
                      Container(
                        child: Container(
                          padding:
                              EdgeInsets.only(top: 10, bottom: 10, left: 10),
                          color: const Color(0xffffffff),
                          height: 300.0,
                          child: new ListView(children: [
                            GestureDetector(
                              onTap: () {},
                              child: Card(
                                  child: new Container(
                                width: 150.0,
                                padding: EdgeInsets.all(5),
                                child: new Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Image.asset('assets/images/backpack.png'),
                                    Text(
                                      "Backpack Adidas Premium",
                                      style: TextStyle(
                                          color: const Color(0xff303744),
                                          fontWeight: FontWeight.w600),
                                      textAlign: TextAlign.center,
                                    ),
                                    Text(
                                      "49.90 \$",
                                      style: TextStyle(
                                          color: const Color(0xffcf4e6c),
                                          fontWeight: FontWeight.w800,
                                          fontSize: 20),
                                      textAlign: TextAlign.center,
                                    ),
                                    TextButton(
                                        onPressed: () {},
                                        child: Container(
                                          padding: EdgeInsets.only(
                                              top: 5, bottom: 5),
                                          color: const Color(0xffcf4e6c),
                                          child: (Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              FaIcon(
                                                FontAwesomeIcons.cartArrowDown,
                                                color: Colors.white,
                                                size: 15,
                                              )
                                            ],
                                          )),
                                        ))
                                  ],
                                ),
                                alignment: Alignment.center,
                              )),
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Card(
                                  child: new Container(
                                width: 150.0,
                                padding: EdgeInsets.all(5),
                                child: new Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Image.asset('assets/images/blender.png'),
                                    Text(
                                      "Blender",
                                      style: TextStyle(
                                          color: const Color(0xff303744),
                                          fontWeight: FontWeight.w600),
                                      textAlign: TextAlign.center,
                                    ),
                                    Text(
                                      "49.90 \$",
                                      style: TextStyle(
                                          color: const Color(0xffcf4e6c),
                                          fontWeight: FontWeight.w800,
                                          fontSize: 20),
                                      textAlign: TextAlign.center,
                                    ),
                                    TextButton(
                                        onPressed: () {},
                                        child: Container(
                                          padding: EdgeInsets.only(
                                              top: 5, bottom: 5),
                                          color: const Color(0xffcf4e6c),
                                          child: (Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              FaIcon(
                                                FontAwesomeIcons.cartArrowDown,
                                                color: Colors.white,
                                                size: 15,
                                              )
                                            ],
                                          )),
                                        ))
                                  ],
                                ),
                                alignment: Alignment.center,
                              )),
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Card(
                                  child: new Container(
                                width: 150.0,
                                padding: EdgeInsets.all(5),
                                child: new Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Image.asset(
                                        'assets/images/sample-product.jpg'),
                                    Text(
                                      "Black/White T-Shirt",
                                      style: TextStyle(
                                          color: const Color(0xff303744),
                                          fontWeight: FontWeight.w600),
                                      textAlign: TextAlign.center,
                                    ),
                                    Text(
                                      "49.90 \$",
                                      style: TextStyle(
                                          color: const Color(0xffcf4e6c),
                                          fontWeight: FontWeight.w800,
                                          fontSize: 20),
                                      textAlign: TextAlign.center,
                                    ),
                                    TextButton(
                                        onPressed: () {},
                                        child: Container(
                                          padding: EdgeInsets.only(
                                              top: 5, bottom: 5),
                                          color: const Color(0xffcf4e6c),
                                          child: (Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              FaIcon(
                                                FontAwesomeIcons.cartArrowDown,
                                                color: Colors.white,
                                                size: 15,
                                              )
                                            ],
                                          )),
                                        ))
                                  ],
                                ),
                                alignment: Alignment.center,
                              )),
                            ),
                          ], scrollDirection: Axis.horizontal),
                        ),
                      )
                    ],
                  ))
                ],
              )),
        ));
  }
}
