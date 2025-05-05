import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:trilhaapp/models/card_details.dart';
import 'package:trilhaapp/pages/card_details.dart';
import 'package:trilhaapp/repositories/card_details_repository.dart';

class CardPage extends StatefulWidget {
  const CardPage({super.key});

  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  CardDetails? cardDetails;
  CardDetailsRepository cardDetailsRepository = CardDetailsRepository();

  @override
  void initState() {
    super.initState();
    carregarDados();
  }

  void carregarDados() async {
    cardDetails = await cardDetailsRepository.get();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          width: double.infinity,
          child: cardDetails == null
              ? LinearProgressIndicator()
              : InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CardDetailsPage(
                                  cardDetails: cardDetails!,
                                )));
                  },
                  child: Hero(
                    tag: cardDetails!.id,
                    child: Card(
                      elevation: 8,
                      shadowColor: Colors.black,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                CachedNetworkImage(
                                  imageUrl: cardDetails!.url,
                                  height: 20,
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                Expanded(
                                  child: Text(
                                    cardDetails!.title,
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
                              cardDetails!.text,
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
                                              builder: (context) =>
                                                  CardDetailsPage(
                                                    cardDetails: cardDetails!,
                                                  )));
                                    },
                                    child: const Text(
                                      "Read More...",
                                      style: TextStyle(
                                          fontSize: 16,
                                          color:
                                              Color.fromARGB(255, 65, 28, 160),
                                          fontWeight: FontWeight.w600,
                                          decoration: TextDecoration.underline),
                                    )))
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
        ),
      ],
    );
  }
}
