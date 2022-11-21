import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:mobile/models/category.dart';
import 'package:mobile/models/conversation.dart';
import 'package:mobile/models/message.dart';
import 'package:mobile/models/product.dart';
import 'package:mobile/models/transaction.dart';
import 'package:mobile/services/auth.dart';
import 'package:mobile/services/database.dart';
import 'package:mobile/views/accountSettingsForm.dart';
import 'package:mobile/views/chat.dart';
import 'package:mobile/views/conversationList.dart';
import 'package:mobile/views/offerForm.dart';
import 'package:mobile/views/cart.dart';
import 'package:mobile/views/favourites.dart';
import 'package:mobile/views/history.dart';
import 'package:mobile/views/home.dart';
import 'package:mobile/views/login.dart';
import 'package:mobile/views/personalDataForm.dart';
import 'package:mobile/views/product.dart';
import 'package:mobile/views/profile.dart';
import 'package:mobile/views/register.dart';
import 'package:mobile/views/shop.dart';
import 'package:mobile/wrapper.dart';
import 'package:mobile/views/transactions.dart';
import 'models/user.dart';
import 'views/splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:provider/provider.dart';
import 'models/appUser.dart';

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
        child: StreamProvider<List<Product>>.value(
            value: DatabaseService().products,
            initialData: const [],
            child: StreamProvider<List<OurUser>>.value(
              value: DatabaseService().users,
              initialData: const [],
              child: StreamProvider<List<OurTransaction>>.value(
                value: DatabaseService().transaction,
                initialData: const [],
                child: StreamProvider<Map<String, dynamic>>.value(
                  value: DatabaseService().cart,
                  initialData: const {},
                  child: StreamProvider<List<Map<String, dynamic>>>.value(
                      value: DatabaseService().favorites,
                      initialData: const [],
                      child: StreamProvider<List<OurCategory>>.value(
                          value: DatabaseService().categories,
                          initialData: const [],
                          child: StreamProvider<List<Conversation>>.value(
                            value: DatabaseService().conversations,
                            initialData: const [],
                            child: StreamProvider<List<Message>>.value(
                              value: DatabaseService().messages,
                              initialData: const [],
                              child: MaterialApp(
                                  title: 'Trade Away',
                                  localizationsDelegates: [
                                    GlobalMaterialLocalizations.delegate,
                                    GlobalWidgetsLocalizations.delegate,
                                    GlobalCupertinoLocalizations.delegate,
                                  ],
                                  supportedLocales: [
                                    Locale('en', ''), // English, no country code
                                    Locale('pl', ''), // Polish, no country code
                                  ],
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
                                    // 'Product': (BuildContext context) => ProductSilder(),
                                    'Cart': (context) => const Cart(),
                                    'Profile': (context) => const Profile(),
                                    'History': (context) => const History(),
                                    'Transactions': (context) =>
                                        const Transactions(),
                                    'Favourites': (context) => const Favourites(),
                                    'PersonalData': (context) =>
                                        const PersonalDataForm(),
                                    'AccountSettings': (context) =>
                                        AccountSettingsForm(),
                                    'AddOffer': (context) => OfferForm(),
                                    'ConversationList': (context) =>
                                        ConversationList(),
                                    'Chat': (context) => Chat()
                                  }),
                            ),
                          ))),
                ),
              ),
            )));
  }
}
