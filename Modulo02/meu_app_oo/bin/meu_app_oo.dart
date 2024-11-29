import 'package:meu_app_oo/classes/pessoa_fisica.dart';
import 'package:meu_app_oo/classes/pessoa_juridica.dart';
import 'package:meu_app_oo/enum/tipo_notificacao.dart';

void main(List<String> arguments) {

  var pessoafisica1 = PessoaFisica("Leonardo", "Rua 1", "49808448801");
  print(pessoafisica1);

  var pessoajuridica1 = Pessoajuridica("Empresa 1", "Rua 1", "123456789");
  print(pessoajuridica1);
}
