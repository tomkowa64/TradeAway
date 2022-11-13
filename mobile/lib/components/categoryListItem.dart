import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CategoryListItem extends StatelessWidget {
  late num _categoryId;
  late String _categoryName;
  late final Function(num) _removeCategoryFromList;


  CategoryListItem(
      this._categoryId, this._categoryName, this._removeCategoryFromList);


  num get categoryId => _categoryId;

  set categoryId(num value) {
    _categoryId = value;
  }

  String get categoryName => _categoryName;

  set categoryName(String value) {
    _categoryName = value;
  }

  Function get removeCategoryFromList => _removeCategoryFromList;

  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white70,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10)
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
            Flexible(child: Text(categoryName, style: TextStyle(color: Colors.black, fontSize: 11),), flex: 3,),
            Flexible(
              child: Container(
              child: IconButton(
                  onPressed: () {
                    removeCategoryFromList(categoryId);
                  },
                  icon: Icon(Icons.remove_circle, color: Colors.redAccent, size: 16,)
              ),
          ),flex: 1,
            ),
        ],
      ),
    );
  }
}
