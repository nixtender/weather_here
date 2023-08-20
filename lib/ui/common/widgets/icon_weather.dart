import 'package:flutter/material.dart';

class IconWeather extends StatelessWidget {
  String weatherDesc;
  String weatherAss = "";

  IconWeather(this.weatherDesc) {
    switch (weatherDesc) {
      case 'Thunderstorm':
        weatherAss = "assets/weather/thunder.png";
        break;
      case 'Drizzle':
        weatherAss = "assets/weather/drizzle.png";
        break;
      case 'Rain':
        weatherAss = "assets/weather/drizzle.png";
        break;
      case 'Snow':
        weatherAss = "assets/weather/snow.png";
        break;
      case 'Atmosphere':
        weatherAss = "assets/weather/mist.png";
        break;
      case 'Clear':
        weatherAss = "assets/weather/sun.png";
        break;
      case 'Clouds':
        weatherAss = "assets/weather/cloud.png";
        break;
      default:
        weatherAss = "assets/weather/cloud.png";
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Image.asset(weatherAss);
  }
}
