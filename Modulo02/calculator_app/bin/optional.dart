void main(List<String>arguments){
  printName("Leonardo");
  printName("Leonardo", sobrenome: "Massaroli");
}

void printName(String name, {String? sobrenome}){
  print("My name is: $name");
  if(sobrenome != null){
  print("My lastname is: $sobrenome");
  }
} 