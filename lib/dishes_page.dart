import 'package:flutter/material.dart';

// variable de couleur
const bg_rosa = Color(0xFFfbfbfb);

class DishesPage extends StatelessWidget {
  const DishesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // contenu sur tous les screens
    return Scaffold(
      appBar: TheAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SearchSection(),
            DishesSection(),
          ],
        ),
      ),
    );
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
                      "Heure Actuelle",
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
          ),
        ],
      ),
    );
  }
}

class DishesSection extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return DishesSectionState();
  }
}

class DishesSectionState extends State<DishesSection> {
  final List dishesList = [
    // déclaration des maps
    {
      'name': 'exemple simple',
      'duration': "15",
      'image': 'assets/images/elysia_maku.jpg',
      'message':
          "Vice Capitaine des Chasseurs de flammes. Elle est la première à s'être présentée à Raiden Mei."
    },

    {
      'name': 'exemple encore très simple',
      'duration': "15",
      'image': 'assets/images/ely.jpg',
      'message':
          "Comme vous pouvez le voir, cette fille aussi jolie et douce qu'une fleur est le second de Kevin"
    },

    {
      'name': 'alors là encore plus simple',
      'duration': "15",
      'image': 'assets/images/nillou_vibes.jpg',
      'message':
          "Une fille insouciante et désinhibée qui n'a rien d'un commandant en second."
    },
  ];

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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Nom du plat",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                Text(
                  " Durée mn/mn ",
                  style: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 5),
                IconButton(
                  icon: Icon(Icons.favorite_outline_rounded),
                  color: Colors.white,
                  onPressed: () {},
                ),
              ],
            ),
          ),

          // liste des plats
          Column(
            children: dishesList.map((dishData) {
              // Retourne les plats
              // return DishesCard(dishes);
              String dishName = dishData["name"];
              return Dismissible(
                key: Key(dishName), child: DishesCard(dishData),
                onDismissed: (direction) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("${dishName} supprimé")));
                },
                background: Container(color: Colors.white,),
              );
            }).toList(),
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

class DishesCard extends StatefulWidget {
  final Map dishesData;

  const DishesCard(this.dishesData, {super.key});

  @override
  State<DishesCard> createState() => DishesCardState();
}

class DishesCardState extends State<DishesCard> {
  bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      height: 230,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(18)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            spreadRadius: 4,
            blurRadius: 6,
            offset: Offset(0, 3),
          )
        ],
      ),
      // colonne de l'image
      child: Column(children: [
        Container(
          height: 140,
          decoration: BoxDecoration(
            // color: Colors.lightGreen,
            image: DecorationImage(
              image: AssetImage(widget.dishesData['image']),
              // étends l'image sur tout l'espace disponible
              fit: BoxFit.cover,
            ),
            // radius sur le côté droit et gauche
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(18),
              topRight: Radius.circular(18),
            ),
          ),
          // superpose un bouton sur l'image
          child: Stack(
            children: [
              Positioned(
                top: 5,
                right: -15,
                // bouton like
                child: MaterialButton(
                  color: Colors.white,
                  // mise en forme du bouton
                  shape: CircleBorder(),
                  onPressed: () {
                    debugPrint("You touches my Tralala");
                    setState(() {
                      debugPrint(isLiked ? "true" : "false");
                      isLiked = !isLiked;
                    });
                  },

                  child: Icon(
                    (isLiked == false)
                        ? Icons.favorite
                        : Icons.favorite_outline_rounded,
                    color: Colors.pinkAccent,
                    size: 30,
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.dishesData["name"],
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                ),
              ),
              Text(
                widget.dishesData["duration"] + "minutes",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  widget.dishesData["message"],
                  maxLines: 1,
                  style: TextStyle(
                    fontSize: 16, color: Colors.grey,
                    // ellipsis = ...
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              )
            ],
          ),
        ),
      ]),
    );
  }
}

