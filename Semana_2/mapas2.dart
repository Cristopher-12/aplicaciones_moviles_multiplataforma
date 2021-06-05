import "dart:io";

List personas = []; //Generamos la lista donde se almacenaran los valores

void main() { // Iniciamos la aplicacion con main
	
  print("\nMenú: \n");  //Imprimos las opciones en consola
	print("1 Mostrar todos los datos.");
	print("2 Insertar un nuevo registro.");
	print("3 Modificar un registro.");
	print("4 Borrar un registro.");
	print("5 Salir.\n");
	
	int opcion = 1;
	while (opcion > 0 && opcion < 5) {
		print("Por favor elija una opcion: ");
		opcion = int.parse(stdin.readLineSync()); //Introducimos la opcion deseada
		if (opcion == 1) {
			most_dat(personas); //Metodo para mostrar los datos de las personas
		} 
		else if (opcion == 2) {
			int_dat(personas);  // Metodo para insertar	un registro		
		} 
		else if (opcion == 3) {
			mod_element(personas);  //Metodo para modificar registros
		}
		else if (opcion == 4) {  //Metodo para eliminar registros
			delete_reg(personas);
		}
	}
	print("\n ___Hasta Luego___");
}

most_dat(List personas) {
	if (personas.isEmpty){ print("Aun No hay registros.");}
	else {
		int contador = 1;
		for (var datos in personas) {
			print("Registro $contador:");
			print("Nombre: ${datos["nombre"]}");
			print("Telefóno: ${datos["telefono"]}");
			print("E-mail: ${datos["email"]}\n");
			contador++;
		}
	} 
}

int_dat(List personas) {
	print("Ingresa nombre:");
	String nombre = stdin.readLineSync();
	print("Ingresa telefono:");
	String telefono = stdin.readLineSync();
	print("Ingresa e-mail:");
	String email = stdin.readLineSync();
	Map <String, String> persona = {
		"nombre" : nombre,
		"telefono" : telefono,
		"email" : email
	};
	personas.add(persona);
	print("El registro se ha agregado correctamente.");
}

mod_element(List personas) {
	String validacion = ""; //por si no cumple la condición
	print("Ingresa el nombre de la persona a la que se le modificara su registro:");
	String nombre = stdin.readLineSync();
	for(var datos in personas) {
		if (datos["nombre"] == nombre) {
			print("¿Qué elemento desea modificar? ( nombre / telefono / email )");
			String llave = stdin.readLineSync();
			if (llave == "nombre" || llave == "telefono" || llave == "email") {
				print("Ingrese dato a modificar: ");
				String nuevo_valor = stdin.readLineSync();
				datos[llave] = nuevo_valor;
				print("El registro se ha actualizado correctamente.");
			}
			else {
				print("La opción ingresada no es válida, intente de nuevo.");
			}
			validacion = "si cumplió la condición";
		}
	}
	if (validacion == "") {
		print("El nombre ingresado no es válido, intente de nuevo.");
	}
}

delete_reg (List personas) {
	String validacion = "";
	print("Nombre de la persona que se eliminara:");
	String nombre = stdin.readLineSync();
	int index = 0;
	for(var datos in personas) {
		if (datos["nombre"] == nombre) {
			personas.removeAt(index);
			print("El registro se ha eliminado correctamente.");
			validacion = "si cumplió la condición";
			break;			
		}
		index++;
	}
	if (validacion == "") {
		print("El nombre ingresado no es válido, intente de nuevo.");
	}
}