import 'dart:math';

import 'package:flutter/material.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

      ),
      home: const HomePage() ,
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var generatedNumber = 0;

  int _generatorAleatoryNumber(){
    Random aleatoryNumber = Random();
    return aleatoryNumber.nextInt(1000);
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("Chamando o método build");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 82, 81, 79),
        title: const Text("My App!"),
      ),
      body: Center(child: Text(generatedNumber.toString())),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add_circle),
        onPressed: (){
          setState(() {
            generatedNumber = _generatorAleatoryNumber();
          });
      }),
    );
  }
}