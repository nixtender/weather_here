import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_here/domain/models/weather_model.dart';

class StoredWeather {
  static const String _weatherKey = "_kWeather";
  static const String _listKey = "_kList";

  static Future<WeatherModel?> getStoredWeather() async {
    var sp = await SharedPreferences.getInstance();
    var json = sp.getString(_weatherKey);
    return (json == "" || json == null)
        ? null
        : WeatherModel.fromJsonPref(jsonDecode(json));
  }

  static Future<List<WeatherModel>?> getStoredList() async {
    var sp = await SharedPreferences.getInstance();
    var json = sp.getStringList(_listKey);
    return (json == 0 || json == null)
        ? null
        : (json)
            .map((item) => WeatherModel.fromJsonPref(jsonDecode(item)))
            .toList();
  }

  static Future setStoredWeather(WeatherModel? model) async {
    var sp = await SharedPreferences.getInstance();
    if (model == null) {
      sp.remove(_weatherKey);
    } else {
      await sp.setString(
        _weatherKey,
        jsonEncode(model.WeatherToJsonPref(model)),
      );
    }
  }

  static Future setStoredList(List<WeatherModel> list) async {
    var sp = await SharedPreferences.getInstance();
    List<String> convert = [];
    list.forEach((element) {
      convert.add(jsonEncode(element.WeatherToJsonPref(element)));
    });
    await sp.setStringList(_listKey, convert);
  }
}
