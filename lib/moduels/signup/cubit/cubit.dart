import 'package:beauty_treatment_app/moduels/signup/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpCubit extends Cubit<SignUpStates>
{
  SignUpCubit() : super(SignUpStateInitial());
  static SignUpCubit get(context) => BlocProvider.of(context);

  bool isMale = true;
  void switchGender(bool value)
  {
    isMale = value;
    emit(SignUpStateInitial());
  }
}