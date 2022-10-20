import 'package:elysia/partials/btm_navbar.dart';
import 'package:elysia/partials/top_appbar.dart';
import 'package:elysia/screen/dish/modal.dart';
import 'package:elysia/screen/dish/rating_stars.dart';
import 'package:elysia/screen/dish/carrousel.dart';
import 'custome_image.dart';

import 'package:flutter/material.dart';

// hex color
const bonbon = Color(0xffFFEAF1);

class FullScreen extends StatefulWidget {
  final String duTexte;
  final Map dishData;

  const FullScreen({Key? key, required this.duTexte, required this.dishData})
      : super(key: key);

  @override
  State<FullScreen> createState() => _FullScreenState();
}

class _FullScreenState extends State<FullScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TheAppBar(),
      bottomNavigationBar: const NavBarBottom(),
      body: SingleChildScrollView(
        child: Container(
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
                child: Center(
                  child: Text(
                    "${widget.dishData['name']}",
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              //
              // Container(
              //     padding: const EdgeInsets.only(top: 15, bottom: 15),
              //     child: Image.asset(
              //       widget.dishData["image"],
              //     )),

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
                              left: BorderSide(
                                  width: 7, color: Colors.pinkAccent),
                            )),
                        child: const Text("plus petit que trois"),
                      ),
                    ],
                  )),

              const SizedBox(height: 25),

              Center(
                child: Text(
                  widget.dishData["message"],
                  style: const TextStyle(fontSize: 25),
                ),
              ),
              const SizedBox(
                height: 100,
              ),

              Column(
                children: const [
                  Text(
                    "Les plus appréciés",
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  // Carrousel(),
                  CustomeImage(
                      image: 'https://img.cuisineaz.com/660x660/2016/05/13/i71494-pizza-au-chorizo-poivron-et-tomate-a-ma-facon.jpg'),

                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
