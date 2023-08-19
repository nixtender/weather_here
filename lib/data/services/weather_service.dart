import 'package:weather_here/domain/models/location.dart';
import 'package:weather_here/domain/repository/api_repository.dart';

import '../repository/api_data_repository.dart';

class WeatherService {
  final ApiRepository _api = ApiDataRepository();

  Future<Location?> getLocation() async {
    return await _api.getLocation();
  }
}
