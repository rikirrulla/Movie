import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie/src/business_logic/models/movie.dart';
import 'package:movie/src/business_logic/models/seats.dart';
import 'package:movie/src/business_logic/services/api_services/movies-api.dart';
import 'package:movie/src/business_logic/services/api_services/orders-api.dart';
import 'package:movie/src/business_logic/services/api_services/seats-api.dart';
import 'package:movie/src/business_logic/utils/constants.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:movie/src/views/ui/login_screen.dart';
import 'package:movie/src/views/ui/order_screen.dart';
import 'package:movie/src/views/ui/seats_screen.dart';
import 'package:movie/src/views/utils/movie_item.dart';
import 'package:movie/src/views/utils/movies_list.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _textString;
  double _rating;

  @override
  void initState() {
    super.initState();
    getMovies();
    checkMovies();
    getOrders();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    double paddingVertical = 30.0;
    double paddingHorizental = 25.0;
    return SafeArea(
      child: Scaffold(
        backgroundColor: kBackgroundColor,
        body: Container(
          width: size.width,
          height: size.height,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: paddingVertical,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: paddingHorizental),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Filmat',
                        style: TextStyle(
                          fontFamily: fontSemi,
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () {
                            },
                            child: Image.asset(
                              'assets/images/search.png',
                              fit: BoxFit.cover,
                              width: 30.0,
                              height: 30.0,
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          OrderScreen()));
                            },
                            child: Image.asset(
                              'assets/images/order.png',
                              fit: BoxFit.cover,
                              width: 30.0,
                              height: 30.0,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              AwesomeDialog(
                                context: context,
                                dialogType: DialogType.INFO,
                                animType: AnimType.TOPSLIDE,
                                title: 'Dilni',
                                desc: 'A jeni i sigurt',
                                btnCancelOnPress: () {},
                                btnOkOnPress: () {
                                  logout();
                                },
                              )..show();
                            },
                            child: Image.asset(
                              'assets/images/logout.png',
                              fit: BoxFit.cover,
                              width: 30.0,
                              height: 30.0,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    SizedBox(
                      height: paddingVertical,
                    ),
                    new Swiper(
                      itemBuilder: (BuildContext context, int index) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(15.0),
                          child: new Image.asset(
                            movies[index].image.isNotEmpty
                                ? movies[index].image
                                : 'assets/movies//error.png',
                            fit: BoxFit.fill,
                          ),
                        );
                      },
                      itemCount: movies.isNotEmpty ? movies.length : 0,
                      onIndexChanged: (value) {
                        changeIndex(value);
                      },
                      onTap: (value) async {
                        await getSeats();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    SeatsScreen(movies[value])));
                      },
                      autoplay: true,
                      itemWidth: 200.0,
                      itemHeight: 300.0,
                      layout: SwiperLayout.STACK,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      _textString,
                      style: TextStyle(fontSize: 16, fontFamily: fontSemi),
                    ),
                    RatingBar.builder(
                      initialRating: _rating / 2,
                      minRating: 1,
                      maxRating: 5,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemPadding: EdgeInsets.symmetric(horizontal: 0.0),
                      itemSize: 20,
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (double value) {},
                    ),
                  ],
                ),
                SizedBox(
                  height: paddingVertical,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 20,
                            bottom: 15,
                          ),
                          child: Row(
                            children: <Widget>[
                              Text(
                                'Ne trend',
                                style: TextStyle(
                                  fontFamily: fontSemi,
                                  fontSize: 23,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: movies.length,
                        itemBuilder: (BuildContext ctxt, int index) {
                          return MovieList(
                            movie: movies[index],
                            press: () {
                              showCupertinoModalBottomSheet(
                                expand: false,
                                context: context,
                                backgroundColor: Colors.transparent,
                                builder: (context) => MovieItem(movies[index]),
                              );
                            },
                          );
                        }),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void changeIndex(int index) {
    setState(() {
      _textString = movies[index].title;
      _rating = double.parse(movies[index].rating);
    });
  }

  void checkMovies() async {
    if (movies != null) {
      _textString = movies[0].title;
      _rating = double.parse(movies[0].rating);
    } else {
      _textString = '';
      _rating = 0;
    }
  }

  void logout() async {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) =>
            LoginScreen(),
      ),
    );
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }
}
