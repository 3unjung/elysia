import 'package:elysia/partials/top_appbar.dart';
import 'package:flutter/material.dart';

class DishesScreen extends StatefulWidget {
  const DishesScreen({Key? key}) : super(key: key);

  @override
  State<DishesScreen> createState() => _DishesScreenState();
}

class _DishesScreenState extends State<DishesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TheAppBar(),
      body: Column(
        children: const [
          Text("hummmmm"),
        ],
      ),

    );
  }
}
