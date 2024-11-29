import 'package:meu_app_oo/enum/tipo_notificacao.dart';

abstract class Pessoa {
    String _nome = "";
    String _endereco = "";
    TipoNotificacao _tipoNotificacao = TipoNotificacao.NENHUM;

    void setNome(String nome){
        _nome = nome;
    }

    String getNome(){
        return _nome;
    }

    void setEndereco(String endereco){
        _endereco = endereco;
    }

        String getEndereco(){
        return _endereco;
    }

    void setTipoNotificacao(TipoNotificacao tipoNotificacao){
      _tipoNotificacao = tipoNotificacao;
    }

    TipoNotificacao getTipoNotificacao(){
      return _tipoNotificacao;
    }

    Pessoa(String nome, String endereco, {TipoNotificacao tipoNotificacao = TipoNotificacao.NENHUM}){
        _nome = nome;
        _endereco = endereco;
        _tipoNotificacao = tipoNotificacao;
    }

    @override
  String toString() {
    return {"Nome": _nome,"Endereço": _endereco, "TipoNotificação": _tipoNotificacao}.toString();
  }

}