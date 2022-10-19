import 'package:elysia/partials/btm_navbar.dart';
import 'package:elysia/partials/top_appbar.dart';
import 'package:elysia/screen/dish/dishes.dart';
import 'package:elysia/screen/dish/rating_stars.dart';
import 'package:elysia/screen/dish/carrousel.dart';
import 'dishes.dart';

// import 'package:elysia/screen/dish/dishes.dart';
import 'package:flutter/material.dart';

// hex color
const bonbon = Color(0xffFFEAF1);

class DishesScreen extends StatefulWidget {
  final String duTexte;

  const DishesScreen({Key? key, required this.duTexte}) : super(key: key);

  @override
  State<DishesScreen> createState() => _DishesScreenState();
}

class _DishesScreenState extends State<DishesScreen> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: TheAppBar(),
      bottomNavigationBar: NavBarBottom(),
      body: SingleChildScrollView(
        child: FullScreen(duTexte: widget.duTexte),
      ),
    );
  }
}

class FullScreen extends StatefulWidget {

  final String duTexte;

  const FullScreen({Key? key, required this.duTexte}) : super(key: key);

  @override
  State<FullScreen> createState() => _FullScreenState();
}

class _FullScreenState extends State<FullScreen> {
  @override
  Widget build(BuildContext context) {

    return Container(
      // color: Colors.grey[200],
      // 10px à chaque padding
      padding: const EdgeInsets.all(10),

      child: Column(
        children: [
          // titre du plat
          Container(
            padding: const EdgeInsets.all(15),
            decoration: const BoxDecoration(
              // color: bonbon,
              border: Border(
                left: BorderSide(width: 7, color: Colors.pinkAccent),
              ),
            ),
            child: const Center(
              child: Text(
                "Elysia Special Dish chorizo",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
          ),


          Container(
            padding: const EdgeInsets.only(top: 15, bottom: 15),
            child: Image.network(
                "https://i.pinimg.com/736x/e6/aa/49/e6aa4972eb0adb6e228ae579fe6a25c1.jpg"),
          ),

          // containers sous l'image
          Container(
              decoration: const BoxDecoration(
                  border: Border(
                left: BorderSide(width: 7, color: Colors.pinkAccent),
              )),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // row rate up
                  Container(
                    alignment: Alignment.center,
                    child: const RatingBarScreen(),
                  ),
                  // container canvas
                  Container(
                    height: 50,
                    decoration: const BoxDecoration(
                        color: Colors.orange,
                        border: Border(
                          left: BorderSide(width: 7, color: Colors.pinkAccent),
                        )),
                    child: const Text("JSP"),
                  ),
                ],
              )),

          const SizedBox(height: 25),
          const Carrousel(),
        ],
      ),
    );
  }
}
