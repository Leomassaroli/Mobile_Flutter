import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:trilhaapp/models/card_details.dart';
import 'package:trilhaapp/pages/card_details.dart';

class CardPage extends StatefulWidget {
  const CardPage({super.key});

  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  var cardDetails = CardDetails(
    1,
    "Flutter: O Framework do Google para Aplicativos Nativos e Multiplataforma",
    "https://hermes.digitalinnovation.one/assets/diome/logo.png",
    "Flutter é um framework de código aberto criado pelo Google para a criação de aplicativos nativos para Android, iOS, web e desktop, a partir de um único código-fonte. Ele utiliza a linguagem Dart e oferece uma ampla biblioteca de widgets altamente personalizáveis, permitindo criar interfaces modernas e responsivas. Um dos principais diferenciais do Flutter é o recurso de hot reload, que permite visualizar alterações no código instantaneamente durante o desenvolvimento, tornando o processo mais rápido e eficiente. Além disso, o Flutter é conhecido por seu desempenho excepcional, já que compila o código diretamente para nativo. Por isso, é uma escolha popular entre desenvolvedores que buscam construir aplicativos de alta qualidade com menos esforço e tempo.",
  );
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          width: double.infinity,
          //child: InkWell(
          // onTap: () {
          //   Navigator.push(
          //       context,
          //       MaterialPageRoute(
          //           builder: (context) => CardDetailsPage(
          //                 cardDetails: cardDetails,
          //               )));
          // },
          child: Hero(
            tag: cardDetails.id,
            child: Card(
              elevation: 8,
              shadowColor: Colors.black,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CachedNetworkImage(
                          imageUrl: cardDetails.url,
                          height: 20,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Expanded(
                          child: Text(
                            cardDetails.title,
                            style: const TextStyle(
                                fontSize: 20, color: Colors.black),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      cardDetails.text,
                      textAlign: TextAlign.justify,
                      style: const TextStyle(fontSize: 16),
                    ),
                    Container(
                        width: double.infinity,
                        alignment: Alignment.centerRight,
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CardDetailsPage(
                                            cardDetails: cardDetails,
                                          )));
                            },
                            child: const Text(
                              "Read More...",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Color.fromARGB(255, 65, 28, 160),
                                  fontWeight: FontWeight.w600,
                                  decoration: TextDecoration.underline),
                            )))
                  ],
                ),
              ),
            ),
          ),
        ),
//        ),
      ],
    );
  }
}
