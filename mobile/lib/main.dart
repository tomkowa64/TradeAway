import 'package:flutter/material.dart';
import 'package:mobile/services/auth.dart';
import 'package:mobile/views/home.dart';
import 'package:mobile/views/login.dart';
import 'package:mobile/views/register.dart';
import 'package:mobile/views/shop.dart';
import 'package:mobile/wrapper.dart';
import 'views/splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:provider/provider.dart';
import 'models/user.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<AppUser?>.value(
      value: AuthService().user,
      initialData: null,
      child: MaterialApp(
          title: 'Trade Away',
          theme: ThemeData(
            // This is the theme of your application.
            //
            // Try running your application with "flutter run". You'll see the
            // application has a blue toolbar. Then, without quitting the app, try
            // changing the primarySwatch below to Colors.green and then invoke
            // "hot reload" (press "r" in the console where you ran "flutter run",
            // or simply save your changes to "hot reload" in a Flutter IDE).
            // Notice that the counter didn't reset back to zero; the application
            // is not restarted.
            primarySwatch: Colors.blue,
          ),
          home: const Wrapper(),
          routes: {
            // Here you define the names and the Widgets (Preferably ones with a Scaffold) that are your pages
            'Home': (context) => const Home(),
            'Splash': (context) => const Splash(),
            'Login': (context) => const Login(),
            'Register': (context) => const Register(),
            'Shop': (context) => const Shop(),
          }
        ),
    );
  }
}
