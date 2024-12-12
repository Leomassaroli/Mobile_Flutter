import 'package:flutter/material.dart';
import 'package:trilhaapp/repositories/language_repository.dart';
import 'package:trilhaapp/repositories/nivel_repository.dart';
import 'package:trilhaapp/shared/widgets/text_label.dart';

class MyAccount extends StatefulWidget {
  const MyAccount({
    super.key,
  });

  @override
  State<MyAccount> createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
  TextEditingController nomeController = TextEditingController();
  TextEditingController dataNascimentoController = TextEditingController();
  DateTime? dataNascimento;
  var nivelRepository = NivelRepository();
  var languagesRepository = LanguageRepository();
  var niveis = [];
  var languages = [];
  var languagesSelected = [];
  var nivelSelecionado = "";
  var salarioEscolhido = "";

  @override
  void initState() {
    // TODO: implement initState
    niveis = nivelRepository.retornaNiveis();
    languages = languagesRepository.retornaLanguage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Meus Dados"),
          backgroundColor: const Color.fromARGB(255, 112, 112, 112),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          child: ListView(
            children: [
              const TextLabel(texto: "Name"),
              TextField(
                controller: nomeController,
              ),
              const SizedBox(
                height: 20,
              ),
              const TextLabel(texto: "Date of Birth"),
              TextField(
                controller: dataNascimentoController,
                readOnly: true,
                onTap: () async {
                  var date = await showDatePicker(
                      context: context,
                      initialDate: DateTime(2000, 1, 1),
                      firstDate: DateTime(1900, 1, 1),
                      lastDate: DateTime(2024, 1, 1));
                  print(date != null);
                  {
                    dataNascimentoController.text = date.toString();
                    dataNascimento = date;
                  }
                },
              ),
              const TextLabel(texto: "Level of Experience"),
              Column(
                  children: niveis
                      .map((nivel) => RadioListTile(
                          activeColor: const Color.fromARGB(255, 45, 43, 155),
                          title: Text(nivel.toString()),
                          selected: nivelSelecionado == nivel,
                          value: nivel,
                          groupValue: nivelSelecionado,
                          onChanged: (value) {
                            print(value);
                            setState(() {
                              nivelSelecionado = value.toString();
                            });
                          }))
                      .toList()),
              const TextLabel(texto: "Preferred Languages "),
              Column(
                children: languages
                    .map(
                      (language) => CheckboxListTile(
                          title: Text(language),
                          value: languagesSelected.contains(language),
                          onChanged: (bool? value) {
                            if (value == true) {
                              setState(() {
                                languagesSelected.add(language);
                              });
                            } else {
                              setState(() {
                                languagesSelected.remove(language);
                              });
                            }
                          }),
                    )
                    .toList(),
              ),
              const TextLabel(texto: "Salary Requirements"),
              Slider(
                  min: 0,
                  max: 10000,
                  value: 5000,
                  onChanged: (double value) {}),
              TextButton(
                onPressed: () {
                  print(nomeController.text);
                  print(dataNascimento);
                },
                child: const Text(
                  "Salvar",
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
