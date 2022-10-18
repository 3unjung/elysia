import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

// ================= bannière =========================
import 'package:banner_carousel/banner_carousel.dart';

import 'package:elysia/screen/dish/fullscreen_dish.dart';

// import 'package:flutter_carousel_slider/carousel_slider.dart' as csb;
// import 'package:flutter_carousel_slider/carousel_slider_indicators.dart';
// import 'package:flutter_carousel_slider/carousel_slider_transforms.dart';

final List<Image> items = [
  Image.network(
      "https://assets.tmecosys.com/image/upload/t_web767x639/img/recipe/ras/Assets/71FE616B-9C5C-4057-B373-E8431DF6FA4F/Derivates/2F80BC16-7C2D-47FD-8C35-2FD00FDD928B.jpg"),
  Image.network(
      "https://www.foodette.fr/files/products/pizza-basque-espagnole-manchego-chorizo-sauce-piquante-piment-espelette-bis-721x524.JPG"),
  Image.network(
      "https://cdn.chefclub.tools/uploads/recipes/cover-thumbnail/f287b191-dc8e-4c85-bbb6-e26387c354d3.jpg"),
  Image.network(
      "https://hips.hearstapps.com/ame-prod-goodhousekeeping-assets.s3.amazonaws.com/main/embedded/46609/gettyimages-475200404.jpg?crop=1xw:1.0xh;center,top&resize=480:*"),
  Image.network(
      "https://abonne.lescommis.com/media/abonnements/recettes/Filet_mignon_de_porc_au_miel.jpg"),
];

final List<String> fdp = [
  "assets/images/gratin.jpg",
  "assets/images/pizzachorizo.jpg",
  "assets/images/barbecue.jpg",
  "assets/images/filletmignon.jpg",
  "assets/images/cury.jpg",
];

final List<BannerModel> banners = [
  BannerModel(
      imagePath:
          "https://assets.tmecosys.com/image/upload/t_web767x639/img/recipe/ras/Assets/71FE616B-9C5C-4057-B373-E8431DF6FA4F/Derivates/2F80BC16-7C2D-47FD-8C35-2FD00FDD928B.jpg",
      id: '1'),
  BannerModel(
      imagePath:
          "https://www.foodette.fr/files/products/pizza-basque-espagnole-manchego-chorizo-sauce-piquante-piment-espelette-bis-721x524.JPG",
      id: '2'),
  BannerModel(
      imagePath:
          "https://cdn.chefclub.tools/uploads/recipes/cover-thumbnail/f287b191-dc8e-4c85-bbb6-e26387c354d3.jpg",
      id: '3'),
  BannerModel(
      imagePath:
          "https://hips.hearstapps.com/ame-prod-goodhousekeeping-assets.s3.amazonaws.com/main/embedded/46609/gettyimages-475200404.jpg?crop=1xw:1.0xh;center,top&resize=480:*",
      id: '4'),
  BannerModel(
      imagePath:
          "https://abonne.lescommis.com/media/abonnements/recettes/Filet_mignon_de_porc_au_miel.jpg",
      id: '5'),
];

class Carrousel extends StatefulWidget {
  const Carrousel({Key? key}) : super(key: key);

  @override
  State<Carrousel> createState() => _CarrouselState();
}

class _CarrouselState extends State<Carrousel> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Container(
        //   child: CarouselSlider(
        //     items: items,
        //     options: CarouselOptions(
        //       height: 400,
        //       enlargeCenterPage: true,
        //       // agrandie l'image
        //       autoPlay: true,
        //       autoPlayInterval: const Duration(seconds: 2),
        //       autoPlayAnimationDuration: const Duration(microseconds: 500),
        //       autoPlayCurve: Curves.easeInOutQuart,
        //       viewportFraction: 0.9,
        //       aspectRatio: 2.0,
        //       initialPage: 0,
        //       enableInfiniteScroll: true,
        //       // active le scroll infini
        //       scrollDirection: Axis.horizontal,
        //     ),
        //   ),
        // ),
        BannerCarousel(
          banners: banners,

          // width: 300,
          height: 200,
          borderRadius: 15,
          viewportFraction: 0.75,
          // affiche les images juxtaposées
          spaceBetween: 15,
          activeColor: bonbon,
          disableColor: Colors.pinkAccent,
          animation: true,
          indicatorBottom: false,
          // affiche la pagination dans l'image et non en dessous
          customizedIndicators: const IndicatorModel.animation(
              width: 20, height: 5, spaceBetween: 2, widthAnimation: 35),
        ),
      ],
    );
  }
}
