import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:movie/src/business_logic/models/home_model.dart';
import 'package:movie/src/business_logic/services/api_services/api.dart';
import 'package:movie/src/business_logic/utils/constants.dart';
import 'package:movie/src/views/ui/home_screen.dart';
import 'package:movie/src/views/ui/register_screen.dart';
import 'package:movie/src/views/utils/button_widget.dart';
import 'package:movie/src/views/utils/text_field_widget.dart';
import 'package:movie/src/views/utils/wave_widget.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class LoginScreen extends StatelessWidget {
  final email = TextEditingController();
  final password = TextEditingController();
  bool _loginF = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bool keyboardOpen = MediaQuery.of(context).viewInsets.bottom > 0;
    final model = Provider.of<HomeModel>(context);

    return Scaffold(
      backgroundColor: kWhiteColor,
      body: Stack(
        children: <Widget>[
          Container(
            height: size.height - 200,
            color: kPrimaryColor,
          ),
          AnimatedPositioned(
            duration: Duration(milliseconds: 500),
            curve: Curves.easeOutQuad,
            top: keyboardOpen ? -size.height / 3.7 : 0.0,
            child: WaveWidget(
              size: size,
              yOffset: size.height / 3.0,
              color: kWhiteColor,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 100.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Miresevini',
                  style: TextStyle(
                    color: kPrimaryColor,
                    fontSize: 40.0,
                    fontFamily: fontBold,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                TextFieldWidget(
                  controller: email,
                  hintText: 'Emaili',
                  obscureText: false,
                  prefixIconData: Icons.mail_outline,
                  suffixIconData: model.isValid ? Icons.check : null,
                  onChanged: (value) {
                    model.isValidEmail(value);
                  },
                ),
                SizedBox(
                  height: 10.0,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    TextFieldWidget(
                      controller: password,
                      hintText: 'Fjalkalimi',
                      obscureText: model.isVisible ? false : true,
                      prefixIconData: Icons.lock_outline,
                      suffixIconData: model.isVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    GestureDetector(
                      onTap: () {
                        //print('hi');
                      },
                      child: new Text(
                        'Keni harruar fjalkalimin?',
                        style: TextStyle(
                          color: kPrimaryColor,
                          fontFamily: font,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                ButtonWidget(
                  onPress: () async {
                    // EasyLoading.showProgress(1, status: 'Ju lutem prisni...');
                    if (checkFields()) {
                      if (model.isValid == true) {
                        await _login();
                        if (_loginF == true) {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      HomeScreen()));
                          EasyLoading.showSuccess('Miresevini');
                        } else {
                          EasyLoading.showInfo('Emaili ose fjalkalimi jane gabim');
                        }
                      } else {
                        EasyLoading.showError('Emaili eshte jashte formatit');
                      }
                    } else {
                      //EasyLoading.showInfo('Emaili eshte gabim.');
                    }
                  },
                  title: 'Kyqu',
                  hasBorder: false,
                ),
                SizedBox(
                  height: 10.0,
                ),
                ButtonWidget(
                  onPress: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => RegisterScreen()));

                    print('hallo');
                  },
                  title: 'Regjitrohu',
                  hasBorder: true,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  bool checkFields() {
    if (email.text.isEmpty || password.text.isEmpty) {
      EasyLoading.showInfo('Ju lutem plotsoni te gjita te dhenat');
      return false;
    } else {
      return true;
    }
  }

  Future<List> _login() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final response = await http.post(Api.urlPrefix + "login.php", body: {
      "email": email.text,
      "password": password.text,
    });

    var datauser = json.decode(response.body);
    print(datauser);
    if (datauser.length < 1) {
      _loginF = false;
    } else {
      await prefs.setString('id', datauser[0]['id']);
      await prefs.setString('name', datauser[0]['name']);
      await prefs.setString('password', datauser[0]['password']);
      await prefs.setString('email', datauser[0]['email']);
      await prefs.setString('level', datauser[0]['level']);
      await prefs.setString('registeredAt', datauser[0]['registeredAt']);
      await prefs.setString('lastLogin', datauser[0]['lastLogin']);
      _loginF = true;
    }
  }
}
