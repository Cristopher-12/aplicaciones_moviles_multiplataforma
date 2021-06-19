import 'dart:io';

void main() {
  final menu = new personas();
  menu.menu();

  final question = new personas();
  question.pregunta();

}

List<dynamic> datasave = [];

class personas {
  void menu() {
    print("--- Bienvenido ---");

    print("1 - Mostrar todos los registros");
    print("2 - Insertar Nuevo registro");
    print("3 - Modificar un registro");
    print("4 - Borrar un registro");
    print("5 - Terminar programa");

    print("Seleccione una opcion de acuerdo a los numeros");

    int respuesta = 1;
    respuesta = int.parse(stdin.readLineSync());

    if (respuesta == 1) {
      mostrar_datos();
    }

    if (respuesta == 2) {
      almacenar_datos();
    }
    if (respuesta == 3) {
      modificar_datos();
    }
    if (respuesta == 4) {
      eliminar_registros();
    }
  }

  void almacenar_datos() {
    print("Inserta el Nombre de la persona:");
    var nombre_persona = stdin.readLineSync();

    print("Inserta el Telefono:");
    var numero_telefono = stdin.readLineSync();

    print("Inserta un Correo electronico:");
    var correo = stdin.readLineSync();

    //List almacen = [id_sensor, valor, fecha];
    Map<dynamic, dynamic> map_datos = {
      "nombre_persona": nombre_persona,
      "numero_telefono": numero_telefono,
      "correo": correo
    };
    datasave.add(map_datos);
    pregunta();
  }

  void mostrar_datos() {
    print(datasave);
      pregunta();
  }

  void modificar_datos() {
    print("Nombre de la persona a la que se le hará la modificación");

    var nombre = stdin.readLineSync();

    for (var md in datasave) {
      if (md["nombre"] == nombre) {
        print("inserte el dato que se eliminará nombre, ntelefono o email");
        print("||| Opciones |||");
        print("nombre");
        print("numero_telefono");
        print("correo");
        var modificacion = stdin.readLineSync();

        if (modificacion == "nombre") {
          print("Inserte el nuevo nuevo Nombre:");
          var modificacion_nombre = stdin.readLineSync();
          md[modificacion_nombre] = modificacion_nombre;
          print("Se ha actualizado el Nombre correctamnte");
        }

        if (modificacion == "numero_telefono") {
          print("Inserte el nuevo numero Telefonico");
          var modificacion_numero_telefonico = stdin.readLineSync();
          md[modificacion] = modificacion_numero_telefonico;
          print("Se ha actualizado el Numero telefonico correctamnte");
        }

        if (modificacion == "correo") {
          print("Escriba el dato que se modificará");
          var modificacion_correo = stdin.readLineSync();
          md[modificacion] = modificacion_correo;
          print("Se ha actualizado el Correo electronico correctamnte");
        }
      }
    }
  }

  void eliminar_registros() {
    print("Inserte el nombre de la persona que se eliminara de los registros:");
    var delete = stdin.readLineSync();
    int dir = 0;
    for (var quitar in datasave) {
      if (quitar["nombre"] == delete) {
        datasave.removeAt(dir);
        print("Se eliminó el registro exitosamente");
      }
    }
  }

  void pregunta() {
  print("¿Desea visualizar el menu nuevamente?");
  var respuesta = stdin.readLineSync();
  if (respuesta == "si") {
    menu();
    }
  if (respuesta == "no"){
    print("El programa ha finalizado.");
    }
  }
}