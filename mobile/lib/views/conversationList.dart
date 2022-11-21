import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mobile/components/conversation.dart';
import 'package:provider/provider.dart';

import '../inc/nav.dart';
import '../inc/navigationDrawer.dart';
import '../models/appUser.dart';
import '../models/conversation.dart' as conversation_model;
import '../models/message.dart';
import '../models/user.dart';
import '../services/storage.dart';


class ConversationList extends StatefulWidget {
  const ConversationList({Key? key}) : super(key: key);

  @override
  _ConversationListState createState() => _ConversationListState();
}

class _ConversationListState extends State<ConversationList> {

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AppUser?>(context);
    final conversations = Provider.of<List<conversation_model.Conversation>>(context).where((element) => element.owner == auth!.uid || element.client == auth.uid).toList();
    final messages = Provider.of<List<Message>>(context);
    final users = Provider.of<List<OurUser>>(context);

    return Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: Nav(),
        ),
        drawer: NavigationDrawer(),
        body: SingleChildScrollView(
          child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(color: Color(0xfff5f5f5)),
              child: Row(
                children: [
                  Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: List.generate(
                            conversations.length,
                            (index) {
                              String userId;

                              conversations.sort((a, b) => b.id.compareTo(a.id));
                              messages.sort((a, b) => b.id.compareTo(a.id));

                              if (conversations.toList()[index].owner == auth!.uid) {
                                userId = conversations.toList()[index].client;
                              } else {
                                userId = conversations.toList()[index].owner;
                              }

                              return Conversation(
                                  conversations.toList()[index].id,
                                  userId,
                                  users.firstWhere((element) => element.uid == userId).name + " " + users.firstWhere((element) => element.uid == userId).surname,
                                  messages.firstWhere((element) => element.conversationId == conversations.toList()[index].id).messageDescription
                              );
                            }),
                      ))
                ],
              )),
        ));
  }
}
