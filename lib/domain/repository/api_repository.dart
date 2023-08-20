import 'package:weather_here/domain/models/location.dart';
import 'package:weather_here/domain/models/weather_model.dart';

abstract class ApiRepository {
  Future<Location?> getLocation();
  Future<WeatherModel?> getWeather(String url);
  Future<List<WeatherModel>?> getWeathers(String urlCast);
}
