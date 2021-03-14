import 'package:beauty_treatment_app/moduels/about-us/aboutUs_screen.dart';
import 'package:beauty_treatment_app/moduels/contact-us/contact_us_screen.dart';
import 'package:beauty_treatment_app/moduels/home/cubit/states.dart';
import 'package:beauty_treatment_app/moduels/home/homepage_screen.dart';
import 'package:beauty_treatment_app/moduels/home/models/information.dart';
import 'package:beauty_treatment_app/moduels/login/login_screen.dart';
import 'package:beauty_treatment_app/moduels/main-page/mainpage_screen.dart';
import 'package:beauty_treatment_app/moduels/profile/model.dart';
import 'package:beauty_treatment_app/moduels/profile/profile_screen.dart';
import 'package:beauty_treatment_app/moduels/skin-types/skin_types_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../constants.dart';


class HomeCubit extends Cubit<HomeStates>
{
  HomeCubit() : super(HomeStateInitial());
  static HomeCubit get(context) => BlocProvider.of(context);

  InformationModel aboutUs = InformationModel();

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

  Future<void> getInfo()async{
    emit(HomeStateLoading());
    final formData = mapToFormData({
      'key':currentLoggedUser.apiToken,
      'information_id':'4'
    });
    final response = await dio.post('api/collection/information',data: formData);
    aboutUs = InformationModel.fromJson(response.data);
    emit(HomeStateInitial());
  }

  Future<void> getAccountInfo()async{
    emit(HomeStateLoading());
    final formData = mapToFormData({
      'key':currentLoggedUser.apiToken,
      'logged': currentLoggedUser.auth,
      'customer_id': currentLoggedUser.id,
    });
    final response = await dio.post('api/collection/account',data:formData);
    ProfileModel _profile = ProfileModel.fromJson(response.data);
    currentLoggedUser.setUser(firstName: _profile.firstname, lastName: _profile.lastname, phoneNumber: _profile.telephone, userName: _profile.username, email: _profile.email, id: currentLoggedUser.id);
    emit(HomeStateInitial());
  }
}