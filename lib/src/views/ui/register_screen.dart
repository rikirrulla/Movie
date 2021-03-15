import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:movie/src/business_logic/models/home_model.dart';
import 'package:movie/src/business_logic/services/api_services/api.dart';
import 'package:movie/src/business_logic/utils/constants.dart';
import 'package:movie/src/views/ui/login_screen.dart';
import 'package:movie/src/views/utils/button_widget.dart';
import 'package:movie/src/views/utils/text_field_widget.dart';
import 'package:movie/src/views/utils/wave_widget.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_easyloading/flutter_easyloading.dart';

class RegisterScreen extends StatelessWidget {
  final name = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final repasword = TextEditingController();
  bool _isRegistred = false;

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
                  'Regjistrohu',
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
                  controller: name,
                  hintText: 'Emri i plote',
                  obscureText: false,
                  onChanged: (value) {},
                  prefixIconData: Icons.title_rounded,
                ),
                SizedBox(
                  height: 10.0,
                ),
                TextFieldWidget(
                  controller: email,
                  hintText: 'Emaili',
                  obscureText: false,
                  prefixIconData: Icons.mail_outline,
                  suffixIconData: model.isValidRegister ? Icons.check : null,
                  onChanged: (value) {
                    model.isValidEmailRegister(value);
                  },
                ),
                SizedBox(
                  height: 10.0,
                ),
                TextFieldWidget(
                  controller: password,
                  hintText: 'Fjalkalimi',
                  obscureText: model.isVisible ? false : true,
                  prefixIconData: Icons.lock_outline,
                  onChanged: (value) {},
                  suffixIconData:
                      model.isVisible ? Icons.visibility : Icons.visibility_off,
                ),
                SizedBox(
                  height: 10.0,
                ),
                TextFieldWidget(
                  controller: repasword,
                  hintText: 'Konfirmo fjalkalimin',
                  obscureText: model.isVisible ? false : true,
                  prefixIconData: Icons.lock_outline,
                  onChanged: (value) {},
                  suffixIconData:
                      model.isVisible ? Icons.visibility : Icons.visibility_off,
                ),
                SizedBox(
                  height: 25.0,
                ),
                ButtonWidget(
                  onPress: () async {
                    if (checkFields() && model.isValidRegister == true) {
                      await _register();
                      if (_isRegistred == true) {
                        EasyLoading.showSuccess('Regjistrimi u krye me sukses');
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    LoginScreen()));
                      } else {
                        EasyLoading.showError('Diqka shkoi gabim');
                      }
                    } else {
                      //EasyLoading.showInfo('Emaili eshte gabim');
                    }
                  },
                  title: 'REGJISTROHU',
                  hasBorder: false,
                ),
                SizedBox(
                  height: 15.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Kthehu mbrapa. ',
                      style: TextStyle(
                        fontSize: 14.0,
                        fontFamily: font,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    LoginScreen()));
                      },
                      child: new Text(
                        'KYQU',
                        style: TextStyle(
                          color: kPrimaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0,
                          fontFamily: font,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  bool checkFields() {
    if (name.text.isEmpty ||
        email.text.isEmpty ||
        password.text.isEmpty ||
        repasword.text.isEmpty) {
      EasyLoading.showInfo('Ju lutem plostsoni te gjita te dhenat');
      return false;
    } else if (password.text != repasword.text) {
      EasyLoading.showInfo('Fjalkalimet nuk perputhen');
      return false;
    } else {
      return true;
    }
  }

  Future<bool> _register() async {
    final response = await http.post(Api.urlPrefix + "register.php", body: {
      "name": name.text,
      "email": email.text,
      "password": password.text,
    });
    print(name.text);
    print(email.text);
    print(repasword.text);

    var datauser = json.decode(response.body);
    if (datauser.length == 00) {
      _isRegistred = false;
    } else {
      _isRegistred = true;
    }
  }
}
