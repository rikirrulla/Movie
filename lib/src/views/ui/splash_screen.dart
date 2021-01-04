import 'dart:async';

import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:movie/src/business_logic/models/movie.dart';
import 'package:movie/src/business_logic/services/api_services/movies-api.dart';
import 'package:movie/src/business_logic/utils/constants.dart';
import 'package:movie/src/views/ui/home_screen.dart';
import 'package:movie/src/views/ui/login_screen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: AnimatedSplashScreen(
        duration: 2000,
        splash: Image.asset('assets/images/splash2.png'),
        splashIconSize: 200,
        backgroundColor: kBackgroundColor,
        curve: Curves.bounceIn,
        //nextScreen: startTimer(),
        splashTransition: SplashTransition.rotationTransition,
        pageTransitionType: PageTransitionType.leftToRightWithFade,
        animationDuration: Duration(milliseconds: 1800),
      ),
    );
  }

  startTimer()  {
    Timer(Duration(seconds: 3), () {
       navigate();
    });
  }

  navigate() async {
    if (movies != null) {
      await getMovies();
      //movies.shuffle();
    }

    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString('name') == null) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LoginScreen()));
    } else {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomeScreen()));
    }
  }
}
