import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:trilhaapp/pages/registration_data.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              showModalBottomSheet(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  context: context,
                  builder: (BuildContext context) {
                    return Wrap(
                      children: [
                        ListTile(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          title: const Text("Câmera"),
                          leading: const Icon(
                            Icons.camera,
                            color: Colors.black,
                          ),
                        ),
                        ListTile(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          title: const Text("Galeria"),
                          leading: const Icon(
                            Icons.insert_photo_rounded,
                            color: Colors.black,
                          ),
                        )
                      ],
                    );
                  });
            },
            child: UserAccountsDrawerHeader(
                decoration:
                    const BoxDecoration(color: Color.fromARGB(255, 0, 0, 0)),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: CachedNetworkImage(
                      imageUrl:
                          "https://hermes.digitalinnovation.one/assets/diome/logo.png"),
                ),
                accountName: const Text(
                  "Leonardo Massaroli",
                  style: TextStyle(fontSize: 20),
                ),
                accountEmail: const Text("email@email.com",
                    style: TextStyle(fontSize: 15))),
          ),
          InkWell(
            child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                width: double.infinity,
                child: const Row(
                  children: [
                    Icon(
                      Icons.person,
                      color: Colors.black,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Registration Data",
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                )),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const MyAccount()));
            },
          ),
          const Divider(),
          InkWell(
            child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                width: double.infinity,
                child: const Row(
                  children: [
                    Icon(
                      Icons.book,
                      color: Colors.black,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Terms of use and privacy",
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                )),
            onTap: () {
              showModalBottomSheet(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  context: context,
                  builder: ((BuildContext context) {
                    return SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.8,
                      child: const SingleChildScrollView(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 16, horizontal: 22),
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(bottom: 10),
                                child: Text(
                                  "Please read our terms of use and privacy.",
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Divider(),
                              Text(
                                "At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.",
                                style: TextStyle(fontSize: 20),
                                textAlign: TextAlign.start,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }));
            },
          ),
          const Divider(),
          const SizedBox(
            height: 10,
          ),
          const Spacer(),
          const Divider(),
          InkWell(
            child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                width: double.infinity,
                child: const Row(
                  children: [
                    Icon(
                      Icons.settings,
                      color: Colors.black,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Settings",
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                )),
            onTap: () {},
          ),
          const Divider(),
          InkWell(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              width: double.infinity,
              child: const Row(
                children: [
                  Icon(
                    Icons.exit_to_app,
                    color: Colors.black,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Exit",
                    style: TextStyle(fontSize: 18),
                  )
                ],
              ),
            ),
            onTap: () {
              showDialog(
                  context: context,
                  builder: (BuildContext bc) {
                    return const AlertDialog();
                  });
            },
          ),
          const SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}
