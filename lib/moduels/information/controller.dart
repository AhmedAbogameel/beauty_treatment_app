
import '../../constants.dart';
import 'model.dart';

class InformationController {

  InformationModel _informationModel = InformationModel();

  Future<InformationModel> getInformation(String id)async{
    final response = await dio.post('api/collection/information',data: mapToFormData({
      'key': currentLoggedUser.apiToken,
      'information_id': id,
    }));
    _informationModel = InformationModel.fromJson(response.data);
    return _informationModel;
  }

}