class WeatherModel {
  DateTime dt;
  int temp;
  int humidity;
  int wind;
  String description;
  String? city;

  WeatherModel({
    required this.dt,
    required this.temp,
    required this.humidity,
    required this.wind,
    required this.description,
    required this.city,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
        dt: DateTime.fromMillisecondsSinceEpoch(json['dt'] * 1000),
        temp: double.parse(json['main']['temp'].toString()).toInt(),
        humidity: double.parse(json['main']['humidity'].toString()).toInt(),
        wind: double.parse(json['wind']['speed'].toString()).toInt(),
        description: json['weather'][0]['description'],
        city: json['name'] ?? '');
  }
}
