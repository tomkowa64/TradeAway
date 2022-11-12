import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';

import '../inc/nav.dart';
import '../inc/navigationDrawer.dart';


class Message extends StatelessWidget {
  late String _messageDescription;
  late int _messageOwner;
  late int _userId;


  Message(this._messageDescription, this._messageOwner, this._userId);


  String get messageDescription => _messageDescription;

  set messageDescription(String value) {
    _messageDescription = value;
  }

  int get messageOwner => _messageOwner;

  set messageOwner(int value) {
    _messageOwner = value;
  }

  int get userId => _userId;

  set userId(int value) {
    _userId = value;
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        mainAxisAlignment: messageOwner == userId ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(top: 20),
            padding: EdgeInsets.all(5),
            width: (MediaQuery.of(context).size.width / 2) - 20,
            decoration: BoxDecoration(
              color: messageOwner == userId ? Colors.blueAccent : Colors.white70,
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
            child: Text(messageDescription, style: TextStyle(
                color: messageOwner == userId ? Colors.white : Colors.black
            ),),
          )
        ],
      ),
    );
  }
}
