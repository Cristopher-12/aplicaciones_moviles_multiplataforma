import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  static const String _tittle = 'App 1';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false, title: _tittle, home: MyCount());
  }
}

class MyCount extends StatefulWidget {
  MyCount({Key key}) : super(key: key);

  @override
  _MyCountState createState() => _MyCountState();
}

class _MyCountState extends State<MyCount> {
  int _count = 10;
  int plus = 2;
  int minus = 3;
  var resultado = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('App incremento',
            style: TextStyle(fontSize: 35.0, fontFamily: 'Montserrat',)
            ),
            backgroundColor: Colors.amber[600],
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 50.0,
            ),
            Text(
              'Valor inicial es: $_count',
              style: TextStyle(
                fontSize: 30,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: _botones(),
    );
  }

  Widget _botones() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget> [
        SizedBox(
          width: 30.0,
        ),
        FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            setState(() {
              increment();
            });
          },
          tooltip: 'Se incremento 2 unidades',
          backgroundColor: Colors.amber[400],
        ),
        Expanded(child: SizedBox()
        ),
        FloatingActionButton(
          child: Icon(Icons.horizontal_rule),
          onPressed: () {
            setState(() {
              decrement();
            });
          },
          tooltip: 'Se decremento 3 unidades',
          backgroundColor: Colors.amber[400],
        ),
        Expanded(child: SizedBox()),
      ],
    );
  }

  increment() {
    int two = 2;
    int result = _count + two;
    _count = result;
  }

  decrement() {
    int three = 3;
    int result = _count - three;
    _count = result;
  }
}
