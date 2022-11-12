import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';

import '../inc/nav.dart';
import '../inc/navigationDrawer.dart';


class Conversation extends StatelessWidget {
  late int _conversationId;
  late String _avatarUrl;
  late String _userName;
  late String _message;

  Conversation(
      this._conversationId, this._avatarUrl, this._userName, this._message);

  int get conversationId => _conversationId;

  set conversationId(int value) {
    _conversationId = value;
  }

  String get avatarUrl => _avatarUrl;

  set avatarUrl(String value) {
    _avatarUrl = value;
  }

  String get userName => _userName;

  set userName(String value) {
    _userName = value;
  }

  String get message => _message;

  set message(String value) {
    _message = value;
  }

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () {
        // Swap to conversation view
      },
      child: Container(
        height: 100,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black87, width: 0.5)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
               CircleAvatar(
              radius: 40,
              backgroundImage: NetworkImage(avatarUrl),
              backgroundColor: Colors.blueAccent
                ),
              ],
            ), flex: 1),
            SizedBox(
              width: MediaQuery.of(context).size.width / 7,
            ),
            Flexible(child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(userName, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, overflow: TextOverflow.ellipsis), maxLines: 1,),
                Text(message, style: TextStyle(fontStyle: FontStyle.italic, fontSize: 13, overflow: TextOverflow.ellipsis), maxLines: 2,)
              ],
            ), flex: 5,)
          ],
        ),
      ),
    );
  }
}
