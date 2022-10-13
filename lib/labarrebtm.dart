import 'package:elysia/dishes_page.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class NavBarBottom extends StatefulWidget {
  const NavBarBottom({Key? key}) : super(key: key);

  @override
  State<NavBarBottom> createState() => _NavBarBottomState();
}

class _NavBarBottomState extends State<NavBarBottom> {
  @override
  Widget build(BuildContext context) {
    // index de la route
    int current_index = 0;

    return Container(
      color: Colors.pink,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
        child: GNav(

          iconSize: 30,
          // espacement entre l'icon et le label
          gap: 7,
          backgroundColor: Colors.pink,
          // les liens actifs
          activeColor: Colors.black,
          tabBackgroundColor: Colors.pinkAccent,
          // espacement par rapport au container
          padding: EdgeInsets.all(7),

          tabs: const [
            GButton(
              icon: Icons.local_pizza_outlined,
              text: "Pizza",
            ),
            GButton(
              icon: Icons.home,
              text: "Home",
            ),
            GButton(
              icon: Icons.favorite_border,
              text: "Likes",
            ),
            GButton(
              icon: Icons.settings,
              text: "Settings",
            ),
          ],
          selectedIndex: current_index,
          onTabChange: (index) {
            setState(() {
               current_index = index;

               print("route numéro ===== ${index} ");
            });
          },

        ),
      ),
    );
  }
}
