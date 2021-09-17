import 'package:flutter/cupertino.dart';
import 'package:travel/src/data/services/city_service.dart';
import 'package:travel/src/models/city_model.dart';

class CityProvider extends ChangeNotifier {
  List<CityModel>? cities = [];
  bool loading = false;

  Future getCities() async {
    loading = true;
    var res = await CityService().getCities();
    loading = false;
    if (res != null) cities = res;
    notifyListeners();
  }
}
