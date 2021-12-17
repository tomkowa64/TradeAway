import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          Padding(
            padding:
                const EdgeInsets.only(top: 30, right: 16, bottom: 16, left: 16),
            child: Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    new Text(
                      "Trade",
                      style: TextStyle(
                          fontSize: 40,
                          color: const Color(0xff303744),
                          fontStyle: FontStyle.italic,
                          fontFamily: "Lucida Calligraphy Italic"),
                    )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    new Text(
                      "Away",
                      style: TextStyle(
                          fontSize: 40,
                          color: const Color(0xffcf4e6c),
                          fontStyle: FontStyle.italic,
                          fontFamily: "Lucida Calligraphy Italic"),
                    )
                  ],
                )
              ],
            ),
          ),
          Divider(
            height: 1,
            thickness: 1,
          ),
          ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () => Navigator.pushNamed(context, 'Home')),
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('Profile'),
            onTap: () => Navigator.pushNamed(context, 'Profile'),
          ),
          ListTile(
            leading: Icon(Icons.star),
            title: Text('Fauvorites'),
            onTap: () => () {},
          ),
          ListTile(
            leading: Icon(Icons.transform),
            title: Text('Transactions'),
            onTap: () => () {},
          ),
          ListTile(
              leading: Icon(Icons.shop),
              title: Text('Shop'),
              onTap: () => Navigator.pushNamed(context, 'Shop')),
          ListTile(
            leading: Icon(Icons.shopping_cart),
            title: Text('Cart'),
            onTap: () => Navigator.pushNamed(context, 'Cart'),
          ),
          Divider(
            height: 1,
            thickness: 1,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Account',
            ),
          ),
          ListTile(
              leading: Icon(Icons.logout),
              title: Text('Log out'),
              onTap: () => Navigator.pushNamed(context, 'Splash'))
        ],
      ),
    );
  }
}
