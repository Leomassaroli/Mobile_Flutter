import 'package:flutter/material.dart';

class MyAccount extends StatelessWidget {
  final String texto;
  final List<String> dados;
  const MyAccount({super.key, required this.texto, required this.dados});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(texto),
          backgroundColor: const Color.fromARGB(255, 112, 112, 112),
        ),
        body: const Center(
          child: Text("My Account"),
        ),
      ),
    );
  }
}
