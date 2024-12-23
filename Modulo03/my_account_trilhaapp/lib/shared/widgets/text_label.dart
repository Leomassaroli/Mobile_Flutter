import 'package:flutter/material.dart';

class TextLabel extends StatelessWidget {
  final String texto;
  const TextLabel({super.key, required this.texto});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Text(texto,
          style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w100,
              color: Color.fromARGB(255, 0, 0, 0))),
    );
  }
}
