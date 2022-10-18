import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingBarScreen extends StatefulWidget {
  const RatingBarScreen({Key? key}) : super(key: key);

  @override
  State<RatingBarScreen> createState() => _RatingBarScreenState();
}

class _RatingBarScreenState extends State<RatingBarScreen> {
  double halfRating = 0;
  double emojiRating = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          RatingBar.builder(
            initialRating: 0,
            minRating: 1,
            allowHalfRating: false,
            unratedColor: Colors.grey,
            itemCount: 5,
            itemSize: 30,
            itemPadding: EdgeInsets.symmetric(horizontal: 4),
            updateOnDrag: true,
            // =========================== STARS RATING BAR ==========================
            // itemBuilder: (context, index) => Icon(Icons.star, color: Colors.amber,) ,
            // =========================== EMOJIS RATING BAR ==========================

            itemBuilder: (context, index) {
              switch (index) {
                case 0:
                  return Icon(
                    Icons.sentiment_very_dissatisfied,
                    color: emojiRating == 1 ? Colors.red : Colors.grey,
                  );
                case 1:
                  return Icon(
                    Icons.sentiment_dissatisfied,
                    color: emojiRating == 2 ? Colors.redAccent : Colors.grey,
                  );

                case 2:
                  return (Icon(
                    Icons.sentiment_neutral,
                    color: emojiRating == 3 ? Colors.amber : Colors.grey,
                  ));

                case 3:
                  return (Icon(
                    Icons.sentiment_satisfied,
                    color: emojiRating == 4 ? Colors.lightGreen : Colors.grey,
                  ));

                case 4:
                  return (Icon(
                    Icons.sentiment_very_satisfied,
                    color: emojiRating == 5
                        ? Colors.lightGreenAccent
                        : Colors.grey,
                  ));
                default:
                  return Container();
              }
            },
            onRatingUpdate: (ratingValue) {
              debugPrint("Note sur 5 =>  $emojiRating");
              setState(() {
                emojiRating = ratingValue;
              });
            },
          ),
          // ========== STARS RATING TEXT ==============
          // Text("Rating: $emojiRating"),
          //
          // ======== EMOJI RATING TEXT ===========
          Text(emojiRating == 1 ? "MAUVAIS" :
          emojiRating == 2 ? "PASSABLE" :
          emojiRating == 3 ? "OKAY" :
          emojiRating == 4 ? "BIEN" :
          emojiRating == 5 ? "MASTERPIECE":
          "",
          style: const TextStyle(fontWeight: FontWeight.w300, fontSize: 17),),
        ],
      ),
    );
  }
}
