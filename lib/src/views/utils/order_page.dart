import 'package:flutter/material.dart';
import 'package:movie/src/business_logic/models/orders.dart';
import 'package:movie/src/business_logic/utils/constants.dart';

class OrderPage extends StatelessWidget {
  final Orders order;
  final Function press;

  const OrderPage({
    Key key,
    this.order,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Container(
        color: kBackgroundColor2,
        margin: EdgeInsets.only(top: 10, bottom: 10),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                height: 50,
                child: Image.asset('assets/images/orders.png'),
              ),
              Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text(
                        "${order.movie}",
                        style: TextStyle(
                          color: Color(0XFF174757),
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        "${order.order}",
                        style: TextStyle(color: Colors.grey),
                      ),
                      Text(
                        "${order.time}",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  )),
              Container(
                  child: Row(
                    children: <Widget>[
                      Column(children: [
                        Text(
                          "${order.price}  €",
                          style: TextStyle(
                            color: Color(0XFF174757),
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          "${order.cinema}",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ]),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 15,
                        color: Colors.grey,
                      )
                    ],
                  ))
            ]),
      ),
    );
  }
}
