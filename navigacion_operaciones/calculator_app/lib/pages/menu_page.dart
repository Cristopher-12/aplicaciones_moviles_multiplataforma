import 'package:flutter/material.dart';
import 'package:calculator_app/pages/operaciones_page.dart';

class MyApp extends StatelessWidget {
  static const String _tittle = 'Calculadora App';

  @override
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false, title: _tittle, home: MyCalc());
  }
}

class MyCalc extends StatefulWidget {
  MyCalc({Key key}) : super(key: key);

  @override
  _MyCalcState createState() => _MyCalcState();
}

class _MyCalcState extends State<MyCalc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Calculadora App",
            style: TextStyle(
              fontSize: 35.0,
              fontFamily: 'Raleway',
            )),
      ),
      floatingActionButton: FloatingActionButton.extended(
          label: Text("Calculadora"),
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute<Null>(builder: (BuildContext context) {
              return new Operacionespage();
            }
            ));
          }),
    );
  }
}
