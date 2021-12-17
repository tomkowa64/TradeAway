import 'dart:ui';

import 'package:flutter/material.dart';

class ProfileMenuHorizontalCard extends StatelessWidget {
  late Icon _itemIcon;
  late String _itemName;

  ProfileMenuHorizontalCard(this._itemIcon, this._itemName);

  Icon get itemIcon => _itemIcon;

  set itemIcon(Icon value) {
    _itemIcon = value;
  }

  String get itemName => _itemName;

  set itemName(String value) {
    _itemName = value;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20),
      child: Column(
        children: [
          //Action List Item
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      this.itemIcon,
                      Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: Text(
                          '${this.itemName}',
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'Times New Roman',
                            color: const Color(0xff303744),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.arrow_forward_ios,
                      )
                    ],
                  )
                ],
              ),
            ],
          ),
          Divider(
            color: const Color(0xff303744),
            thickness: 2,
          )
        ],
      ),
    );
  }
}
