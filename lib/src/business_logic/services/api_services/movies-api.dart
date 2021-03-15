import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movie/src/business_logic/models/movie.dart';

import 'api.dart';

void getMovies() async {
  final response = await http.get(Api.urlPrefix + "movies.php");

  var datauser = jsonDecode(response.body);

  movies.clear();
  for (var sName in datauser) {
    Movie movie = new Movie(
      id: sName["id"],
      seatsId: sName["seatsId"],
      cinemaName: sName["cinema"],
      title: sName["title"],
      image: sName["image"],
      director: sName["director"],
      rating: sName["rating"],
      category: sName["category"],
      date: sName["date"],
      price: sName["price"],
      registerAt: sName["registerAt"],
      updateAt: sName["updateAt"],
    );
    movies.add(movie);
  }
}
