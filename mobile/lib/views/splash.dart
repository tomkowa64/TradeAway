import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      new Text("The easiest way to sell unused things away",
                          style: TextStyle(
                              fontStyle: FontStyle.italic,
                              color: const Color(0xff9e9e9e)))
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: 30),
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
                                Navigator.pushNamed(context, 'Login');
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
                        padding: EdgeInsets.only(top: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            new TextButton(
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          const Color(0xff9e9e9e)),
                                  minimumSize: MaterialStateProperty.all<Size>(
                                      const Size(200, 50))),
                              onPressed: () {
                                Navigator.pushNamed(context, 'Register');
                              },
                              child: Text(
                                'Create Account',
                                style: TextStyle(
                                    color: const Color(0xffffffff),
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
