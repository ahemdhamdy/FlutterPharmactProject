import 'package:flutter/material.dart';
import 'screens/loading_screen.dart';
import 'screens/signup_screen.dart';
import 'screens/signup_form_screen.dart';
import 'screens/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
//      theme: ThemeData(
//        primarySwatch: Colors.red,
//      ),
      home: HomeScreen(),
    );
  }
}
