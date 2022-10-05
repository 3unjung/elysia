import 'package:elysia/home_page.dart';
import 'package:flutter/material.dart';

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
      theme: ThemeData(
        primarySwatch: Colors.pink
      ),
      home: const RootPage(),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // centre les élements à l'interieur de la barre
        title: const Center(child: Text("Elysia ")),

      ),
      body: const HomePage(),

      floatingActionButton: FloatingActionButton(onPressed: (){
        // output text
        debugPrint("test success Floating Action Button");
      },
      child: Icon(Icons.add)
      ),
      bottomNavigationBar: NavigationBar(
        destinations: [
          NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.person), label: 'Profile'),
        ],
        onDestinationSelected: (int index){
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

