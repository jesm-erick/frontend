import 'package:flutter/material.dart';
import 'package:imagenes/models/figura.dart';
import 'package:imagenes/pages/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Imagenes App',
      home: HomePage(),
    );
  }
}
