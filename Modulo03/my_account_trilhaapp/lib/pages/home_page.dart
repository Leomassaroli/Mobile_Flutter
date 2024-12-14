import 'package:flutter/material.dart';
import 'package:trilhaapp/pages/registration_data.dart';
import 'package:trilhaapp/pages/page_one.dart';
import 'package:trilhaapp/pages/page_two.dart';
import 'package:trilhaapp/shared/widgets/custom_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController controller = PageController(initialPage: 0);
  int posicaoPagina = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Home"),
          backgroundColor: const Color.fromARGB(255, 112, 112, 112),
        ),
        drawer: const CustomDrawer(),
        body: Column(
          children: [
            Expanded(
              child: PageView(
                controller: controller,
                onPageChanged: (value) {
                  setState(() {
                    posicaoPagina = value;
                  });
                },
                scrollDirection: Axis.horizontal,
                children: const [
                  PageOne(),
                  PageTwo(),
                ],
              ),
            ),
            BottomNavigationBar(
                onTap: (value) {
                  controller.jumpToPage(value);
                },
                currentIndex: posicaoPagina,
                items: const [
                  BottomNavigationBarItem(
                    label: "Page One",
                    icon: Icon(Icons.home),
                  ),
                  BottomNavigationBarItem(
                    label: "Page Two",
                    icon: Icon(Icons.add),
                  )
                ])
          ],
        ),
      ),
    );
  }
}
