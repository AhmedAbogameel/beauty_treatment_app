import '../../constants.dart';

class ContactUsController {

  Future<String> send(String name,String phoneNumber,String message)async{
    final formData = mapToFormData({
      'key': currentLoggedUser.apiToken,
      'name':name,
      'telephone':phoneNumber,
      'enquiry': message,
    });
    final response = await dio.post('api/collection/contact',data: formData);
    if(response.statusCode == 200)
      return response.data['success'];
    else
      return DefaultErrorMessage;
  }

}