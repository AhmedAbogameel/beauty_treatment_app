import 'package:beauty_treatment_app/moduels/home/homepage_screen.dart';
import 'package:beauty_treatment_app/moduels/intro/intro_screen.dart';
import 'package:beauty_treatment_app/moduels/signup/cubit/cubit.dart';
import 'package:beauty_treatment_app/moduels/signup/cubit/states.dart';
import 'package:beauty_treatment_app/shared/components/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String valueChoose;

  List listItem = [
    "الزنك", "الصوديوم","الاملاح"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:BlocProvider(
        create: (context) => SignUpCubit(),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 10),
              Center(
                child: Image.asset('assets/images/logo.png',
                  height: MediaQuery.of(context).size.height/5,
                  width: MediaQuery.of(context).size.width/3,
                ),
              ),
              SizedBox(height: 10),
              Text('انشاء حساب جديد',style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: HexColor('#959595'),
                  fontSize: 16,
              ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Text('اسم المستخدم'),
                  ),
                  SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextFormField(
                      textAlign: TextAlign.right,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 10),
                        hintText: '',
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 8),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 30),
                              child: Text('الاسم الاول'),
                            ),
                            SizedBox(height: 8),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(horizontal: 10),
                                  hintText: '',
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

                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 8),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 30),
                              child: Text('الاسم الاخير '),
                            ),
                            SizedBox(height: 8),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              child: TextFormField(
                                textAlign: TextAlign.right,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(horizontal: 10),
                                  hintText: '',
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
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Text('البريد الالكتروني'),
                  ),
                  SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextFormField(
                      textAlign: TextAlign.right,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 10),
                        hintText: '',
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
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text('الجنس '),
                  ),
                  SizedBox(height: 10),
                  BlocBuilder<SignUpCubit,SignUpStates>(
                    builder: (context, state) => Row(
                      children: [
                        Expanded(
                            child: Container(
                                width: double.infinity,
                                height: 50,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 10),
                                  child: MaterialButton(
                                    onPressed: ()=> SignUpCubit.get(context).switchGender(true),
                                    elevation: 0,
                                    color: HexColor(!SignUpCubit.get(context).isMale? '#ebebeb': '#f5bebc'),
                                    child: Text('ذكر'),
                                  ),
                                )
                            )
                        ),
                        Expanded(
                            child: Container(
                                width: double.infinity,
                                height: 50,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 10),
                                  child: MaterialButton(
                                    onPressed: ()=> SignUpCubit.get(context).switchGender(false),
                                    elevation: 0,
                                    color: HexColor(SignUpCubit.get(context).isMale? '#ebebeb': '#f5bebc'),
                                    child: Text('أنثي'),
                                  ),
                                )
                            )
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text('تاريخ الميلاد '),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Center(
                            child: TextFormField(
                              onTap: (){},
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: Colors.transparent, width: 1.0),
                                ),
                                hintText: 'اليوم',
                                filled: true,
                                fillColor: HexColor('#ebebeb'),
                                contentPadding: EdgeInsets.symmetric(horizontal: 10)
                              ),
                              keyboardType: TextInputType.number,


                            ),
                          ),
                        ),
                        SizedBox(width: 15),
                        Expanded(
                          child: Center(
                            child: TextFormField(
                              onTap: (){},
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: Colors.transparent, width: 1.0),
                                ),
                                contentPadding: EdgeInsets.symmetric(horizontal: 10),
                                hintText: 'الشهر',
                                filled: true,
                                fillColor: HexColor('#ebebeb'),
                              ),

                            ),
                          ),
                        ),
                        SizedBox(width: 15),
                        Expanded(
                          child: Center(
                            child: TextFormField(
                              onTap: (){},
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: Colors.transparent, width: 1.0),
                                ),
                                contentPadding: EdgeInsets.symmetric(horizontal: 10),
                                hintText: 'السنه',
                                filled: true,
                                fillColor: HexColor('#ebebeb'),
                              ),

                            ),
                          ),
                        ),
                        SizedBox(height: 15),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text('حساسيه من '),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      width: double.infinity,
                      height: 50,
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        decoration: BoxDecoration(
                          color: HexColor('#ebebeb'),
                          borderRadius: BorderRadius.circular(10)
                        ),
                      child: DropdownButton(
                        underline: SizedBox(),
                        isExpanded: true,
                        hint:Text('حساسيه من') ,
                        dropdownColor:HexColor('#ebebeb'),
                        icon: Icon(Icons.arrow_drop_down),
                        iconSize: 28,
                        value: valueChoose,
                        onChanged: (newvalue)
                        {
                          setState(() {
                            valueChoose = newvalue;
                          });
                        },
                        items: listItem.map((valueItem)
                        {
                          return DropdownMenuItem(
                            value: valueItem,
                            child: Text(valueItem),
                          );
                        }).toList()
                      )
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Text('كلمه المرور '),
                  ),
                  SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextFormField(
                      obscureText: true,
                      textAlign: TextAlign.right,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 10),
                        hintText: '',
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
                  SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Container(
                      height: 45,
                      width: double.infinity,
                      child: DefaultButton(
                        text: 'انشاء حساب جديد',
                          function:()
                          {
                            Navigator.push(context, MaterialPageRoute(builder:(context) => HomePageScreen(),));
                          }),
                      ),
                    ),
                  SizedBox(height: 15),
                  InkWell(
                    onTap: ()
                    {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => introScreen(),));
                    },
                    child: Center(
                      child: Text('رجوع',style: TextStyle(
                          color: HexColor('#f2adab'),fontWeight: FontWeight.bold),),
                    ),
                  ),
                  SizedBox(height: 15),



                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
