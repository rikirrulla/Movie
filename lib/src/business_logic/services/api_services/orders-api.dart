import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movie/src/business_logic/models/orders.dart';
import 'api.dart';


void getOrders() async {
  final response = await http.get(Api.urlPrefix + "orders.php");

  var datauser = jsonDecode(response.body);
  print(datauser);
  orders.clear();
  for (var sName in datauser) {
    Orders order = new Orders(
      id: sName["id"],
      user: sName["user"],
      movie: sName["movie"],
      cinema: sName["cinema_name"],
      seat: sName["seat"],
      time: sName["time"],
      order: sName["order"],
      price: sName["price"],
      code: sName["code"],
    );
    orders.add(order);
  }

}
