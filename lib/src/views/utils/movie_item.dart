import 'package:flutter/material.dart';
import 'package:movie/src/business_logic/models/movie.dart';
import 'package:movie/src/business_logic/utils/constants.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:movie/src/views/utils/title_and_type.dart';

class MovieItem extends StatelessWidget {
  MovieItem(this.movie);

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    String time = movie.date.substring(10, 16);

    return Container(
      height: MediaQuery
          .of(context)
          .size
          .height,
      child: Stack(children: <Widget>[
        Container(
          height: 570,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(movie.image), fit: BoxFit.fitWidth),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.horizontal(
                  right: Radius.circular(25),
                  left: Radius.circular(25),
                ),
                child: Container(
                  color: Colors.white,
                  height: 300.0,
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  child: Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Column(
                          children: [
                            Text(
                              movie.title,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 25,
                                  fontFamily: fontSemi,
                                  fontWeight: FontWeight.bold),
                            ),
                            RatingBar.builder(
                              initialRating: 4,
                              minRating: 1,
                              maxRating: 5,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemPadding:
                              EdgeInsets.symmetric(horizontal: 0.0),
                              itemSize: 23,
                              itemBuilder: (context, _) =>
                                  Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                              onRatingUpdate: (double value) {},
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            TitleAndType(
                              title: movie.category,
                              type: 'tipi',
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            TitleAndType(
                              title: movie.director,
                              type: 'Direktori',
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            TitleAndType(
                              title: time,
                              type: 'Ora',
                            ),
                            SizedBox(
                              width: 30.0,
                            ),
                            TitleAndType(
                              title: movie.rating.toString(),
                              type: 'Vlersimi',
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
