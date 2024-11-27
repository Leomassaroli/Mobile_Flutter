import 'utils.dart' as utils;

void main(List<String> arguments){
  var line = utils.lerConsole("Digite um número ou aperta S para sair.");
  double acumulate = 0;
  List<double> numbers = [];
  while (line != "S"){
    numbers.add(double.parse(line));
    line = utils.lerConsole("Digite um número ou digite S para sair.");
  }
  print(utils.somaLista(numbers));
}