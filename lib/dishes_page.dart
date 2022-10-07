import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_fonts/google_fonts.dart';

// variable de couleur
const bg_rosa = Color(0xFFfbfbfb);


class DishesPage extends StatelessWidget {
  const DishesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: TheAppBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SearchSection(),
              const DishesSection(),
              Container(
                height: 350,
                // color: Colors.lightGreenAccent,
              ),
            ],
          ),
        ));
  }
}

class SearchSection extends StatelessWidget {
  const SearchSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime now = new DateTime.now();
    DateTime date =
        new DateTime(now.year, now.month, now.day, now.hour, now.minute);

    return Container(
      color: Colors.grey[200],
      // espacement left, top, right, bottom
      padding: const EdgeInsets.fromLTRB(10, 30, 10, 15),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                // container de la barre de recherche
                child: Container(
                  // décale le input de 10px de la gauche
                  padding: const EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      // border radius avec un rayon de 20px
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          // rayon de l'ombre
                          blurRadius: 10,
                          offset: Offset(0, 3),
                        ),
                      ]),
                  width: 50,
                  height: 50,
                  // color: Colors.tealAccent,
                  child: const TextField(
                    decoration: InputDecoration(
                      // placeholder
                      hintText: 'Gratin de pattes au jambon',
                      contentPadding: EdgeInsets.all(10),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              // largeur de 10px entre les containers
              const SizedBox(
                width: 10,
              ),
              // container de la loupe
              Container(
                height: 50,
                width: 50,
                decoration: const BoxDecoration(
                  color: Colors.deepPurpleAccent,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      // rayon de l'ombre
                      blurRadius: 10,
                      offset: Offset(0, 4),
                    ),
                  ],
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                ),
                child: ElevatedButton(
                  onPressed: () {},
                  // si valeur sur null ça bloquera le bouton
                  child: Icon(
                    Icons.search,
                    size: 30,
                  ),

                  style: ElevatedButton.styleFrom(
                    // mise en forme du container de la loupe
                    shape: CircleBorder(),
                    backgroundColor: Colors.lightBlueAccent,
                    padding: EdgeInsets.all(10),
                  ),
                ),
              ),
            ],
          ),
          // container temps réel
          // SizedBox(
          //   height: 50,
          // ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                margin: EdgeInsets.all(10),
                child: Column(
                  // aligne au début du container le texte
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Date d'aujourd'hui",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "${date.day}/${date.month}/${date.year}",
                      style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: Column(
                  children: [
                    Text(
                      "Heure Actuelle - Paris",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(height: 5),

                    Text(
                      "${date.hour}:${date.minute}",
                      style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class DishesSection extends StatelessWidget {
  const DishesSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      color: Colors.grey[200],
      child: Column(
        children: [
          Container(
            color: Colors.pink,
            height: 50,
          ),
          Container(
            color: Colors.lime,
            height: 1000,
          )
        ],
      ),
    );
  }
}

// permet d'utiliser des méthodes plus avancées pour notre navbar
class TheAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(50);

  // return notre navbar
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Center(
        child: Text(
          "Les plats d'Elysia",
          style: TextStyle(fontWeight: FontWeight.w900),
        ),
      ),
      actions: const [
        IconButton(
            icon: Icon(Icons.favorite_outline_rounded),
            color: Colors.lightBlueAccent,
            onPressed: null),
        IconButton(
            icon: Icon(Icons.place),
            color: Colors.lightBlueAccent,
            onPressed: null),
      ],
    );
  }
}
