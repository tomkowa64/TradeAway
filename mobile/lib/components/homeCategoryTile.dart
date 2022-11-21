import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeCategoryTile extends StatelessWidget {
  late FaIcon _categoryIcon;
  late String _categoryName;
  late num _categoryId;

  HomeCategoryTile(this._categoryIcon, this._categoryName, this._categoryId);

  FaIcon get categoryIcon => _categoryIcon;

  set categoryIcon(FaIcon value) {
    _categoryIcon = value;
  }

  String get categoryName => _categoryName;

  set categoryName(String value) {
    _categoryName = value;
  }

  num get categoryId => _categoryId;

  set categoryId(num value) {
    _categoryId = value;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(
          context, 'Shop',
          arguments: <String, num>{
            'category': categoryId
          }
      ),
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
