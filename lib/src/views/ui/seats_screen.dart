import 'package:flutter/material.dart';
import 'package:movie/src/business_logic/models/movie.dart';
import 'package:movie/src/business_logic/services/api_services/api.dart';
import 'package:movie/src/business_logic/utils/constants.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:movie/src/views/ui/ticket_screen.dart';
import 'package:movie/src/views/utils/title_and_type.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class SeatsScreen extends StatefulWidget {
  SeatsScreen(this.movie);

  final Movie movie;

  @override
  _SeatsScreenState createState() => _SeatsScreenState();
}



class _SeatsScreenState extends State<SeatsScreen> {
  List<bool> boolSeats = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ];

  String price;
  String seatsString = '0';
  String priceString = '0';
  String name;
  int count = 0;
  int index = -1;

  @override
  Widget build(BuildContext context) {
    String time = widget.movie.date.substring(10, 16);
    String date = widget.movie.date.substring(5, 10);
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Padding(
        padding: const EdgeInsets.only(left: 0, right: 0, bottom: 0, top: 50),
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                 children: [
                   SizedBox(width: 20,),
                   GestureDetector(
                     onTap: () {
                       Navigator.pop(context);
                     },
                     child: Image.asset(
                       'assets/images/back.png',
                       fit: BoxFit.cover,
                       width: 30.0,
                       height: 30.0,
                     ),
                   ),
                   SizedBox(width: 20,),
                   Text(
                     'Zgjedhe karrigen',
                     style: TextStyle(
                         fontSize: 20,
                         color: kWhiteColor,
                         fontFamily: fontSemi,
                         fontWeight: FontWeight.w600),
                   ),
                 ],
                ),
                Padding(
                  padding:
                      EdgeInsets.only(left: 0, right: 0, bottom: 0, top: 20),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Column(
                            children: [
                              Row(
                                children: [
                                  Checkbox(
                                    value: boolSeats[0],
                                    onChanged: (bool value) {
                                      setState(() {
                                        if (value == true) {
                                          check(0);
                                        } else {
                                          uncheck(0);
                                        }
                                      });
                                    },
                                    activeColor: Colors.greenAccent,
                                    checkColor: Colors.grey,
                                    focusColor: Colors.white,
                                  ),
                                  Checkbox(
                                    value: boolSeats[1],
                                    onChanged: (bool value) {
                                      setState(() {
                                        if (value == true) {
                                          check(1);
                                        } else {
                                          uncheck(1);
                                        }
                                      });
                                    },
                                    activeColor: Colors.greenAccent,
                                    checkColor: Colors.grey,
                                    focusColor: Colors.white,
                                  ),
                                  Checkbox(
                                    onChanged: (bool value) {
                                      setState(() {
                                        if (value == true) {
                                          check(2);
                                        } else {
                                          uncheck(2);
                                        }
                                      });
                                    },
                                    value: boolSeats[2],
                                    activeColor: Colors.greenAccent,
                                    checkColor: Colors.grey,
                                    focusColor: Colors.white,
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Checkbox(
                                    onChanged: (bool value) {
                                      setState(() {
                                        if (value == true) {
                                          check(3);
                                        } else {
                                          uncheck(3);
                                        }
                                      });
                                    },
                                    value: boolSeats[3],
                                    activeColor: Colors.greenAccent,
                                    checkColor: Colors.grey,
                                    focusColor: Colors.white,
                                  ),
                                  Checkbox(
                                    onChanged: (bool value) {
                                      setState(() {
                                        if (value == true) {
                                          check(4);
                                        } else {
                                          uncheck(4);
                                        }
                                      });
                                    },
                                    value: boolSeats[4],
                                    activeColor: Colors.greenAccent,
                                    checkColor: Colors.grey,
                                    focusColor: Colors.white,
                                  ),
                                  Checkbox(
                                    onChanged: (bool value) {
                                      setState(() {
                                        if (value == true) {
                                          check(5);
                                        } else {
                                          uncheck(5);
                                        }
                                      });
                                    },
                                    value: boolSeats[5],
                                    activeColor: Colors.greenAccent,
                                    checkColor: Colors.grey,
                                    focusColor: Colors.white,
                                  ),
                                  Checkbox(
                                    onChanged: (bool value) {
                                      setState(() {
                                        if (value == true) {
                                          check(6);
                                        } else {
                                          uncheck(6);
                                        }
                                      });
                                    },
                                    value: boolSeats[6],
                                    activeColor: Colors.greenAccent,
                                    checkColor: Colors.grey,
                                    focusColor: Colors.white,
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Checkbox(
                                    onChanged: (bool value) {
                                      setState(() {
                                        if (value == true) {
                                          check(7);
                                        } else {
                                          uncheck(7);
                                        }
                                      });
                                    },
                                    value: boolSeats[7],
                                    activeColor: Colors.greenAccent,
                                    checkColor: Colors.grey,
                                    focusColor: Colors.white,
                                  ),
                                  Checkbox(
                                    onChanged: (bool value) {
                                      setState(() {
                                        if (value == true) {
                                          check(8);
                                        } else {
                                          uncheck(8);
                                        }
                                      });
                                    },
                                    value: boolSeats[8],
                                    activeColor: Colors.greenAccent,
                                    checkColor: Colors.grey,
                                    focusColor: Colors.white,
                                  ),
                                  Checkbox(
                                    onChanged: (bool value) {
                                      setState(() {
                                        if (value == true) {
                                          check(9);
                                        } else {
                                          uncheck(9);
                                        }
                                      });
                                    },
                                    value: boolSeats[9],
                                    activeColor: Colors.greenAccent,
                                    checkColor: Colors.grey,
                                    focusColor: Colors.white,
                                  ),
                                  Checkbox(
                                    onChanged: (bool value) {
                                      setState(() {
                                        if (value == true) {
                                          check(10);
                                        } else {
                                          uncheck(10);
                                        }
                                      });
                                    },
                                    value: boolSeats[10],
                                    activeColor: Colors.greenAccent,
                                    checkColor: Colors.grey,
                                    focusColor: Colors.white,
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Checkbox(
                                    onChanged: (bool value) {
                                      setState(() {
                                        if (value == true) {
                                          check(11);
                                        } else {
                                          uncheck(11);
                                        }
                                      });
                                    },
                                    value: boolSeats[11],
                                    activeColor: Colors.greenAccent,
                                    checkColor: Colors.grey,
                                    focusColor: Colors.white,
                                  ),
                                  Checkbox(
                                    onChanged: (bool value) {
                                      setState(() {
                                        if (value == true) {
                                          check(12);
                                        } else {
                                          uncheck(12);
                                        }
                                      });
                                    },
                                    value: boolSeats[12],
                                    activeColor: Colors.greenAccent,
                                    checkColor: Colors.grey,
                                    focusColor: Colors.white,
                                  ),
                                  Checkbox(
                                    onChanged: (bool value) {
                                      setState(() {
                                        if (value == true) {
                                          check(13);
                                        } else {
                                          uncheck(13);
                                        }
                                      });
                                    },
                                    value: boolSeats[13],
                                    activeColor: Colors.greenAccent,
                                    checkColor: Colors.grey,
                                    focusColor: Colors.white,
                                  ),
                                  Checkbox(
                                    onChanged: (bool value) {
                                      setState(() {
                                        if (value == true) {
                                          check(14);
                                        } else {
                                          uncheck(14);
                                        }
                                      });
                                    },
                                    value: boolSeats[14],
                                    activeColor: Colors.greenAccent,
                                    checkColor: Colors.grey,
                                    focusColor: Colors.white,
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Checkbox(
                                    onChanged: (bool value) {
                                      setState(() {
                                        if (value == true) {
                                          check(15);
                                        } else {
                                          uncheck(15);
                                        }
                                      });
                                    },
                                    value: boolSeats[15],
                                    activeColor: Colors.greenAccent,
                                    checkColor: Colors.grey,
                                    focusColor: Colors.white,
                                  ),
                                  Checkbox(
                                    onChanged: (bool value) {
                                      setState(() {
                                        if (value == true) {
                                          check(16);
                                        } else {
                                          uncheck(16);
                                        }
                                      });
                                    },
                                    value: boolSeats[16],
                                    activeColor: Colors.greenAccent,
                                    checkColor: Colors.grey,
                                    focusColor: Colors.white,
                                  ),
                                  Checkbox(
                                    onChanged: (bool value) {
                                      setState(() {
                                        if (value == true) {
                                          check(17);
                                        } else {
                                          uncheck(17);
                                        }
                                      });
                                    },
                                    value: boolSeats[17],
                                    activeColor: Colors.greenAccent,
                                    checkColor: Colors.grey,
                                    focusColor: Colors.white,
                                  ),
                                  Checkbox(
                                    onChanged: (bool value) {
                                      setState(() {
                                        if (value == true) {
                                          check(18);
                                        } else {
                                          uncheck(18);
                                        }
                                      });
                                    },
                                    value: boolSeats[18],
                                    activeColor: Colors.greenAccent,
                                    checkColor: Colors.grey,
                                    focusColor: Colors.white,
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Checkbox(
                                    onChanged: (bool value) {
                                      setState(() {
                                        if (value == true) {
                                          check(19);
                                        } else {
                                          uncheck(19);
                                        }
                                      });
                                    },
                                    value: boolSeats[20],
                                    activeColor: Colors.greenAccent,
                                    checkColor: Colors.grey,
                                    focusColor: Colors.white,
                                  ),
                                  Checkbox(
                                    onChanged: (bool value) {
                                      setState(() {
                                        if (value == true) {
                                          check(20);
                                        } else {
                                          uncheck(20);
                                        }
                                      });
                                    },
                                    value: boolSeats[20],
                                    activeColor: Colors.greenAccent,
                                    checkColor: Colors.grey,
                                    focusColor: Colors.white,
                                  ),
                                  Checkbox(
                                    onChanged: (bool value) {
                                      setState(() {
                                        if (value == true) {
                                          check(21);
                                        } else {
                                          uncheck(21);
                                        }
                                      });
                                    },
                                    value: boolSeats[21],
                                    activeColor: Colors.greenAccent,
                                    checkColor: Colors.grey,
                                    focusColor: Colors.white,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Column(
                            children: [
                              Row(
                                children: [
                                  Checkbox(
                                    onChanged: (bool value) {
                                      setState(() {
                                        if (value == true) {
                                          check(22);
                                        } else {
                                          uncheck(22);
                                        }
                                      });
                                    },
                                    value: boolSeats[22],
                                    activeColor: Colors.greenAccent,
                                    checkColor: Colors.grey,
                                    focusColor: Colors.white,
                                  ),
                                  Checkbox(
                                    onChanged: (bool value) {
                                      setState(() {
                                        if (value == true) {
                                          check(23);
                                        } else {
                                          uncheck(23);
                                        }
                                      });
                                    },
                                    value: boolSeats[23],
                                    activeColor: Colors.greenAccent,
                                    checkColor: Colors.grey,
                                    focusColor: Colors.white,
                                  ),
                                  Checkbox(
                                    onChanged: (bool value) {
                                      setState(() {
                                        if (value == true) {
                                          check(24);
                                        } else {
                                          uncheck(24);
                                        }
                                      });
                                    },
                                    value: boolSeats[24],
                                    activeColor: Colors.greenAccent,
                                    checkColor: Colors.grey,
                                    focusColor: Colors.white,
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Checkbox(
                                    onChanged: (bool value) {
                                      setState(() {
                                        if (value == true) {
                                          check(25);
                                        } else {
                                          uncheck(25);
                                        }
                                      });
                                    },
                                    value: boolSeats[25],
                                    activeColor: Colors.greenAccent,
                                    checkColor: Colors.grey,
                                    focusColor: Colors.white,
                                  ),
                                  Checkbox(
                                    onChanged: (bool value) {
                                      setState(() {
                                        if (value == true) {
                                          check(26);
                                        } else {
                                          uncheck(26);
                                        }
                                      });
                                    },
                                    value: boolSeats[26],
                                    activeColor: Colors.greenAccent,
                                    checkColor: Colors.grey,
                                    focusColor: Colors.white,
                                  ),
                                  Checkbox(
                                    onChanged: (bool value) {
                                      setState(() {
                                        if (value == true) {
                                          check(27);
                                        } else {
                                          uncheck(27);
                                        }
                                      });
                                    },
                                    value: boolSeats[27],
                                    activeColor: Colors.greenAccent,
                                    checkColor: Colors.grey,
                                    focusColor: Colors.white,
                                  ),
                                  Checkbox(
                                    onChanged: (bool value) {
                                      setState(() {
                                        if (value == true) {
                                          check(28);
                                        } else {
                                          uncheck(28);
                                        }
                                      });
                                    },
                                    value: boolSeats[28],
                                    activeColor: Colors.greenAccent,
                                    checkColor: Colors.grey,
                                    focusColor: Colors.white,
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Checkbox(
                                    onChanged: (bool value) {
                                      setState(() {
                                        if (value == true) {
                                          check(29);
                                        } else {
                                          uncheck(29);
                                        }
                                      });
                                    },
                                    value: boolSeats[29],
                                    activeColor: Colors.greenAccent,
                                    checkColor: Colors.grey,
                                    focusColor: Colors.white,
                                  ),
                                  Checkbox(
                                    onChanged: (bool value) {
                                      setState(() {
                                        if (value == true) {
                                          check(30);
                                        } else {
                                          uncheck(30);
                                        }
                                      });
                                    },
                                    value: boolSeats[30],
                                    activeColor: Colors.greenAccent,
                                    checkColor: Colors.grey,
                                    focusColor: Colors.white,
                                  ),
                                  Checkbox(
                                    onChanged: (bool value) {
                                      setState(() {
                                        if (value == true) {
                                          check(31);
                                        } else {
                                          uncheck(31);
                                        }
                                      });
                                    },
                                    value: boolSeats[31],
                                    activeColor: Colors.greenAccent,
                                    checkColor: Colors.grey,
                                    focusColor: Colors.white,
                                  ),
                                  Checkbox(
                                    onChanged: (bool value) {
                                      setState(() {
                                        if (value == true) {
                                          check(32);
                                        } else {
                                          uncheck(32);
                                        }
                                      });
                                    },
                                    value: boolSeats[32],
                                    activeColor: Colors.greenAccent,
                                    checkColor: Colors.grey,
                                    focusColor: Colors.white,
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Checkbox(
                                    onChanged: (bool value) {
                                      setState(() {
                                        if (value == true) {
                                          check(33);
                                        } else {
                                          uncheck(33);
                                        }
                                      });
                                    },
                                    value: boolSeats[33],
                                    activeColor: Colors.greenAccent,
                                    checkColor: Colors.grey,
                                    focusColor: Colors.white,
                                  ),
                                  Checkbox(
                                    onChanged: (bool value) {
                                      setState(() {
                                        if (value == true) {
                                          check(34);
                                        } else {
                                          uncheck(34);
                                        }
                                      });
                                    },
                                    value: boolSeats[34],
                                    activeColor: Colors.greenAccent,
                                    checkColor: Colors.grey,
                                    focusColor: Colors.white,
                                  ),
                                  Checkbox(
                                    onChanged: (bool value) {
                                      setState(() {
                                        if (value == true) {
                                          check(35);
                                        } else {
                                          uncheck(35);
                                        }
                                      });
                                    },
                                    value: boolSeats[35],
                                    activeColor: Colors.greenAccent,
                                    checkColor: Colors.grey,
                                    focusColor: Colors.white,
                                  ),
                                  Checkbox(
                                    onChanged: (bool value) {
                                      setState(() {
                                        if (value == true) {
                                          check(36);
                                        } else {
                                          uncheck(36);
                                        }
                                      });
                                    },
                                    value: boolSeats[36],
                                    activeColor: Colors.greenAccent,
                                    checkColor: Colors.grey,
                                    focusColor: Colors.white,
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Checkbox(
                                    onChanged: (bool value) {
                                      setState(() {
                                        if (value == true) {
                                          check(37);
                                        } else {
                                          uncheck(37);
                                        }
                                      });
                                    },
                                    value: boolSeats[37],
                                    activeColor: Colors.greenAccent,
                                    checkColor: Colors.grey,
                                    focusColor: Colors.white,
                                  ),
                                  Checkbox(
                                    onChanged: (bool value) {
                                      setState(() {
                                        if (value == true) {
                                          check(38);
                                        } else {
                                          uncheck(38);
                                        }
                                      });
                                    },
                                    value: boolSeats[38],
                                    activeColor: Colors.greenAccent,
                                    checkColor: Colors.grey,
                                    focusColor: Colors.white,
                                  ),
                                  Checkbox(
                                    onChanged: (bool value) {
                                      setState(() {
                                        if (value == true) {
                                          check(39);
                                        } else {
                                          uncheck(39);
                                        }
                                      });
                                    },
                                    value: boolSeats[39],
                                    activeColor: Colors.greenAccent,
                                    checkColor: Colors.grey,
                                    focusColor: Colors.white,
                                  ),
                                  Checkbox(
                                    onChanged: (bool value) {
                                      setState(() {
                                        if (value == true) {
                                          check(40);
                                        } else {
                                          uncheck(40);
                                        }
                                      });
                                    },
                                    value: boolSeats[40],
                                    activeColor: Colors.greenAccent,
                                    checkColor: Colors.grey,
                                    focusColor: Colors.white,
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Checkbox(
                                    onChanged: (bool value) {
                                      setState(() {
                                        if (value == true) {
                                          check(41);
                                        } else {
                                          uncheck(41);
                                        }
                                      });
                                    },
                                    value: boolSeats[41],
                                    activeColor: Colors.greenAccent,
                                    checkColor: Colors.grey,
                                    focusColor: Colors.white,
                                  ),
                                  Checkbox(
                                    onChanged: (bool value) {
                                      setState(() {
                                        if (value == true) {
                                          check(42);
                                        } else {
                                          uncheck(42);
                                        }
                                      });
                                    },
                                    value: boolSeats[42],
                                    activeColor: Colors.greenAccent,
                                    checkColor: Colors.grey,
                                    focusColor: Colors.white,
                                  ),
                                  Checkbox(
                                    onChanged: (bool value) {
                                      setState(() {
                                        if (value == true) {
                                          check(43);
                                        } else {
                                          uncheck(43);
                                        }
                                      });
                                    },
                                    value: boolSeats[43],
                                    activeColor: Colors.greenAccent,
                                    checkColor: Colors.grey,
                                    focusColor: Colors.white,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FlatButton.icon(
                      onPressed: () {},
                      icon: Icon(
                        Icons.check_circle,
                        color: Colors.greenAccent,
                      ),
                      label: Text(
                        'Zgjedhura',
                        style:
                            TextStyle(fontFamily: fontSemi, color: kWhiteColor),
                      ),
                    ),
                    FlatButton.icon(
                      onPressed: () {},
                      icon: Icon(
                        Icons.check_circle,
                        color: Colors.grey,
                      ),
                      label: Text(
                        'Rezervuar',
                        style:
                            TextStyle(fontFamily: fontSemi, color: kWhiteColor),
                      ),
                    ),
                    FlatButton.icon(
                      onPressed: () {},
                      icon: Icon(
                        Icons.check_circle,
                        color: Colors.blueAccent,
                      ),
                      label: Text(
                        'Te lira',
                        style:
                            TextStyle(fontFamily: fontSemi, color: kWhiteColor),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            ClipRRect(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(25),
              ),
              child: Container(
                color: Colors.white,
                  height: 306,
                  width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 20, bottom: 5, right: 50, left: 50),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            widget.movie.title,
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
                            itemPadding: EdgeInsets.symmetric(horizontal: 0.0),
                            itemSize: 23,
                            itemBuilder: (context, _) => Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            onRatingUpdate: (double value) {},
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TitleAndType(
                            title: seatsString,
                            type: 'Karrige',
                          ),
                          SizedBox(
                            width: 70,
                          ),
                          TitleAndType(
                            title: time,
                            type: 'Ora',
                          ),
                          SizedBox(
                            width: 70.0,
                          ),
                          TitleAndType(
                            title: date,
                            type: 'Data',
                          ),
                        ],
                      ),
                      SizedBox(height: 40),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    'Qmimi',
                                    style: TextStyle(
                                        color: Colors.blueGrey,
                                        fontSize: 12,
                                        fontFamily: fontSemi,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    priceString,
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontFamily: fontSemi,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                              FlatButton(
                                height: 50,
                                minWidth: 150,
                                shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        color: Colors.blue,
                                        width: 1,
                                        style: BorderStyle.solid),
                                    borderRadius: BorderRadius.circular(50)),
                                color: kPrimaryColor,
                                onPressed: () {
                                  payM();
                                },
                                child: Text(
                                  "Paguaj",
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontFamily: fontSemi,
                                      color: kWhiteColor,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ],
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
    );
  }

  void check(int idx) {
    setState(() {
      if (count == 0) {
        boolSeats[idx] = true;
        count--;
        double p = double.parse(widget.movie.price);
        priceString = p.toString();
        seatsString = '';
        seatsString += (idx + 1).toString();
        index = idx;
      } else {
        EasyLoading.showInfo('Ju lutem zgjedhni vetem nje karrige');
      }
    });
  }

  void uncheck(int idx) {
    setState(() {
      count++;
      boolSeats[idx] = false;
      priceString = '0';
      seatsString = '0';
      index = -1;
    });
    // print(count.toString());
  }

  void payM() async{
    if (index == -1) {
      EasyLoading.showInfo('Ju nuk keni zgjedhur asnje karrige!');
    } else {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      name = prefs.getString('name');
      String time = widget.movie.date.substring(10, 16);
      String date = widget.movie.date.substring(5, 10);
      String id = new DateTime.now().millisecondsSinceEpoch.toString();
      String sub = id.substring(5,13);
      String code = sub.hashCode.toString()+seatsString.hashCode.toString();
      insertOrder(prefs.getString('name'),widget.movie.title,seatsString,widget.movie.cinemaName,time,sub,widget.movie.price,code);

      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => TicketScreen(
                  time: time,
                  seatsString: seatsString,
                  index: index,order: sub,name: name,movie: widget.movie)));
      EasyLoading.showSuccess('Pagesa u krye me sukses');

    }
  }

  void insertOrder(String id,String movieId,String seat,String ciname,String time,String order,String price,String code) async {
    final response = await http.post(Api.urlPrefix + "insert_orders.php", body: {
      "user": id,
      "movie": movieId,
      "cinema_name": ciname,
      "seat": seat,
      "time": time,
      "order": order,
      "price": price,
      "code": code,
    });
   // print(price);


  }
}
