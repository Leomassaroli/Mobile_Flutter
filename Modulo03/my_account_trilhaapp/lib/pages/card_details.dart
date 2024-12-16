import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:trilhaapp/models/card_details.dart';

class CardDetailsPage extends StatelessWidget {
  final CardDetails cardDetails;

  const CardDetailsPage({super.key, required this.cardDetails});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: cardDetails.id,
      child: SafeArea(
        child: Scaffold(
          // appBar: AppBar(
          //   backgroundColor: const Color.fromARGB(255, 112, 112, 112),
          // ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.close)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CachedNetworkImage(
                    imageUrl: cardDetails.url,
                    height: 100,
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Text(
                cardDetails.title,
                style: const TextStyle(fontSize: 25, color: Colors.black),
                textAlign: TextAlign.start,
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: Text(
                  cardDetails.text,
                  textAlign: TextAlign.justify,
                  style: const TextStyle(fontSize: 17),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
