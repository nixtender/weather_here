import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_here/domain/models/location.dart';

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
          lat: position.latitude,
          lon: position.longitude,
          apiKey: "42b8c412b1edc040ec2856f20329f3a3");
    } catch (_) {
      Fluttertoast.showToast(
          msg: "Не удалось определить местоположение",
          gravity: ToastGravity.BOTTOM);
    }
    return null;
  }
}
