import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mobile/components/message.dart';
import 'package:provider/provider.dart';

import '../inc/nav.dart';
import '../inc/navigationDrawer.dart';
import '../models/appUser.dart';
import '../models/message.dart' as message_model;
import '../services/database.dart';

class Chat extends StatefulWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  final _formKey = GlobalKey<FormState>();
  late int _conversationId;
  late String message;
  var messageField = TextEditingController();

  int get conversationId => _conversationId;

  set conversationId(int value) {
    _conversationId = value;
  }

  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, String>{}) as Map;
    conversationId = arguments['conversationId'];
    final allMessages = Provider.of<List<message_model.Message>>(context);
    final messages = Provider.of<List<message_model.Message>>(context)
        .where((element) => element.conversationId == conversationId).toList();
    final auth = Provider.of<AppUser?>(context);
    final DatabaseService database = DatabaseService(uid: auth!.uid);
    allMessages.sort((a, b) => a.id.compareTo(b.id));
    messages.sort((a, b) => a.id.compareTo(b.id));

    return Scaffold(
      drawer: NavigationDrawer(),
      bottomNavigationBar: Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
          decoration: const BoxDecoration(color: Color(0xfff5f5f5)),
          child: Form(
            key: _formKey,
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
                              bottomRight: Radius.circular(10)),
                        ),
                        child: TextFormField(
                          controller: messageField,
                          validator: (val) =>
                              val!.length < 1 ? 'Enter message' : null,
                          onChanged: (val) {
                              message = val;
                          },
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Type a message',
                              hintStyle: TextStyle(fontSize: 14)),
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
                              bottomRight: Radius.circular(50)),
                        ),
                        child: TextButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              int messageId;

                              if (allMessages.isEmpty) {
                                messageId = 0;
                              } else {
                                messageId = allMessages.first.id + 1;
                              }

                              database.updateMessageData(
                                  messageId,
                                  conversationId,
                                  message,
                                  auth.uid
                              );

                              message = '';
                              messageField.text = '';
                            }
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                FontAwesomeIcons.paperPlane,
                                color: Color(0xfff5f5f5),
                              )
                            ],
                          ),
                        )),
                    flex: 1)
              ],
            ),
          )),
      body: Container(
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(color: Color(0xfff5f5f5)),
          child: Row(
            children: [
              Expanded(
                  child: SingleChildScrollView(
                      child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: List.generate(messages.length, (index) {
                  return Message(messages.toList()[index].messageDescription,
                      messages.toList()[index].messageOwner, auth.uid);
                }),
              ))),
            ],
          )),
    );
  }
}
