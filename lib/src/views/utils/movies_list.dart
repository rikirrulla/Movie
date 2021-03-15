import 'package:flutter/material.dart';
import 'package:movie/src/business_logic/models/movie.dart';
import 'package:movie/src/business_logic/utils/constants.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class MovieList extends StatelessWidget {
  final Movie movie;
  final Function press;

  const MovieList({
    Key key,
    this.movie,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        color: kBackgroundColor,
        margin: EdgeInsets.only(top: 5, bottom: 5,left: 20,right: 20),
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Container(
                  height: 70,
                  child: Image.asset(movie.image.isNotEmpty ? movie.image : 'assets/movies//error.png',),
                ),
              ),
              Container(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "${movie.title}",
                        style: TextStyle(
                          color: Color(0XFF174757),
                          fontSize: 18,
                          fontWeight: FontWeight.w500
                        ),
                      ),
                      SizedBox(height: 5,),
                      RatingBar.builder(
                        initialRating: movie.rating.isNotEmpty ? double.parse(movie.rating) / 2 : 0,
                        minRating: 1,
                        maxRating: 5,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemPadding: EdgeInsets.symmetric(horizontal: 0.0),
                        itemSize: 17,
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (double value) {},
                      ),
                      SizedBox(height: 5,),
                      Text(
                        "${movie.category}",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ),
            ]),
      ),
    );
  }
}
