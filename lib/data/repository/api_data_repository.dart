import 'package:weather_here/data/clients/weather_client.dart';
import 'package:weather_here/domain/models/location.dart';
import 'package:weather_here/domain/models/weather_model.dart';
import 'package:weather_here/domain/repository/api_repository.dart';

class ApiDataRepository extends ApiRepository {
  final WeatherClient _weatherClient = WeatherClient();

  @override
  Future<Location?> getLocation() async => await _weatherClient.getLocation();

  @override
  Future<WeatherModel?> getWeather(String url) async =>
      await _weatherClient.getWeather(url);

  @override
  Future<List<WeatherModel>?> getWeathers(String urlCast) async =>
      await _weatherClient.getWeathers(urlCast);
}
