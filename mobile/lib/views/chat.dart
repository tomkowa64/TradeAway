import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mobile/components/conversation.dart';
import 'package:mobile/components/message.dart';

import '../inc/nav.dart';
import '../inc/navigationDrawer.dart';


class Chat extends StatefulWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  late int _conversationId;

  // Need array of message objects with thier description and sender

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        drawer: NavigationDrawer(),
        bottomNavigationBar: Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
            decoration: const BoxDecoration(color: Color(0xfff5f5f5)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Container(
                      height: 50,
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10)
                      ),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Type a message',
                        hintStyle: TextStyle(
                          fontSize: 14
                        )
                      ),
                    )),
                  flex: 5),
                Flexible(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 2),
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    height: 50,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50),
                            topRight: Radius.circular(50),
                            bottomLeft: Radius.circular(50),
                            bottomRight: Radius.circular(50)
                        ),
                      ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(FontAwesomeIcons.paperPlane, color: Color(0xfff5f5f5),)
                      ],
                    )),
                  flex: 1)
              ],
            )
        ),
        body:
          Container(
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(color: Color(0xfff5f5f5)),
              child: Row(
                children: [
                  Expanded(
                  child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Message("Elo mordo co tam xDDDDDDDDDDDDD ddddddddddddddddddddddddddddddddddddd"
                              "ddddddddddddddddddddddddddddddddddddddd", 1, 2),
                          Message("Elo u mnie spoko, a u Cb", 2, 2),
                          Message("Elo mordo co tam xDDDDDDDDDDDDD", 1, 2),
                          Message("Elo u mnie spoko, a u Cb", 2, 2),
                          Message("Elo mordo co tam xDDDDDDDDDDDDD", 1, 2),
                          Message("Elo u mnie spoko, a u Cb", 2, 2),
                          Message("Elo mordo co tam xDDDDDDDDDDDDD", 1, 2),
                          Message("Elo u mnie spoko, a u Cb", 2, 2),
                          Message("Elo u mnie spoko, a u Cb", 2, 2),
                          Message("Elo u mnie spoko, a u Cb", 2, 2),
                          Message("Elo u mnie spoko, a u Cb", 2, 2),
                          Message("Elo mordo co tam xDDDDDDDDDDDDD", 1, 2),
                          Message("Elo mordo co tam xDDDDDDDDDDDDD", 1, 2),
                          Message("Elo mordo co tam xDDDDDDDDDDDDD", 1, 2),
                          Message("Elo mordo co tam xDDDDDDDDDDDDD", 1, 2),
                          Message("Elo u mnie spoko, a u Cb", 2, 2),
                          Message("Elo u mnie spoko, a u Cb", 2, 2),
                          Message("Elo u mnie spoko, a u Cb", 2, 2),
                          Message("Elo mordo co tam xDDDDDDDDDDDDD", 1, 2),
                          Message("Elo mordo co tam xDDDDDDDDDDDDD", 1, 2),
                        ],
                      )
                  )
                ),
                ],
              )),
);
  }
}
