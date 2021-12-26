import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'screens/login.dart';
import 'screens/createaccount.dart';
import 'screens/host.dart';
import 'screens/browse.dart';
import 'screens/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MaterialApp(initialRoute: '/login', routes: {
    '/login': (context) => LoginForm(),
    '/createAccount': (context) => CreateAccountForm(),
    '/browse': (context) => Browse(),
    '/host': (context) => Host(),
    '/home': (context) => Home()
  }));
}
