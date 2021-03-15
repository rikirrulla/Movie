import 'package:flutter/material.dart';
import 'package:movie/src/business_logic/models/movie.dart';
import 'package:movie/src/business_logic/utils/constants.dart';
import 'package:movie/src/views/ui/home_screen.dart';
import 'package:movie/src/views/utils/title_and_type.dart';
import 'package:barcode_widget/barcode_widget.dart';

class TicketScreen extends StatelessWidget {

  TicketScreen({
    this.time,
    this.seatsString,
    this.index,
    this.order,
    this.name,
    this.movie});

  final String time;
  final String seatsString;
  final String order;
  final String name;
  final int index;
  final Movie movie;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30, bottom: 0, top: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 40,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => HomeScreen()));
                  },
                  child: Image.asset(
                    'assets/images/back.png',
                    fit: BoxFit.cover,
                    width: 30.0,
                    height: 30.0,
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
                Text(
                  'Bileta',
                  style: TextStyle(
                      fontSize: 20,
                      color: kWhiteColor,
                      fontFamily: fontSemi,
                      fontWeight: FontWeight.w900),
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Container(
                color: Colors.white,
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                height: 620,
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Filmi : ' + movie.title,
                        style: TextStyle(
                            fontSize: 16,
                            fontFamily: fontSemi,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 35,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TitleAndType(
                            title: time ,
                            type: 'Koha',
                          ),
                          TitleAndType(
                            title: seatsString,
                            type: 'Karrige',
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 35,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TitleAndType(
                            title: movie.cinemaName,
                            type: 'Kinema',
                          ),
                          TitleAndType(
                            title: order,
                            type: 'Nr blerjes',
                          ),
                        ],
                      ),
                      SizedBox(height: 40,),
                      SizedBox(
                        height:2,
                        child: Container(color: Colors.black,),
                      ),
                      SizedBox(height: 40,),
                      BarcodeWidget(
                        barcode: Barcode.code128(),
                        data: order.hashCode.toString()+seatsString.hashCode.toString(),
                        style: TextStyle(fontFamily: fontSemi),
                        height: 100,
                      ),
                      SizedBox(height: 20,),
                      SizedBox(
                        height:2,
                        child: Container(color: Colors.black,),
                      ),
                      SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              TitleAndType(
                                title: name,
                                type: 'Emri plote',
                              ),
                              SizedBox(height: 20,),
                              TitleAndType(
                                title: movie.price,
                                type: 'Qmimi',
                              ),
                            ],
                          ),
                          BarcodeWidget(
                            barcode: Barcode.qrCode(),
                            width: 90,
                            data: order.hashCode.toString()+seatsString.hashCode.toString(),
                            style: TextStyle(fontFamily: fontSemi),
                            height: 100,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),)
      ,
    );
  }
}
