import 'package:weather_here/domain/models/location.dart';

abstract class WeatherState {}

class WeatherLoadedState extends WeatherState {
  Location loc;
  WeatherLoadedState({required this.loc}) : assert(loc != null);
}

class WeatherGeoState extends WeatherState {}

class WeatherLoadingState extends WeatherState {}

class WeatherErrorState extends WeatherState {}
