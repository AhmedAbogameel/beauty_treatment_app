import 'package:beauty_treatment_app/constants.dart';
import 'package:beauty_treatment_app/core/router.dart';
import 'package:beauty_treatment_app/moduels/home/cubit/cubit.dart';
import 'package:beauty_treatment_app/moduels/home/homepage_screen.dart';
import 'package:beauty_treatment_app/moduels/login/states/states.dart';
import 'package:beauty_treatment_app/shared/components/toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginController extends Cubit<LoginStates>{
  LoginController() : super(LoginInit());

  static LoginController get(context)=> BlocProvider.of(context);

  final GlobalKey<FormState> key = GlobalKey<FormState>();

  String email,password;

  Future<void> login()async{
    key.currentState.save();
    if(!key.currentState.validate()) return;
    emit(LoginLoading());
    final formData = mapToFormData({
      'key': currentLoggedUser.apiToken,
      'email': email,
      'password': password,
    });
    final response = await dio.post('api/collection/login',data: formData);
    if(response.statusCode == 200){
      final data = response.data as Map;
      if(data.containsKey('message')){
        showToast(data['message']);
      }else{
        currentLoggedUser.id = data['customer_id'];
        await HomeCubit().getAccountInfo();
        MagicRouter.navigateAndPopAll(HomePageScreen());
      }
    }else
      showDefaultErrorMessage();
    emit(LoginInit());
  }
}