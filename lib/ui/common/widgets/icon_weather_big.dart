import 'package:flutter/material.dart';

class IconWeatherBig extends StatelessWidget {
  String weatherDesc;
  String weatherAss = "";

  IconWeatherBig(this.weatherDesc) {
    switch (weatherDesc) {
      case 'Thunderstorm':
        weatherAss = "assets/weather/thunder-big.png";
        break;
      case 'Drizzle':
        weatherAss = "assets/weather/drizzle-big.png";
        break;
      case 'Rain':
        weatherAss = "assets/weather/drizzle-big.png";
        break;
      case 'Snow':
        weatherAss = "assets/weather/snow-big.png";
        break;
      case 'Atmosphere':
        weatherAss = "assets/weather/mist-big.png";
        break;
      case 'Clear':
        weatherAss = "assets/weather/sun-big.png";
        break;
      case 'Clouds':
        weatherAss = "assets/weather/cloud-big.png";
        break;
      default:
        weatherAss = "assets/weather/cloud-big.png";
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Image.asset(weatherAss);
  }
}
