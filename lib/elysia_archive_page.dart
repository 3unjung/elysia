import 'package:flutter/material.dart';

class ArchiveELysiaPage extends StatefulWidget {
  const ArchiveELysiaPage({Key? key}) : super(key: key);

  @override
  State<ArchiveELysiaPage> createState() => _ArchiveElysiaPageState();
}

class _ArchiveElysiaPageState extends State<ArchiveELysiaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      title: const Text("Les archives de Elysia"),
      // si false désactive la fleche de retour
      automaticallyImplyLeading: false,
      leading: IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: const Icon(Icons.arrow_back_ios),
      ),
    ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/images/elysia_maku.jpg"),
                const Text("Elysia se prépare avant de nous attendre sur l'Hyperion ",
                style: TextStyle(
                  fontSize: 30,
                  fontFamily: 'Poppins',
                )
                ),
              ],

            )



    );
  }
}
