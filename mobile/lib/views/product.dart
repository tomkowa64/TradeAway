import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

//Slider import
import 'package:carousel_slider/carousel_slider.dart';

class CarouselWithIndicatorDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return Product();
  }
}

class Product extends State<CarouselWithIndicatorDemo> {
  int _current = 0;
  final CarouselController _controller = CarouselController();
  List<Image> imgList = [
    Image.asset('assets/images/backpack.png'),
    Image.asset('assets/images/backpack.png'),
    Image.asset('assets/images/backpack.png')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: EdgeInsets.only(top: 40),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(color: const Color(0xfff5f5f5)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
              child: Column(
            children: [
              //Fauvorite Icon
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: Icon(
                      FontAwesomeIcons.heart,
                      size: 30,
                    ),
                  )
                ],
              ),
              //Image Carousel
              Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 400,
                    child: CarouselSlider(
                      options: CarouselOptions(
                        aspectRatio: 1.5,
                        enlargeCenterPage: true,
                        scrollDirection: Axis.horizontal,
                        autoPlay: false,
                      ),
                      items: this.imgList,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: imgList.asMap().entries.map((entry) {
                  return GestureDetector(
                    onTap: () => _controller.animateToPage(entry.key),
                    child: Container(
                      width: 12.0,
                      height: 12.0,
                      margin:
                          EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: (Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? Colors.white
                                  : Colors.black)
                              .withOpacity(_current == entry.key ? 0.9 : 0.4)),
                    ),
                  );
                }).toList(),
              ),
            ],
          ))
        ],
      ),
    ));
  }
}
