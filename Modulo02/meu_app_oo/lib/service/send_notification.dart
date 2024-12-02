import 'package:meu_app_oo/classes/pessoa_abstract.dart';
import 'package:meu_app_oo/enum/tipo_notificacao.dart';
import 'package:meu_app_oo/service/impl/notification_email.dart';
import 'package:meu_app_oo/service/impl/notification_push_notification.dart';
import 'package:meu_app_oo/service/impl/notification_sms.dart';
import 'package:meu_app_oo/service/notification_interface.dart';

class EnviarNotificacao{
  NotificationInterface? notificacao;

  void notificar(Pessoa pessoa){
    switch (pessoa.getTipoNotificacao()) {
      case TipoNotificacao.EMAIL:
        notificacao = NotificationEmail();
        break;
      case TipoNotificacao.PUSH_NOTIFICATION:
        notificacao = NotificationPushNotification();
        break;
      case TipoNotificacao.SMS:
        notificacao = NotificationSms();
      default:
        break;
    }
    if(notificacao != null){
      notificacao!.enviarNotificacao(pessoa);
    } else{
      print("Pessoa sem tipo de notificação!");
    }
  }
}