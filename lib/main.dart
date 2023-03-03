import 'package:flutter/material.dart';

import 'view/pages/homescreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nibav',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
        textTheme: Typography.whiteCupertino,
        primarySwatch: Colors.green,
        appBarTheme: const AppBarTheme(backgroundColor: Colors.black),
      ),
      home: const HomeScreen(),
    );
  }
}
