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
          emit(WeatherLoadedState(loc: locat));
        }
      } catch (_) {
        emit(WeatherErrorState());
      }
    });
  }
}
