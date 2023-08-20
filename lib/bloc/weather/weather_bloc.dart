import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_here/bloc/weather/weather_event.dart';
import 'package:weather_here/bloc/weather/weather_state.dart';
import 'package:weather_here/data/services/weather_service.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherService _weatherService = WeatherService();

  WeatherBloc(super.initialState) {
    on<WeatherLoadEvent>((event, emit) async {
      emit(WeatherGeoState());
      try {
        var locat = await _weatherService.getLocation();
        if (locat != null) {
          emit(WeatherLoadingState());
          var url =
              'https://api.openweathermap.org/data/2.5/weather?lat=${locat.lat}&lon=${locat.lon}&appid=${locat.apiKey}&lang=ru&units=metric';
          var urlCast =
              'https://api.openweathermap.org/data/2.5/forecast/?lat=${locat.lat}&lon=${locat.lon}&appid=${locat.apiKey}&lang=ru&units=metric&cnt=5';
          var weath = await _weatherService.getWeather(url);
          var weathList = await _weatherService.getWeathers(urlCast);
          if (weath != null && weathList != null) {
            weathList.removeAt(0);
            emit(WeatherLoadedState(
                loc: locat, weath: weath, weathList: weathList));
          }
        }
      } on NoNetworkException {
        emit(WeatherErrorState());
      } on NoGeolocationException {
        emit(WeatherErrorState());
      }
    });
  }
}
