import 'package:elysia/elysia_archive_page.dart';
import 'package:flutter/material.dart';
import 'dishes_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  bool isSwitch = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // isSwitch ? Image.asset("assets/images/elysia.gif"),
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
                    "femme extrêment belle et attirante, avec un côté séducteur qu'elle met souvent à profit.",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                )),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: isSwitch ? Colors.pink : Colors.lightBlueAccent),
              onPressed: () {
                debugPrint("Bah oui !");
               Navigator.push(
                 context,
                 MaterialPageRoute(builder: (context) => const DishesPage())
               );
              },
              child: const Text("J'ai faim !"),

            ),
            OutlinedButton(
              onPressed: () {
                debugPrint("Bah oui ===");
              },
              child: const Text("Tu marches toi"),
            ),
            GestureDetector(
              onTap: () {
                debugPrint("Gesture detected :o");
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                Icon(
                  Icons.local_fire_department,
                  color: Colors.lime
                ),
                Text("Texte du milieu"),
                Icon(
                  Icons.local_fire_department,
                  color: Colors.limeAccent
                ),
              ]),
            ),
            Switch(
                value: isSwitch,
                onChanged: (bool newBool) {
                  debugPrint(newBool ? "yes" : "no");
                  setState(() {
                    isSwitch = newBool;
                  });
            }),
            Image.network("https://static.wikia.nocookie.net/hoducks/images/4/42/Miss_Pink_Elf.png/revision/latest?cb=20211030041925"),
            Image.network("https://64.media.tumblr.com/4bea23908c8f9087bbd0e2a6e696d907/1301ab6b9e4d2848-5c/s500x750/2d466a45be54e01086190d0219caafcad6ae35c9.pnj"),
          ],
        ),
      ),
    );
  }
}


