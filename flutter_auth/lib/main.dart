import 'package:flutter_auth/pages/read_page.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_auth/pages/create_user.dart';
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
        primaryColor: Colors.cyan,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  String email;
  String password;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Iniciar Sesion"),
          backgroundColor: Colors.lime,
        ),
        body: _formulariologin());
  }

  Widget _formulariologin() {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 10),
      children: [
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
              child: Text("Iniciar sesion"),
            ),
            onPressed: _getValues,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: FloatingActionButton.extended(
              label: Text("Crear Usuario"),
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute<Null>(builder: (BuildContext context) {
                  return new Createuser();
                }));
              }),
        ),
      ],
    );
  }

  void _getValues() {
    setState(() {
      email = _emailController.text;
      password = _passwordController.text;
      authUser(email, password);
    });
  }

  void authUser(String email, String password) async {
    try {
      var url = Uri.parse(
          'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyC0DCSt1wHTqbta3S8vPr7xhDIRb31NiH0');
      Map<String, dynamic> map = new Map<String, dynamic>();
      map['email'] = email;
      map['password'] = password;
      var response = await http.post(url, body: map);
      print('Response status: ${response.statusCode}');

      if (response.statusCode == 200) {
        Navigator.of(context)
          .push(MaterialPageRoute<Null>(builder: (BuildContext context) {
        return new ReadPage();
        }));
      }
    } catch (error) {
      print(error.toString());
    }
  }

  void readdata(String email, String password) async {
    try {
      var url = Uri.parse(
          'https://data-4d332-default-rtdb.firebaseio.com/agenda.json');
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
        print(jsonResponse);
      }
    } catch (error) {
      print(error.toString());
    }
  }
}
