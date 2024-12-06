import 'package:flutter/material.dart';
import 'package:trilhaapp/service/generator_aleatory_number_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var generatedNumber = 0;

  @override
  Widget build(BuildContext context) {
    debugPrint("Chamando o método build");
    return Scaffold(
      appBar: AppBar(
        title: Text("My App!",
        ),
      ),
      body: Center(child: Text(generatedNumber.toString(),
      )),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add_circle),
        onPressed: (){
          setState(() {
            generatedNumber = GeneratorAleatoryNumberService.generatorAleatoryNumber(100);
          });
      }),
    );
  }
}