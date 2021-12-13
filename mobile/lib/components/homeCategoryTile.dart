import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeCategoryTile extends StatelessWidget {
  late FaIcon _categoryIcon;
  late String _categoryName;

  HomeCategoryTile(this._categoryIcon, this._categoryName);

  FaIcon get categoryIcon => _categoryIcon;

  set categoryIcon(FaIcon value) {
    _categoryIcon = value;
  }

  String get categoryName => _categoryName;

  set categoryName(String value) {
    _categoryName = value;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Card(
          child: new Container(
        width: 80.0,
        padding: EdgeInsets.all(5),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            this.categoryIcon,
            Text("${this.categoryName}",
                style: TextStyle(
                    color: const Color(0xffcfcfcf),
                    fontWeight: FontWeight.w600))
          ],
        ),
        alignment: Alignment.center,
      )),
    );
  }
}
