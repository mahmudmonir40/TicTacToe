import 'package:flutter/material.dart';
import 'package:tik_tak_toe_game/home_page.dart';
import 'package:tik_tak_toe_game/splashscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tik Tak Toe',
      theme: ThemeData(

        primarySwatch: Colors.teal,
      ),
      home: splash_screen(),
    );
  }
}




