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
  double salarioEscolhido = 0;
  int tempoExperiencia = 0;

  bool saving = false;

  @override
  void initState() {
    // TODO: implement initState
    niveis = nivelRepository.retornaNiveis();
    languages = languagesRepository.retornaLanguage();
    super.initState();
  }

  List<DropdownMenuItem<int>> returnItens(int quantidadeMax) {
    var itens = <DropdownMenuItem<int>>[];
    for (var i = 0; i <= quantidadeMax; i++) {
      itens.add(
        DropdownMenuItem(
          child: Text(i.toString()),
          value: i,
        ),
      );
    }
    return itens;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 196, 196, 196),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 196, 196, 196),
          title: const Text(
            "Meus Dados",
            style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          child: saving
              ? const Center(child: CircularProgressIndicator())
              : ListView(
                  children: [
                    const TextLabel(
                      texto: "Name",
                    ),
                    TextField(
                      controller: nomeController,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const TextLabel(
                      texto: "Date of Birth",
                    ),
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
                    const TextLabel(
                      texto: "Level of Experience",
                    ),
                    Column(
                        children: niveis
                            .map((nivel) => RadioListTile(
                                  activeColor:
                                      const Color.fromARGB(255, 0, 0, 0),
                                  title: Text(
                                    nivel.toString(),
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 17,
                                    ),
                                  ),
                                  selected: nivelSelecionado == nivel,
                                  value: nivel,
                                  groupValue: nivelSelecionado,
                                  onChanged: (value) {
                                    print(value);
                                    setState(() {
                                      nivelSelecionado = value.toString();
                                    });
                                  },
                                ))
                            .toList()),
                    const TextLabel(
                      texto: "Preferred Languages",
                    ),
                    Column(
                      children: languages
                          .map(
                            (language) => CheckboxListTile(
                              activeColor: const Color.fromARGB(255, 0, 0, 0),
                              checkColor:
                                  const Color.fromARGB(255, 255, 255, 255),
                              title: Text(
                                language,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 17,
                                ),
                              ),
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
                              },
                              controlAffinity: ListTileControlAffinity.leading,
                              side: const BorderSide(
                                  color: Color.fromARGB(255, 0, 0, 0)),
                            ),
                          )
                          .toList(),
                    ),
                    const TextLabel(
                      texto: "Time of Experience",
                    ),
                    DropdownButton(
                      iconEnabledColor: const Color.fromARGB(255, 0, 0, 0),
                      dropdownColor: const Color.fromARGB(255, 196, 196, 196),
                      value: tempoExperiencia,
                      isExpanded: true,
                      items: returnItens(50),
                      style: const TextStyle(
                        fontSize: 20,
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                      onChanged: (value) {
                        setState(() {
                          tempoExperiencia = int.parse(value.toString());
                        });
                      },
                      iconSize: 30,
                    ),
                    TextLabel(
                      texto:
                          "Salary Requirements: \$${salarioEscolhido.round().toString()}",
                    ),
                    Slider(
                        min: 0,
                        max: 10000,
                        value: salarioEscolhido,
                        onChanged: (double value) {
                          setState(() {
                            salarioEscolhido = value;
                            print(value);
                          });
                        }),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          saving = false;
                        });
                        if (nomeController.text.trim().length < 3) {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                                  backgroundColor: Color.fromARGB(255, 0, 0, 0),
                                  content: Text(
                                    "The name must be filled in correctly!",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600),
                                  )));
                          return;
                        }
                        if (dataNascimento == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text("Incorrect Date of Birth!")));
                          return;
                        }
                        if (nivelSelecionado.trim() == "") {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content:
                                      Text("The Level Must be Selected!")));
                          return;
                        }
                        if (languagesSelected.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text(
                                      "At least one language must be selected!")));
                          return;
                        }
                        if (salarioEscolhido == 0) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content:
                                      Text("Select your desired salary!")));
                          return;
                        }

                        setState(() {
                          saving = true;
                        });

                        Future.delayed(const Duration(seconds: 3), () {
                          setState(() {
                            saving = false;
                          });
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text(
                                      "Your data has been saved successfully!")));
                          Navigator.pop(context);
                        });
                        setState(() {
                          saving = true;
                        });
                      },
                      child: const Text(
                        "Save",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.w800),
                      ),
                    )
                  ],
                ),
        ),
        
      ),
    );
  }
}
