import 'dart:ui';

//Views for Navigator
import 'package:mobile/services/auth.dart';
import 'package:mobile/services/database.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  final DatabaseService database = DatabaseService();

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
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/auth-bg.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Form(
            key: _formKey,
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
                        Text("Register",
                            style: TextStyle(
                                color: Color(0xff303744), fontSize: 25))
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: Container(
                          padding: const EdgeInsets.only(left: 20, right: 20, top: 50),
                          child: Column(
                            children: [
                              TextFormField(
                                validator: (val) => !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(val!.trim()) ? 'Enter proper email' : null,
                                onChanged: (val) {
                                  setState(() {
                                    email = val.trim();
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
                          padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
                          child: Column(
                            children: [
                              TextFormField(
                                validator: (val) => val!.trim().length < 6 ? 'Password must have at least 6 characters' : null,
                                onChanged: (val) {
                                  setState(() {
                                    password = val.trim();
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
                          padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
                          child: Column(
                            children: [
                              TextFormField(
                                validator: (val) => val!.trim() != password ? 'Passwords must match' : null,
                                onChanged: (val) {
                                  setState(() {
                                    repeatPassword = val.trim();
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
                                onPressed: () async {
                                  if(_formKey.currentState!.validate()) {
                                    dynamic result = await _auth.registerInWithEmail(email, password);
                                    if(result == null) {
                                      print('error signing in');
                                    } else {
                                      database.updateUserData(result.uid, '', '', 0, 0, '', '', '', '');
                                      print('register success');
                                      // print(result);
                                      Navigator.pushReplacementNamed(context, 'Login');
                                    }
                                  }
                                },
                                child: const Text(
                                  'Register',
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
            )
          ),
      )
    );
  }
}
