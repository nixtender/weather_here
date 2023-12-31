import 'package:weather_here/domain/models/location.dart';
import 'package:weather_here/domain/models/weather_model.dart';

abstract class WeatherState {}

class WeatherLoadedState extends WeatherState {
  WeatherModel weath;
  List<WeatherModel> weathList;
  WeatherLoadedState({required this.weath, required this.weathList})
      : assert(weath != null && weathList != null);
}

class WeatherGeoState extends WeatherState {}

class WeatherLoadingState extends WeatherState {}

class WeatherErrorState extends WeatherState {}
