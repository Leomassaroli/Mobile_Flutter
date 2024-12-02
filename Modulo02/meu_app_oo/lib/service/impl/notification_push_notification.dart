import 'package:meu_app_oo/classes/pessoa_abstract.dart';
import 'package:meu_app_oo/service/notification_interface.dart';

class NotificationPushNotification implements NotificationInterface{

  @override
  void enviarNotificacao(Pessoa Pessoa){
    print("Enviando Push para: ${Pessoa.getNome()}");
  }
}