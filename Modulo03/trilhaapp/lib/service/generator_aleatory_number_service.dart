import 'dart:math';

class GeneratorAleatoryNumberService {

  static int generatorAleatoryNumber(int numberMax){
    Random aleatoryNumber = Random();
    return aleatoryNumber.nextInt(numberMax);
  }

  
}