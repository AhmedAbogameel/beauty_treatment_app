import 'package:beauty_treatment_app/moduels/about-us/aboutUs_screen.dart';
import 'package:beauty_treatment_app/moduels/contact-us/contact_us_screen.dart';
import 'package:beauty_treatment_app/moduels/home/cubit/states.dart';
import 'package:beauty_treatment_app/moduels/home/homepage_screen.dart';
import 'package:beauty_treatment_app/moduels/login/login_screen.dart';
import 'package:beauty_treatment_app/moduels/main-page/mainpage_screen.dart';
import 'package:beauty_treatment_app/moduels/profile/profile_screen.dart';
import 'package:beauty_treatment_app/moduels/skin-types/skin_types_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class HomeCubit extends Cubit<HomeStates>
{
  HomeCubit() : super(HomeStateInitial());
  static HomeCubit get(context) => BlocProvider.of(context);

  var widgets = [
    MainPageScreen(),
    AboutUsScreen(),
    ContactUsScreen(),
    ProfileScreen(),
  ];
  var titles = [
    Text('الرئيسيه',style: TextStyle(color: Colors.black,fontSize: 18),),
    Text('عن التطبيق ',style: TextStyle(color: Colors.black,fontSize: 18),),
    Text('اتصل بنا',style: TextStyle(color: Colors.black,fontSize: 18),),
    Text('حسابي',style: TextStyle(color: Colors.black,fontSize: 18),),
  ];
  var currentIndex = 0;
  changeIndex(index)
  {
    currentIndex = index;
    emit(HomeStateIndex());
  }
}