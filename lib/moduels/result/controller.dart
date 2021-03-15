import 'package:beauty_treatment_app/constants.dart';
import 'package:beauty_treatment_app/moduels/result/model.dart';
import 'package:beauty_treatment_app/shared/components/toast.dart';

class ResultsController {

  ResultsModel _resultsModel = ResultsModel();

  Future<ResultsModel> getResults(String id)async{
    try{
      final response = await dio.post('api/collection/categories/category_info',
          data: mapToFormData({
            'key': currentLoggedUser.apiToken,
            'category_id': id,
          }));
      _resultsModel = ResultsModel.fromJson(response.data);
    }catch(e){
      showToast(e.toString());
    }
    return _resultsModel;
  }

}