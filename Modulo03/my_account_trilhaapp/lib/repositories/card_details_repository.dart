import 'package:trilhaapp/models/card_details.dart';

class CardDetailsRepository {
  Future<CardDetails> get() async {
    await Future.delayed(const Duration(seconds: 3));
    return CardDetails(
      1,
      "Flutter: O Framework do Google para Aplicativos Nativos e Multiplataforma",
      "https://hermes.digitalinnovation.one/assets/diome/logo.png",
      "Flutter é um framework de código aberto criado pelo Google para a criação de aplicativos nativos para Android, iOS, web e desktop, a partir de um único código-fonte. Ele utiliza a linguagem Dart e oferece uma ampla biblioteca de widgets altamente personalizáveis, permitindo criar interfaces modernas e responsivas. Um dos principais diferenciais do Flutter é o recurso de hot reload, que permite visualizar alterações no código instantaneamente durante o desenvolvimento, tornando o processo mais rápido e eficiente. Além disso, o Flutter é conhecido por seu desempenho excepcional, já que compila o código diretamente para nativo. Por isso, é uma escolha popular entre desenvolvedores que buscam construir aplicativos de alta qualidade com menos esforço e tempo.",
    );
  }
}
