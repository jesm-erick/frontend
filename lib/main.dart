// @dart=2.9
import 'dart:convert';
import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:imagenes/models/figura.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final url = Uri.parse("http://192.168.229.33:3000/figura");

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Imagenes App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Imagenes App'),
        ),
        body: Center(
          child: Container(
            child: Text('hola mundo XD'),
          ),
        ),
      ),
    );
  }

  Future<List<Welcome>> _listado;
  Future<List<Welcome>> getImagenes() async {
    final response = await http.get(url);

    List<Welcome> welcome = [];

    if (response.statusCode == 200) {
      String body = utf8.decode(response.bodyBytes);

      final jsonData = jsonDecode(body);
      //print(jsonData is Object);
      for (var item in jsonData) {
        print(item);
        //welcome.add(Welcome(item["image"]["secure_url"], item["id"], item["name"]));

        welcome.add(Welcome(item["image"], item["_id"], item["name"]));
      }

      return welcome;
    } else {
      throw Exception("fallo la conexion");
    }
  }

  @override
  void initState() {
    super.initState();
    _listado = getImagenes();
  }
}
