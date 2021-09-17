import 'package:travel/src/data/repositories/generic_repository.dart';
import 'package:travel/src/models/response_model.dart';

class CityRepository {
  final String city = 'cities';

  Future<ResponseModel?> getCities({int limit = 5}) async {
    try {
      return await GenericRepository.instance.get('$city?limit=$limit');
    } catch (e) {
      print(e);
      return null;
    }
  }
}
