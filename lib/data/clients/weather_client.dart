import 'dart:convert';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_here/domain/models/location.dart';
import 'package:http/http.dart' as http;
import 'package:weather_here/domain/models/weather_model.dart';

class WeatherClient {
  Future<Location?> getLocation() async {
    try {
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          throw Exception();
        }
      }
      if (permission == LocationPermission.deniedForever) {
        throw Exception();
      }
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high,
          forceAndroidLocationManager: true);
      return Location(
          lat: (position.latitude * 100).round() / 100,
          lon: (position.longitude * 100).round() / 100,
          apiKey: "42b8c412b1edc040ec2856f20329f3a3");
    } catch (_) {
      Fluttertoast.showToast(
          msg: "Не удалось определить местоположение",
          gravity: ToastGravity.BOTTOM);
    }
    return null;
  }

  Future<WeatherModel?> getWeather(String url) async {
    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        return WeatherModel.fromJson(jsonDecode(response.body));
      } else {
        throw Exception();
      }
    } catch (_) {
      Fluttertoast.showToast(
          msg: "Не удалось определить погоду", gravity: ToastGravity.BOTTOM);
    }
  }

  Future<List<WeatherModel>?> getWeathers(String urlCast) async {
    try {
      final response = await http.get(Uri.parse(urlCast));

      if (response.statusCode == 200) {
        return (jsonDecode(response.body)['list'] as List<dynamic>)
            .map((item) => WeatherModel.fromJson(item))
            .toList();
      } else {
        throw Exception();
      }
    } catch (_) {
      Fluttertoast.showToast(
          msg: "Не удалось определить погоду", gravity: ToastGravity.BOTTOM);
    }
    return null;
  }
}
