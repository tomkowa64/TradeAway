import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mobile/views/chat.dart';
import 'package:provider/provider.dart';

import '../inc/nav.dart';
import '../inc/navigationDrawer.dart';
import '../models/user.dart';
import '../services/storage.dart';


class Conversation extends StatelessWidget {
  late int _conversationId;
  late String _userId;
  late String _userName;
  late String _message;

  Conversation(
      this._conversationId, this._userId, this._userName, this._message);

  int get conversationId => _conversationId;

  set conversationId(int value) {
    _conversationId = value;
  }

  String get userId => _userId;

  set userId(String value) {
    _userId = value;
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
    final Storage storage = Storage();
    final users = Provider.of<List<OurUser>>(context);

    return GestureDetector(
      onTap: () => Navigator.pushNamed(
        context, "Chat",
        arguments: <String, int> {
          "conversationId": conversationId
        }
      ),
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
                FutureBuilder(
                    future: storage.getAvatarURL(userId),
                    builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                      if(snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
                        return CircleAvatar(
                            radius: 40,
                            backgroundImage: NetworkImage(snapshot.data!),
                            backgroundColor: const Color(0x00000000)
                        );
                      }
                      if(snapshot.connectionState == ConnectionState.waiting) {
                        return const SizedBox(
                          child: CircularProgressIndicator(),
                          height: 40,
                          width: 40,
                        );
                      }
                      if(!snapshot.hasData) {
                        return CircleAvatar(
                          radius: 40,
                          backgroundColor: const Color(0xffcf4e6c),
                          child: Text(
                              users.firstWhere((element) => element.uid == userId).name.substring(0, 1) + users.firstWhere((element) => element.uid == userId).surname.substring(0, 1),
                              style: const TextStyle(
                                  fontSize: 40,
                                  color: Colors.white,
                                  fontFamily: 'Times New Roman')),
                        );
                      }
                      return Container();
                    }
                )
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
