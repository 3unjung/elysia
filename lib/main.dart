// import 'package:elysia/screen/settings/profile.dart';
import 'package:flutter/material.dart';
import 'package:elysia/screen/dish/dishes.dart';
// import 'screen/dish/fullscreen_dish.dart';

void main() {
  runApp(const MyApp());
}

// créer une page static
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // retire le logo debug
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.pink),
      home: const DishesPage(),

    );
  }
}


