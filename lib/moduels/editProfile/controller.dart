import 'package:beauty_treatment_app/constants.dart';
import 'package:beauty_treatment_app/moduels/home/cubit/cubit.dart';

class EditProfileController {

  Future<String> edit({
  String firstName,
    String lastName,
    String email,
    String phoneNumber
})async{
    final formData = mapToFormData({
      'key': currentLoggedUser.apiToken,
      'email': email ?? currentLoggedUser.email,
      'telephone': phoneNumber ?? currentLoggedUser.phoneNumber,
      'firstname' : firstName ?? currentLoggedUser.firstName,
      'lastname': lastName ?? currentLoggedUser.lastName,
      'logged': currentLoggedUser.auth,
      'customer_id': currentLoggedUser.id,
    });
    final response = await dio.post('api/collection/account/edit_info',data: formData);
    if(response.statusCode == 200) {
      await HomeCubit().getAccountInfo();
      return response.data['success'];
    } else
      return DefaultErrorMessage;
  }

}