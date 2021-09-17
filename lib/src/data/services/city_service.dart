import 'package:travel/src/data/repositories/city_repository.dart';
import 'package:travel/src/models/city_model.dart';
import 'package:travel/src/models/response_model.dart';

class CityService {
  Future<List<CityModel>?> getCities({int limit = 5}) async {
    try {
      final ResponseModel? res =
          await new CityRepository().getCities(limit: limit);
      if (res != null && res.success!) {
        List<CityModel> aux = [];
        for (var item in res.data) {
          aux.add(CityModel.fromMap(item));
        }
        return aux;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }
}
