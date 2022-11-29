import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:imagenes/models/figura.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final url = Uri.parse("http://192.168.1.7:3000/figura");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Imagenes App'),
      ),
      body: Center(
        child: Container(
          child: Text('hola mundo XD'),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    getImagenes();
  }

  Future<List<Figura>> getImagenes() async {
    final res = await http.get(url);
    final lista = List.from(jsonDecode(res.body));
    List<Figura> figuras = [];

    lista.forEach((element) {
      final Figura fig = Figura.fromJson(element);
      figuras.add(fig);
    });

    return figuras;
  }
}
