import 'package:beauty_treatment_app/core/validation.dart';
import 'package:beauty_treatment_app/moduels/home/homepage_screen.dart';
import 'package:beauty_treatment_app/moduels/intro/intro_screen.dart';
import 'package:beauty_treatment_app/moduels/login/cubits/controller.dart';
import 'package:beauty_treatment_app/moduels/login/states/states.dart';
import 'package:beauty_treatment_app/moduels/reset-password/reset_password_screen.dart';
import 'package:beauty_treatment_app/shared/components/components.dart';
import 'package:beauty_treatment_app/shared/components/loading_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginController(),
      child: Builder(
        builder: (context){
          final loginController = LoginController.get(context);
          return Scaffold(
            body: SingleChildScrollView(
              child: Form(
                key: loginController.key,
                child: Column(
                  children: [
                    // SizedBox(height: 80),
                    Center(
                        child: Image.asset(
                            'assets/images/logo.png',
                            height: MediaQuery.of(context).size.height/2,
                            width: MediaQuery.of(context).size.width /2
                        )),
                    // SizedBox(height: 80),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        children: [
                          TextFormField(
                            textAlign: TextAlign.right,
                            decoration: InputDecoration(
                              hintText: 'البريد الاكتروني',
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
                            validator: Validations.email,
                            onSaved: (value)=> loginController.email = value,
                          ),
                          SizedBox(height: 10),
                          TextFormField(
                            textAlign: TextAlign.right,
                            obscureText: true,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(horizontal: 10),
                              hintText: 'كلمه المرور',
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
                            validator: Validations.password,
                            onSaved: (value)=> loginController.password = value,
                          ),
                          SizedBox(height: 10),
                          // DefaultButton(text:'دخول'),
                          BlocBuilder(
                            cubit: loginController,
                            builder: (_,state)=> state is LoginLoading ? LoadingIndicator() : Container(
                              width: double.infinity,
                              child: DefaultButton(
                                  text: 'تسجيل الدخول',
                                  function: ()=> loginController.login()
                              ),
                            ),
                          ),
                          SizedBox(height: 15),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              InkWell(
                                onTap: ()
                                {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => resetPassword(),));
                                },
                                child: Text('نسيت كلمه المرور',style: TextStyle(
                                    color: HexColor('#f2adab'),fontWeight: FontWeight.w700),),
                              ),
                              SizedBox(height: 15),
                              InkWell(
                                onTap: ()
                                {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => introScreen(),));
                                },
                                child: Text('رجوع',style: TextStyle(
                                    color: HexColor('#f2adab'),fontWeight: FontWeight.bold),),
                              ),
                              SizedBox(height: 5),

                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
