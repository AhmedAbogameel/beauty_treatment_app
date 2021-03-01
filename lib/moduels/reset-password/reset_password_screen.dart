import 'package:beauty_treatment_app/moduels/intro/intro_screen.dart';
import 'package:beauty_treatment_app/moduels/login/login_screen.dart';
import 'package:beauty_treatment_app/moduels/signup/signup_screen.dart';
import 'package:beauty_treatment_app/shared/components/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class resetPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
                child: Image.asset(
                  'assets/images/logo.png',
                  width: MediaQuery.of(context).size.width/2,
                  height: MediaQuery.of(context).size.height/1.4,
                )),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: TextFormField(
                    textAlign: TextAlign.right,
                    decoration: InputDecoration(
                      hintText: 'رقم الجوال أو البريد الاكتروني',
                      contentPadding: EdgeInsets.symmetric(horizontal: 10),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                      ),
                      fillColor: HexColor('#ebebeb'),
                      filled: true,
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
                        'استرجاع كلمه المرور',
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
            SizedBox(height: 15),
            InkWell(
              onTap: ()
              {
                Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
              },
              child: Text('رجوع',style: TextStyle(
                  color: HexColor('#f2adab'),fontWeight: FontWeight.bold),),
            ),
            SizedBox(height: 5),
          ],
        ),
      ),
    );
  }
}
