import 'package:weather_here/domain/models/weather_model.dart';
import 'package:weather_here/internal/config/stored_weather.dart';

class SyncService {
  Future<WeatherModel?> getWeatherPref() async {
    return await StoredWeather.getStoredWeather();
  }

  Future setWeatherPref(WeatherModel model) async =>
      await StoredWeather.setStoredWeather(model);

  Future<List<WeatherModel>?> getListPref() async {
    return await StoredWeather.getStoredList();
  }

  Future setListPref(List<WeatherModel> list) async {
    await StoredWeather.setStoredList(list);
  }
}
