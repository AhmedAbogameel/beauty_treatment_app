import 'package:beauty_treatment_app/moduels/login/login_screen.dart';
import 'package:beauty_treatment_app/moduels/signup/signup_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class introScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 4,
              child: Center(
                  child: Image.asset(
            'assets/images/logo.png',
            width: 200,
          ))),
          Expanded(
            flex: 1,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Container(
                    width: double.infinity,
                    child: MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                      ),
                      elevation: 2,
                      padding: EdgeInsets.all(12),
                      onPressed: ()
                      {
                        Navigator.push(context, MaterialPageRoute(builder:(context) => LoginScreen(),));
                      },
                      child: Text(
                        'تسجيل الدخول',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w700),
                      ),
                      color: HexColor('#f5bebc'),
                    ),
                  ),
                ),
                SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Container(
                    width: double.infinity,
                    child: MaterialButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      elevation: 2,
                      padding: EdgeInsets.all(12),
                      onPressed: ()
                      {
                        Navigator.push(context, MaterialPageRoute(builder:(context) => SignUp(),));
                      },
                      child: Text(
                        'انشاء حساب جديد',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w700),
                      ),
                      color: HexColor('#f5bebc'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
