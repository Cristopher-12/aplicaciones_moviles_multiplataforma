import 'dart:io';

void main() {
  print("|||  Menu  |||");
  print("1 - Mostrar todos los registros");
  print("2 - Insertar Nuevo registro");
  print("3 - Modificar un registro");
  print("4 - Borrar un registro");
  print("5 - Terminar programa");
  
  print("Selecciona una opcion tecleando su numero: ");
  int option = 1;
  option = int.parse(stdin.readLineSync());

  if (option == 1){
    most_reg();
  }

  if (option == 2){
    int_reg();
  }
  if (option == 3){
    mod_reg();
  }
  if (option == 4){
    delete_reg();
  }
}

List registros = [];

void most_reg(){
  if (registros.isEmpty){print("No existe ningun registro almacenado");}
  else {
    int contador = 1;
    for (var regs in registros) {
      print("Registro Numero $contador:");
      print("name: ${regs["name"]}");
      print("Numero de Telefono: ${regs["ntel"]}");
      print("E-mail: ${regs["email"]}");
      contador++;
    }
  }
}

void int_reg(){
  print("name de la persona:");
  String name = stdin.readLineSync();
  print("Ingresa telefono:");
	String ntel = stdin.readLineSync();
	print("Ingresa e-mail:");
	String email = stdin.readLineSync();
  Map <String,String> datos={
    "name":name,
    "ntel":ntel,
    "email":email,
  }; 
  registros.add(datos);
  print("Se ha realizado el registro exitosamente");
}

void mod_reg(){
  print("Nombre de la persona a la que se le modificara su registro:");
  String nombre = stdin.readLineSync();
  for (var data in registros){
    if (data["nombre"] == nombre){
      print("¿Que elemento se modificará? nombre, ntelefono o email");
      String modificacion = stdin.readLineSync();
      if (modificacion == "nombre"){
        print("Escriba el dato que se modificará");
        String mod = stdin.readLineSync();
        data[modificacion] = mod;
        print("Se ha actualizado el registro correctamnte");
      }
      if (modificacion == "ntelefono"){
        print("Escriba el dato que se modificará");
        String mod = stdin.readLineSync();
        data[modificacion] = mod;
        print("Se ha actualizado el registro correctamnte");
      }
      if (modificacion == "email"){
        print("Escriba el dato que se modificará");
        String mod = stdin.readLineSync();
        data[modificacion] = mod;
        print("Se ha actualizado el registro correctamnte");
      }   
    }
  }
}

void delete_reg(){
  print("Nombre de la persona que se eliminara el registro:");
  String del = stdin.readLineSync();
  int dir = 0;
  for(var data in registros){
    if(data["nombre"] == del){
      registros.removeAt(dir);
      print("El registro ha sido eliminado exitosamente.");
    }
  }
}
