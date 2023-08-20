class WeatherModel {
  DateTime dt;
  int temp;
  int tempMin;
  int tempMax;
  int humidity;
  int wind;
  int windDeg;
  String mainWeath;
  String description;
  String? city;

  WeatherModel({
    required this.dt,
    required this.temp,
    required this.tempMin,
    required this.tempMax,
    required this.humidity,
    required this.wind,
    required this.windDeg,
    required this.mainWeath,
    required this.description,
    required this.city,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
        dt: DateTime.fromMillisecondsSinceEpoch(json['dt'] * 1000),
        temp: double.parse(json['main']['temp'].toString()).toInt(),
        tempMin: double.parse(json['main']['temp_min'].toString()).toInt(),
        tempMax: double.parse(json['main']['temp_max'].toString()).toInt(),
        humidity: double.parse(json['main']['humidity'].toString()).toInt(),
        wind: double.parse(json['wind']['speed'].toString()).toInt(),
        windDeg: double.parse(json['wind']['deg'].toString()).toInt(),
        mainWeath: json['weather'][0]['main'],
        description: json['weather'][0]['description'],
        city: json['name'] ?? '');
  }
}
