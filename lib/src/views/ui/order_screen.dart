import 'package:flutter/material.dart';
import 'package:movie/src/business_logic/models/movie.dart';
import 'package:movie/src/business_logic/models/orders.dart';
import 'package:movie/src/business_logic/utils/constants.dart';
import 'package:movie/src/views/ui/home_screen.dart';
import 'package:movie/src/views/ui/order_screen2.dart';
import 'package:movie/src/views/utils/order_page.dart';

class OrderScreen extends StatefulWidget {
  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        elevation: 1,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: kPrimaryColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.refresh,
              color: kPrimaryColor,
            ),
            onPressed: () {
              setState(() {});
            },
          ),
        ],
      ),
      body: Container(
        color: kBackgroundColor,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: ListView.builder(
            itemCount: orders.length,
            itemBuilder: (BuildContext ctxt, int index) {
              return OrderPage(
                order: orders[index],
                press: () {
                  print(index);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => OrderScreen2(order:orders[index])));
                },
              );
            }),
      ),
    );
  }
}
