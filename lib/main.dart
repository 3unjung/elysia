import 'package:elysia/home_page.dart';
import 'package:elysia/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:elysia/dishes_page.dart';

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
      home: DishesPage(),
    );
  }
}

// Créer une page interative
class RootPage extends StatefulWidget {
  const RootPage({Key? key}) : super(key: key);

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int currentPage = 0;
  List<Widget> pages = const [
    HomePage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // centre les élements à l'interieur de la barre
        title: const Center(child: Text("Elysia ")),
      ),
      body: pages[currentPage],
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            // output text
            debugPrint("test success Floating Action Button");
          },
          child: const Icon(Icons.add)),
      bottomNavigationBar: NavigationBar(
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.local_pizza), label: 'Pizza'),
        ],

        onDestinationSelected: (int index) {
          // setState() rend la page static, interactive
          setState(() {
            currentPage = index;
          });

        },
        selectedIndex: currentPage,
      ),
    );
  }
}
