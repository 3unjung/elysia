import 'package:elysia/partials/btm_navbar.dart';
import 'package:elysia/partials/top_appbar.dart';
import 'package:elysia/screen/dish/dishes.dart';

// import 'package:elysia/screen/dish/dishes.dart';
import 'package:flutter/material.dart';

// hexa color
const silver = Color(0xffFBFBFB);

class DishesScreen extends StatefulWidget {
  const DishesScreen({Key? key}) : super(key: key);

  @override
  State<DishesScreen> createState() => _DishesScreenState();
}

class _DishesScreenState extends State<DishesScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: TheAppBar(),
      bottomNavigationBar: NavBarBottom(),
      body: SingleChildScrollView(
        child: FullScreen(),
      ),
    );
  }
}

class FullScreen extends StatefulWidget {
  const FullScreen({Key? key}) : super(key: key);

  @override
  State<FullScreen> createState() => _FullScreenState();
}

class _FullScreenState extends State<FullScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      // 10px à chaque padding
      padding: const EdgeInsets.all(10),

      child: Column(
        children: [
          // titre du plat
          Container(
            padding: const EdgeInsets.all(15),
            decoration: const BoxDecoration(
              color: silver,
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

          // rangée de container sous l'image
          Container(
            decoration: const BoxDecoration(
                color: silver,
                border: Border(
                left: BorderSide(width: 7, color: Colors.pinkAccent),
              )

            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // row rate up
                Row(
                  children: const [
                    Icon(
                      Icons.star_border,
                      color: Colors.yellowAccent,
                    ),
                    Icon(Icons.star_border),
                    Icon(Icons.star_border),
                    Icon(Icons.star_border),
                    Icon(Icons.star_border)
                  ],
                ),

                // container canvas
                Container(
                  height: 50,
                  decoration: const BoxDecoration(
                      border: Border(
                        left: BorderSide(width: 7, color: Colors.pinkAccent),
                      )
                  ),
                  child: const Text("Futur Canvas ici"),
                ),
              ],
            )
          )
        ],
      ),
    );
  }
}
