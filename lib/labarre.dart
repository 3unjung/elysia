import 'package:flutter/material.dart';

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