import 'dart:ui';

//Views for Navigator
import './home.dart';

import 'package:mobile/services/auth.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: const EdgeInsets.only(top: 50),
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
              Expanded(
                  child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
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
                      new Text("Login",
                          style: TextStyle(
                              color: const Color(0xff303744), fontSize: 25))
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: Container(
                        padding: EdgeInsets.only(left: 20, right: 20, top: 50),
                        child: Column(
                          children: [
                            TextFormField(
                              decoration: const InputDecoration(
                                border: UnderlineInputBorder(),
                                labelText: 'Enter your username',
                                prefixIcon: FaIcon(
                                  FontAwesomeIcons.solidUserCircle,
                                  size: 35,
                                ),
                                contentPadding: EdgeInsets.only(bottom: 10.0),
                              ),
                            )
                          ],
                        ),
                      ))
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: Container(
                        padding: EdgeInsets.only(left: 20, right: 20, top: 30),
                        child: Column(
                          children: [
                            TextFormField(
                              obscureText: true,
                              decoration: const InputDecoration(
                                border: UnderlineInputBorder(),
                                labelText: 'Enter your Password',
                                prefixIcon: FaIcon(
                                  FontAwesomeIcons.lock,
                                  size: 35,
                                ),
                                contentPadding: EdgeInsets.only(bottom: 10.0),
                              ),
                            )
                          ],
                        ),
                      ))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
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
                              onPressed: () async {
                                dynamic result = await _auth.signInAnon();
                                if(result == null) {
                                  print('error signing in');
                                } else {
                                  print('sign in');
                                  print(result.uid);
                                }
                                //Navigator.pushReplacementNamed(context, 'Home');
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
                  )
                ],
              ))
            ],
          )),
    );
  }
}
