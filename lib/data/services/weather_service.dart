import 'package:weather_here/domain/models/location.dart';
import 'package:weather_here/domain/models/weather_model.dart';
import 'package:weather_here/domain/repository/api_repository.dart';

import '../repository/api_data_repository.dart';

class WeatherService {
  final ApiRepository _api = ApiDataRepository();

  Future<Location?> getLocation() async {
    return await _api.getLocation();
  }

  Future<WeatherModel?> getWeather(String url) async {
    return await _api.getWeather(url);
  }

  Future<List<WeatherModel>?> getWeathers(String urlCast) async {
    return await _api.getWeathers(urlCast);
  }
}

class NoNetworkException implements Exception {}

class NoGeolocationException implements Exception {}
