import 'package:weather_here/domain/models/location.dart';

abstract class ApiRepository {
  Future<Location?> getLocation();
}
