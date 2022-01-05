import 'dart:ui';
import 'package:mobile/services/auth.dart';
import 'package:mobile/views/register.dart';
import 'package:provider/provider.dart';
import 'package:mobile/models/user.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'home.dart';
import 'login.dart';

final AuthService _auth = AuthService();
class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AppUser?>(context);

    return Scaffold(
      body: Container(
          padding: const EdgeInsets.only(top: 150),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/auth-bg.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: const [
                          Text(
                            "Trade",
                            style: TextStyle(
                                fontSize: 40,
                                color: Color(0xff303744),
                                fontStyle: FontStyle.italic,
                                fontFamily: "Lucida Calligraphy Italic"),
                          )
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: const [
                          Text(
                            "Away",
                            style: TextStyle(
                                fontSize: 40,
                                color: Color(0xffcf4e6c),
                                fontStyle: FontStyle.italic,
                                fontFamily: "Lucida Calligraphy Italic"),
                          )
                        ],
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text("The easiest way to sell unused things away",
                          style: TextStyle(
                              fontStyle: FontStyle.italic,
                              color: Color(0xff9e9e9e)))
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(top: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          const Color(0xffcf4e6c)),
                                  minimumSize: MaterialStateProperty.all<Size>(
                                      const Size(200, 50))),
                              onPressed: () {
                                if(user == null) {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => const Login()));
                                }
                                else {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => const Home()));
                                }
                              },
                              child: const Text(
                                'Log In',
                                style: TextStyle(
                                    color: Color(0xffffffff),
                                    fontSize: 20),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(top: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          const Color(0xff9e9e9e)),
                                  minimumSize: MaterialStateProperty.all<Size>(
                                      const Size(200, 50))),
                              onPressed: () {
                                if(user == null) {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => const Register()));
                                }
                                else {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: Text("Logout?"),
                                        content: Text("To register a new account you have to logout."),
                                        actions: [
                                          TextButton(
                                              onPressed: () => Navigator.pop(context, 'Cancel'),
                                              child: const Text('Back')
                                          ),
                                          TextButton(
                                              onPressed: () async {
                                                await _auth.signOut();
                                                Navigator.push(context, MaterialPageRoute(builder: (context) => const Register()));
                                              },
                                              child: const Text('Logout')
                                          )
                                        ],
                                      );
                                    }
                                  );
                                }
                              },
                              child: const Text(
                                'Create Account',
                                style: TextStyle(
                                    color: Color(0xffffffff),
                                    fontSize: 20),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: 60),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            new IconButton(
                                onPressed: () {},
                                icon: const FaIcon(
                                    FontAwesomeIcons.questionCircle,
                                    size: 50))
                          ],
                        ),
                      )
                    ],
                  )
                ],
              )
            ],
          )),
    );
  }
}
