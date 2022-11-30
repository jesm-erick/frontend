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
  final url = Uri.parse("http://192.168.1.7:3000/figura");
//dsadsadsads
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Imagenes App',
      home: Scaffold(
          appBar: AppBar(
            title: Text('Imagenes App'),
          ),
          body: FutureBuilder(
            future: _listado,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView(
                  children: _listadoImagen(snapshot.data),
                );
              } else if (snapshot.hasError) {
                print(snapshot.error);
                return Text("error");
              }

              return Center(
                child: CircularProgressIndicator(),
              );
            },
          )),
    );
  }

  List<Widget> _listadoImagen(List<Welcome> data) {
    List<Widget> welcome = [];

    for (var element in data) {
      //print(element.image);

      welcome.add(Card(
          child: Column(
        children: [
          //Image.network(element.url),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              element.name,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
            ),
          ),
          const SizedBox(
            width: 100,
            height: 20,
          ),
          Image(
            image: NetworkImage((element.image)),
          ),
        ],
      )));
    }
    return welcome;
  }

//XDDDD
  Future<List<Welcome>> _listado;
  Future<List<Welcome>> getImagenes() async {
    final response = await http.get(url);

    List<Welcome> welcome = [];

    if (response.statusCode == 200) {
      String body = utf8.decode(response.bodyBytes);

      final jsonData = jsonDecode(body);
      //print(jsonData is Object);
      for (var item in jsonData) {
        //print(item);
        //welcome.add(Welcome(item["image"]["secure_url"], item["id"], item["name"]));

        welcome.add(
            Welcome(item["image"]["secure_url"], item["_id"], item["name"]));
      }
      //print(welcome);
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
