import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'auth.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
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
      home: Auth(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
const String _svg_e7b2h1 =
    '<svg viewBox="157.8 563.0 59.4 59.4" ><path transform="translate(155.25, 561.07)" d="M 28.5389289855957 42.73524475097656 L 35.95842361450195 42.73524475097656 L 35.95842361450195 50.15473937988281 L 28.5389289855957 50.15473937988281 L 28.5389289855957 42.73524475097656 Z M 43.37791442871094 16.76702117919922 C 45.42673873901367 16.76702117919922 47.08766174316406 18.42794227600098 47.08766174316406 20.47676849365234 L 47.08766174316406 31.60600852966309 L 35.95842361450195 39.0255012512207 L 28.5389289855957 39.0255012512207 L 28.5389289855957 35.31575393676758 L 39.66816711425781 27.89626312255859 L 39.66816711425781 24.18651580810547 L 21.11943435668945 24.18651580810547 L 21.11943435668945 16.76701927185059 L 43.37791442871094 16.76701927185059 Z M 32.24867248535156 7.492654323577881 C 25.8077392578125 7.492654323577881 19.75238990783691 10.0009069442749 15.19798183441162 14.55531692504883 C 10.6435718536377 19.10972595214844 8.135321617126465 25.16507339477539 8.135321617126465 31.60600471496582 C 8.135321617126465 38.04693222045898 10.64357376098633 44.1022834777832 15.19798374176025 48.65669631958008 C 19.75239181518555 53.21110534667969 25.80774116516113 55.71935653686523 32.24867248535156 55.71935653686523 C 38.68960571289063 55.71935653686523 44.74495697021484 53.21110534667969 49.29936218261719 48.65669631958008 C 53.8537712097168 44.1022834777832 56.36203002929688 38.04693603515625 56.36203002929688 31.60600471496582 C 56.36203002929688 25.16507148742676 53.85377502441406 19.1097240447998 49.29942321777344 14.5553150177002 C 44.74507141113281 10.00090503692627 38.68960571289063 7.492652416229248 32.24867248535156 7.492652416229248 Z M 32.24867248535156 1.92803418636322 C 48.63937377929688 1.92803418636322 61.9266471862793 15.21530342102051 61.9266471862793 31.60600852966309 C 61.9266471862793 47.99671173095703 48.63937377929688 61.28397750854492 32.24867248535156 61.28397750854492 C 15.85797214508057 61.28397750854492 2.570700407028198 47.99670791625977 2.570700407028198 31.60600852966309 C 2.570700407028198 15.21530723571777 15.8579683303833 1.928035140037537 32.24867248535156 1.928035140037537 Z" fill="#303744" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
