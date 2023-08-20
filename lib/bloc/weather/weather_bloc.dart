import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_here/bloc/weather/weather_event.dart';
import 'package:weather_here/bloc/weather/weather_state.dart';
import 'package:weather_here/data/services/sync_service.dart';
import 'package:weather_here/data/services/weather_service.dart';
import 'package:weather_here/domain/models/weather_model.dart';

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
            await SyncService().setWeatherPref(weath);
            await SyncService().setListPref(weathList);
            emit(WeatherLoadedState(weath: weath, weathList: weathList));
          }
        }
      } on NoNetworkException {
        WeatherModel? model = await SyncService().getWeatherPref();
        List<WeatherModel>? listW = await SyncService().getListPref();
        if (model != null && listW != null) {
          emit(WeatherLoadedState(weath: model, weathList: listW));
        } else
          emit(WeatherErrorState());
      } on NoGeolocationException {
        WeatherModel? model = await SyncService().getWeatherPref();
        List<WeatherModel>? listW = await SyncService().getListPref();
        if (model != null && listW != null) {
          emit(WeatherLoadedState(weath: model, weathList: listW));
        } else
          emit(WeatherErrorState());
      }
    });
  }
}
