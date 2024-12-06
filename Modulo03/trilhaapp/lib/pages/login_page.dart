import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 190, 190, 190),
        body: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 30),
              const Icon(
                Icons.person_4_rounded,
                size: 150,
                color: Color.fromARGB(255, 65, 52, 189),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 50),
                height: 30,
                alignment: Alignment.center,
                child: const Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text(
                        "Informe seu e-mail: ",
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        "Email",
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 50),
                height: 30,
                alignment: Alignment.center,
                child: const Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text(
                        "Informe sua senha: ",
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        "Senha",
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(child: Container()),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 50),
                color: const Color.fromARGB(255, 0, 0, 0),
                height: 30,
                alignment: Alignment.center,
                child: const Text(
                  "Entrar",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 50),
                height: 30,
                alignment: Alignment.center,
                child: const Text(
                  "Cadastro",
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
