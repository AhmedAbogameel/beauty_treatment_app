import 'package:beauty_treatment_app/core/router.dart';
import 'package:beauty_treatment_app/moduels/home/cubit/cubit.dart';
import 'package:beauty_treatment_app/moduels/home/homepage_screen.dart';
import 'package:beauty_treatment_app/moduels/signup/cubit/states.dart';
import 'package:beauty_treatment_app/shared/components/toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../constants.dart';

class SignUpCubit extends Cubit<SignUpStates>
{
  SignUpCubit() : super(SignUpStateInitial());
  static SignUpCubit get(context) => BlocProvider.of(context);
  final GlobalKey<FormState> key = GlobalKey<FormState>();

  bool isMale = true;
  String firstName,lastName,userName,email,day,month,year,password,allergy;

  List allergyList = ["الزنك", "الصوديوم","الاملاح"];

  void switchGender(bool value)
  {
    isMale = value;
    emit(SignUpStateInitial());
  }

  void pickAllergy(String value){
    allergy = value;
    emit(SignUpStateInitial());
  }

  Future<void> getAllergy()async{
    emit(SignUpStatePageLoading());
    final response = await dio.post('api/collection/register/allergy',data: mapToFormData({'key': currentLoggedUser.apiToken}));
    allergyList = response.data['allergy'] as List;
    emit(SignUpStateInitial());
  }

  Future<void> signUp()async{
    key.currentState.save();
    if(!key.currentState.validate()) return;
    emit(SignUpStateLoading());
    final formData = mapToFormData({
      'key': currentLoggedUser.apiToken,
      'firstname': firstName,
      'lastname': lastName,
      'username': userName,
      'email':email,
      'gender': isMale ? '0' : '1',
      'birthdate': year+'-'+month.padLeft(2,'0')+'-'+day.padLeft(2,'0'),
      'allergy': allergy,
      'password': password,
      'confirm': password,
    });
    final response = await dio.post('api/collection/register',data: formData);
    if(response.statusCode == 200){
      final data = response.data as Map;
      if(data.containsKey('message'))
        showToast(data['message']);
      else{
        currentLoggedUser.id = data['customer_id'];
        await HomeCubit().getAccountInfo();
        MagicRouter.navigateAndPopAll(HomePageScreen());
      }
    }else
      showDefaultErrorMessage();
    emit(SignUpStateInitial());
  }


}