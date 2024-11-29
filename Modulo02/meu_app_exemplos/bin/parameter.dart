void main (List<String> arguments){

  print(executar(10, incrementar));
  print(executar(10, decrementar));

}

int executar(int number, Function func){
  return func(number);
}

int incrementar(int number){
  return number + 1;
}

int decrementar(int number){
  return number - 1;
}
