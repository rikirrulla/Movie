import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movie/src/business_logic/models/seats.dart';

import 'api.dart';

void getSeats() async {
  final response = await http.get(Api.urlPrefix + "seats.php");

  var datauser = jsonDecode(response.body);

  seatsList.clear();
  for (var sName in datauser) {
    Seats seats = new Seats(
      id: sName["id"],
      movieId: sName["movieId"],
      seat1: sName["seat1"],
      seat2: sName["seat2"],
      seat3: sName["seat3"],
      seat4: sName["seat4"],
      seat5: sName["seat5"],
      seat6: sName["seat6"],
      seat7: sName["seat7"],
      seat8: sName["seat8"],
      seat9: sName["seat9"],
      seat10: sName["seat10"],
      seat11: sName["seat11"],
      seat12: sName["seat12"],
      seat13: sName["seat13"],
      seat14: sName["seat14"],
      seat15: sName["seat15"],
      seat16: sName["seat16"],
      seat17: sName["seat17"],
      seat18: sName["seat18"],
      seat20: sName["seat29"],
      seat22: sName["seat20"],
      seat23: sName["seat21"],
      seat24: sName["seat22"],
      seat25: sName["seat23"],
      seat26: sName["seat24"],
      seat27: sName["seat25"],
      seat28: sName["seat26"],
      seat29: sName["seat27"],
      seat30: sName["seat28"],
      seat31: sName["seat29"],
      seat32: sName["seat30"],
      seat33: sName["seat31"],
      seat34: sName["seat32"],
      seat35: sName["seat33"],
      seat36: sName["seat34"],
      seat37: sName["seat35"],
      seat38: sName["seat36"],
      seat39: sName["seat37"],
      seat40: sName["seat38"],
      seat41: sName["seat39"],
      seat42: sName["seat40"],
      seat43: sName["seat41"],
      seat44: sName["seat42"],
    );
    seatsList.add(seats);
  }
}
