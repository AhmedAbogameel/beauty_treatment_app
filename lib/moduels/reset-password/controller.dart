import 'package:beauty_treatment_app/constants.dart';

class ResetPasswordController {

  Future<String> reset(String email)async{
    final response = await dio.post('api/collection/login/forgotten',data: mapToFormData({
      'key': currentLoggedUser.apiToken,
      'email':email
    }));
    if(response.statusCode == 200) {
      final data = response.data as Map;
      if(data.containsKey('success')) return data['success'];
      else if (data.containsKey('message')) return data['message'];
      else return DefaultErrorMessage;
    }
    else
      return DefaultErrorMessage;
  }

}