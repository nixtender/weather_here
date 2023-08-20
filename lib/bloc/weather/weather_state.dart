import 'package:weather_here/domain/models/location.dart';
import 'package:weather_here/domain/models/weather_model.dart';

abstract class WeatherState {}

class WeatherLoadedState extends WeatherState {
  Location loc;
  WeatherModel weath;
  WeatherLoadedState({required this.loc, required this.weath})
      : assert(loc != null && weath != null);
}

class WeatherGeoState extends WeatherState {}

class WeatherLoadingState extends WeatherState {}

class WeatherErrorState extends WeatherState {}
