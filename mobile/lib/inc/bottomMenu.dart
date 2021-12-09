import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomMenu extends StatelessWidget {
  const BottomMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
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
    );
  }
}
