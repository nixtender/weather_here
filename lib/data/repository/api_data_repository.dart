import 'package:weather_here/data/clients/weather_client.dart';
import 'package:weather_here/domain/models/location.dart';
import 'package:weather_here/domain/repository/api_repository.dart';

class ApiDataRepository extends ApiRepository {
  final WeatherClient _weatherClient = WeatherClient();

  @override
  Future<Location?> getLocation() async => await _weatherClient.getLocation();
}
