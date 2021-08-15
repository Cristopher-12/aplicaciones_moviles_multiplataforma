import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class WritePage extends StatefulWidget {
  @override
  _WritePageState createState() => _WritePageState();
}

class _WritePageState extends State<WritePage> {
  final _nombreController = TextEditingController();
  final _emailController = TextEditingController();

  String nombre;
  String email;

  @override
  void dispose() {
    _nombreController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Write Page')),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: [
          SizedBox(height: 20),
          Text('Nombre', textAlign: TextAlign.center, style: TextStyle(fontSize: 20.0)),
          SizedBox(height: 10,),
            TextField(controller: _nombreController),
          SizedBox(height: 40),
          Text('Email', textAlign: TextAlign.center, style: TextStyle(fontSize: 20.0)),
          SizedBox(height: 10,),
          TextField(keyboardType: TextInputType.emailAddress, controller: _emailController),
          SizedBox(height: 30),
          ElevatedButton(
              onPressed: () {
                _insert();
                alert();
              },
              child: Text('Añadir'))
        ],
      ),
    );
  }

  void alert() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Listo'),
          content: Text('Datos insertados correctamente.'),
        );
      },
    );
  }

  void _insert() {
    setState(() {
      nombre = _nombreController.text;
      email = _emailController.text;
      _upfirebase(nombre, email);
    });
  }

  void _upfirebase(String nombre, String email) async {
    try {
      var url = Uri.parse(
          'https://data-4d332-default-rtdb.firebaseio.com/agenda.json');

      var data = {'nombre': nombre, 'email': email};
      final response = await http.post(url, body: json.encode(data));
      if (response.statusCode == 200) {
        print('Guardado con Exito');
      }
    } catch (e) {}
  }
}