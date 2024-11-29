void main (List<String>arguments){
printData("Meu texto");
soma(1, 2);
printData(soma(1,2).toString());
}

void printData(String texto) => print(texto);

int soma(int number1, int number2) => number1 + number2;

