import 'dart:async';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';
import 'screens/auth/phoneauth.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
            iconTheme: IconThemeData(color: CupertinoColors.white),
            centerTitle: true,
            backgroundColor: CupertinoColors.activeBlue,
            elevation: 5,
            shadowColor: CupertinoColors.black,
            titleTextStyle: TextStyle(
              color: CupertinoColors.white,
              fontWeight: FontWeight.w900,
              fontSize: 21,
            )),
      ),
      home: const PhoneAuth(),
    );
  }
}
