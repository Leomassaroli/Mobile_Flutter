import 'package:meu_app_oo/classes/pessoa_abstract.dart';
import 'package:meu_app_oo/service/notification_interface.dart';

class NotificationSms implements NotificationInterface{

  @override
  void enviarNotificacao(Pessoa Pessoa){
    print("Enviando SMS para: ${Pessoa.getNome()}");
  }
}