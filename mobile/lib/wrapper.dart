import 'package:flutter/material.dart';
import 'package:mobile/models/user.dart';
import 'package:provider/provider.dart';
import 'views/splash.dart';
import 'views/home.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AppUser?>(context);
    print(user);

    if(user == null) {
      return const Splash();
    }
    else {
      return const Home();
    }
  }
}
