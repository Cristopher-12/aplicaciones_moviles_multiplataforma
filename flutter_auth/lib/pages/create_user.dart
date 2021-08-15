import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Createuser extends StatefulWidget {
  Createuser({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _CreateuserState createState() => _CreateuserState();
}

class _CreateuserState extends State<Createuser> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nombreController = TextEditingController();

  String email;
  String password;
  String nombre;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _nombreController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Crear Usuario"),
          backgroundColor: Colors.amber,
        ),
        body: _formulariologin());
  }

  Widget _formulariologin() {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 10),
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Text("Nombre"),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            controller: _nombreController,
            decoration: InputDecoration(
                border: OutlineInputBorder(), hintText: "Ingresa un nombre"),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Text("Email"),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            controller: _emailController,
            decoration: InputDecoration(
                border: OutlineInputBorder(), hintText: "email"),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Text("Contraseña"),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: TextField(
            keyboardType: TextInputType.visiblePassword,
            obscureText: true,
            controller: _passwordController,
            decoration: InputDecoration(
                border: OutlineInputBorder(), hintText: "contraseña"),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: ElevatedButton(
            child: Container(
              child: Text("Crear"),
            ),
            onPressed: _getValues,
          ),
        ),
      ],
    );
  }

  void alert() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Listo'),
          content: Text('El usuario se ha creado correctamente'),
        );
      },
    );
  }

  void _getValues() {
    setState(() {
      email = _emailController.text;
      password = _passwordController.text;
      nombre = _nombreController.text;
      authUser(email, password);
      addhUser(email, password, nombre);
      alert();
    });
  }

  void authUser(String email, String password) async {
    try {
      var url = Uri.parse(
          'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyC0DCSt1wHTqbta3S8vPr7xhDIRb31NiH0');
      Map<String, dynamic> map = new Map<String, dynamic>();
      map['email'] = email;
      map['password'] = password;
      var response = await http.post(url, body: map);
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
    } catch (error) {
      print(error.toString());
    }
  }

  void addhUser(String email, String password, String nombre) async {
    try {
      var url = Uri.parse(
          'https://data-4d332-default-rtdb.firebaseio.com/' + 'agenda.json');
      Map<String, dynamic> map = new Map<String, dynamic>();
      map['email'] = email;
      map['nombre'] = nombre;
      var response = await http.post(url, body: jsonEncode(map));
      print('Response status: ${response.statusCode}');
    } catch (error) {
      print(error.toString());
    }
  }
}
