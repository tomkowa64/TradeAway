import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Nav extends StatelessWidget{
  const Nav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return AppBar(
      leading: Icon(Icons.menu, color: const Color(0xff303744), size: 30),
      title: Text('Page title'),
      actions: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 16,horizontal: 20),
          child: FaIcon(FontAwesomeIcons.bell, color: const Color(0xff303744)),
        ),
      ],
      backgroundColor: Colors.white,
    );
  }
}