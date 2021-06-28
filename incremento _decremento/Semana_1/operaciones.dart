void main(){

// obtener area de triangulo utilizando Formula General

int base = 10;
int altura = 15;
int result1 = base*altura;
int division = 2;
dynamic resultado = result1/division;
print(resultado);


// obtener el perimetro de un hexagono

int medida_lado = 3;
int perimetro = medida_lado*6;
print(perimetro);

// Calcular el promedio de 1 alumno teniendo en cuenta que hay 3 evaluaciones con los
//siguientes ponderados Evaluación 1-20%, evaluación 2-30% y evaluación 3-50%.

double ev1 = 8.6;
double ev2 = 8.2;
double ev3 = 9.0;

// Evaluacion 1 20%
double promedio1 = 20*ev1/100; //1.72

// Evaluacion 2 30%
double promedio2 = 30*ev2/100; //2.46

// Evaluacion 3 50%
double promedio3 = 50*ev3/100; //4.5

double promedio_final = promedio1+promedio2+promedio3;

print(promedio_final);

// Calcular la edad de un perro en años humanos,

  // 1 año perro = 7 años humanos

int edadperro = 2;
int edadresult = edadperro*7;
print(edadresult);

}

