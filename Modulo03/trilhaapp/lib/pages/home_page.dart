import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trilhaapp/services/generator_aleatory_number_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var generatedNumber = 0;
  var numberClicks = 0;

  @override
  Widget build(BuildContext context) {
    debugPrint("Chamando o método build");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 109, 145, 150),
        title: Text(
          "My App!",
          style: GoogleFonts.pacifico(
            fontSize: 25,
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 200,
              height: 200,
              color: const Color.fromARGB(255, 143, 121, 87),
              child: Text(
                "Ações do usuário",
                style: GoogleFonts.acme(fontSize: 35),
              ),
            ),
            SizedBox(
              width: 200,
              height: 100,
              child: Container(
                color: const Color.fromARGB(255, 134, 117, 92),
                child: Text(
                  "Foi clicado $numberClicks vezes",
                  style: GoogleFonts.acme(fontSize: 25),
                ),
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                color: const Color.fromARGB(255, 146, 130, 106),
                child: Text(
                  "O número gerado foi: $generatedNumber",
                  style: GoogleFonts.acme(fontSize: 25),
                ),
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                color: Colors.grey,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        color: Colors.red,
                        child: Text(
                          "Nome: ",
                          style: GoogleFonts.acme(fontSize: 25),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Container(
                        color: Colors.blue,
                        child: Text(
                          "Leonardo Massaroli",
                          style: GoogleFonts.acme(fontSize: 25),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        color: Colors.green,
                        child: Text(
                          "10",
                          style: GoogleFonts.acme(fontSize: 25),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: SizedBox(
        width: 70,
        height: 70,
        child: FloatingActionButton(
            // ignore: sort_child_properties_last
            child: const Icon(
              Icons.add_circle,
              color: Colors.black,
              size: 30,
            ),
            backgroundColor: const Color.fromARGB(255, 109, 145, 150),
            onPressed: () {
              setState(() {
                numberClicks = numberClicks + 1;
                generatedNumber =
                    GeneratorAleatoryNumberService.generatorAleatoryNumber(100);
              });
            }),
      ),
    );
  }
}
