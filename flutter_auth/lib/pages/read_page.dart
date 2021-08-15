import 'package:flutter/material.dart';
import 'package:flutter_auth/pages/write_page.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ReadPage extends StatefulWidget {
  ReadPage({Key key}) : super(key: key);

  @override
  _ReadPageState createState() => _ReadPageState();
}

class _ReadPageState extends State<ReadPage> {
  List<String> items = [];
  bool tof = true;

  Future<void> lectura() async{
    try{
      var url = Uri.parse("https://data-4d332-default-rtdb.firebaseio.com/agenda.json");

      var response = await http.get(url);
      var data = json.decode(response.body);

      items.clear();
      data.forEach((key, value)
        {
        items.add(value["nombre"]); items.add(value["email"]);
        }
      );
      
      setState(() {
        tof=false;
      });
    } catch(e){
      print(e.toString());
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Read Page'),
      ),
      body: Column(
        children: [
          ListView.builder(
            padding: EdgeInsets.all(10),
            itemCount: items.length,
            itemBuilder: (context, index){
              return Container(
                child: Text(items[index]),
              );
            }
          ),
        ],
      ),
      // Botones
      floatingActionButton: Padding(
        padding: EdgeInsets.only(left: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Boton que inicia la lectura

            FloatingActionButton(onPressed: () => lecturadatos(),
            child: Icon(Icons.auto_stories),),

            // Boton a Pagina write

            FloatingActionButton(onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
                return new WritePage();
              }));
            },
            child: Icon(Icons.border_color),
            ),
          ],
        ),
      ),
    );
  }

  void lecturadatos(){
    lectura();
  }
}
