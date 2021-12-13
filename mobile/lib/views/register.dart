import 'dart:ui';

//Views for Navigator
import 'package:mobile/services/auth.dart';

import './login.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();

  String email = '';
  String password = '';
  String repeatPassword = '';

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
                      new Text("Register",
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
                              onChanged: (val) {
                                setState(() {
                                  email = val;
                                });
                              },
                              decoration: const InputDecoration(
                                border: UnderlineInputBorder(),
                                labelText: 'Enter your email',
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
                              onChanged: (val) {
                                setState(() {
                                  password = val;
                                });
                              },
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
                    children: [
                      Expanded(
                          child: Container(
                        padding: EdgeInsets.only(left: 20, right: 20, top: 30),
                        child: Column(
                          children: [
                            TextFormField(
                              onChanged: (val) {
                                setState(() {
                                  repeatPassword = val;
                                });
                              },
                              obscureText: true,
                              decoration: const InputDecoration(
                                border: UnderlineInputBorder(),
                                labelText: 'Repeat your Password',
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
                                print(email);
                                print(password);
                                print(repeatPassword);
                                if(password == repeatPassword) {
                                  dynamic result = await _auth.registerInWithEmail(email, password);
                                  if(result == null) {
                                    print('error signing in');
                                  } else {
                                    print('sign in');
                                    print(result);
                                    Navigator.pushReplacementNamed(context, 'Login');
                                  }
                                } else {
                                  print('Passwords must match.');
                                }
                              },
                              child: const Text(
                                'Register',
                                style: TextStyle(
                                    color: const Color(0xffffffff),
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
