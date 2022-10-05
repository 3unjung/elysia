import 'package:elysia/elysia_archive_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.asset("assets/images/elysia.gif"),
          ElevatedButton(
            // change la couleur du boutton
            style: ElevatedButton.styleFrom(backgroundColor: Colors.pinkAccent),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (BuildContext context) {
                  return const ArchiveELysiaPage();
                }),
              );
            },
            child: const Text("Tribute your Waifu"),
          ),
          Container(
              margin: const EdgeInsets.all(10.0),
              padding: const EdgeInsets.all(10.0),
              color: Colors.pinkAccent,
              width: double.infinity,
              child: const Center(
                child: Text(
                  "Vice-Capitaine, fondatrice et numéro 2 des Treize Chasseurs de flammes,"
                  "qui regroupent les 13 Mantis ayant survécu au combat contre le 11e Herrscher, Elysia une jeune"
                  "femme extrêment belle et attirante, avec un côté séducteur qu'elle met souvet à profit.",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              )),
          ElevatedButton(
            onPressed: () {
              debugPrint("Bah oui !");
            },
            child: const Text("Tu marches toi"),
          ),
          OutlinedButton(
            onPressed: () {
              debugPrint("Bah oui ===");
            },
            child: const Text("Tu marches toi"),
          ),
          Row(children: const [
            Icon(
              Icons.local_fire_department,
            ),
            Icon(
              Icons.local_fire_department,
            ),
          ]),
        ],
      ),
    );
  }
}
