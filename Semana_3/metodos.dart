import 'dart:io';

void main() {
  final objeto_menu = new Sensores();
  objeto_menu.menu();

  final objeto_pregunta = new Sensores();
  objeto_pregunta.pregunta();
}

List<dynamic> data = [];

class Sensores {
  void almacenar_datos() {
    //Contructor
    Sensores() {}

    print("Inserta el ID del sensor:");
    var id_sensor = stdin.readLineSync();

    print("Inserta el valor:");
    var valor = stdin.readLineSync();

    print("Inserta la fecha de registro:");
    var fecha = stdin.readLineSync();

    //List almacen = [id_sensor, valor, fecha];
    Map<dynamic, dynamic> datosalmc = {
      "id_sensor": id_sensor,
      "valor": valor,
      "fecha": fecha
    };
    data.add(datosalmc);
  }

  void pregunta() {
  print("¿Desea visualizar los registros?");
  var respuesta = stdin.readLineSync();
  if (respuesta == "si") {
    mostrar_datos();
    }
  if (respuesta == "no"){
    print("El programa ha finalizado.");
    }
  }
  
  void mostrar_datos() {
    print(data);
  }

  void menu() {
    print("--- Bienvenido ---");
    
    print("Numero de registros que se ingresarán");
    dynamic registros = stdin.readLineSync();
    int no_registros = int.parse(registros);
    for(var i = 0; i < no_registros; i++){ 
      almacenar_datos();
    }
  }
}
