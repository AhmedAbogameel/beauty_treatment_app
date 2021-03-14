import 'package:beauty_treatment_app/constants.dart';
import 'package:beauty_treatment_app/moduels/skin-types/model.dart';

class SkinTypesController {

  SkinTypesModel _skinTypesModel = SkinTypesModel();

  Future<SkinTypesModel> getData()async{
    final response = await dio.post('api/collection/categories',data: mapToFormData({'key': currentLoggedUser.apiToken}));
    _skinTypesModel = SkinTypesModel.fromJson(response.data);
    return _skinTypesModel;
  }

}