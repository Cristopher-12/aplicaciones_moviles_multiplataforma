import 'package:flutter/material.dart';

class Operacionespage extends StatefulWidget {
  Operacionespage({Key key}) : super(key: key);

  @override
  _OperacionespageState createState() => _OperacionespageState();
}

class _OperacionespageState extends State<Operacionespage> {
  final numero_1 = TextEditingController();
  final numero_2 = TextEditingController();
  int resultado = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Calculadora App',
            style: TextStyle(
              fontSize: 35.0,
              fontFamily: 'Raleway',
            )),
        backgroundColor: Colors.orange,
      ),
      // Inicia la calculadora
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 70.0,
            ),
            Text(
              'Numero 1',
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 20.0,
              ),
            ),
            TextField(
              controller: numero_1,
              autofocus: true,
              keyboardType: TextInputType.number,
            ),
            SizedBox(
              height: 50.0,
            ),
            Text(
              'Numero 2',
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 20.0,
              ),
            ),
            TextField(
              controller: numero_2,
              autofocus: true,
              keyboardType: TextInputType.number,
            ),
            SizedBox(
              height: 50.0,
            ),
            Text(
              'Resultado = $resultado',
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 20.0,
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            FloatingActionButton(
                child: Icon(Icons.add),
                onPressed: () {
                  setState(() {
                    suma();
                  });
                }),
            SizedBox(
              height: 30.0,
            ),
            FloatingActionButton(
                child: Icon(Icons.horizontal_rule),
                onPressed: () {
                  setState(() {
                    resta();
                  });
                }),
            SizedBox(
              height: 30.0,
            ),
            FloatingActionButton(
                child: Icon(Icons.cancel),
                onPressed: () {
                  setState(() {
                    multiplicacion();
                  });
                }),
            SizedBox(
              height: 30.0,
            ),
            FloatingActionButton(
                child: Icon(Icons.extension),
                onPressed: () {
                  setState(() {
                    division();
                  });
                }),
          ],
        ),
      ),
    );
  }

  suma() {
    int n1 = int.parse(numero_1.text);
    int n2 = int.parse(numero_2.text);
    // OPERACION

    int result_suma = n1 + n2;
    resultado = result_suma;
  }

  resta() {
    int n1 = int.parse(numero_1.text);
    int n2 = int.parse(numero_2.text);

    int result_resta = n1 - n2;
    resultado = result_resta;
  }

  multiplicacion() {
    int n1 = int.parse(numero_1.text);
    int n2 = int.parse(numero_2.text);

    int result_multiplicacion = n1 * n2;
    resultado = result_multiplicacion;
  }

  division() {
    int n1 = int.parse(numero_1.text);
    int n2 = int.parse(numero_2.text);

    double result_division = n1 / n2;
    resultado = result_division as int;
  }
}