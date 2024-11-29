import 'package:meu_app_oo/classes/pessoa_abstract.dart';
import 'package:meu_app_oo/enum/tipo_notificacao.dart';

class Pessoajuridica extends Pessoa{
    String _cnpj = "";

        void setCnpj(String cnpj){
        _cnpj = _cnpj;
    }

        String getCnpj(){
        return _cnpj;
    }

    Pessoajuridica(String nome, String endereco, String cnpj, {TipoNotificacao tipoNotificacao = TipoNotificacao.NENHUM})
      :super(nome, endereco, tipoNotificacao: tipoNotificacao){
        _cnpj = cnpj;
    }

    @override
  String toString() {
    return {
      "Nome": getNome(),
      "Endereço": getEndereco(),
      "CNPJ": _cnpj,
      "TipoNotificação": getTipoNotificacao(),
      }.toString();
  }

}