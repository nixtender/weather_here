import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_here/ui/navigations/app_navigator.dart';

class Splash extends StatefulWidget {
  @override
  SplashState createState() => SplashState();
}

class SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () async {
      var sp = await SharedPreferences.getInstance();
      if (sp.getString("_kWeather") != null)
        AppNavigator.toWeather();
      else
        AppNavigator.toAuth();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFF0700FF), Colors.black])),
      child: Column(
        children: [
          const SizedBox(
            height: 300,
          ),
          Container(
            padding: EdgeInsets.all(50),
            child: Text(
              "WEATHER SERVICE",
              style: TextStyle(
                  color: Colors.white, fontSize: 48, fontFamily: 'Inter'),
              softWrap: true,
            ),
          ),
          const SizedBox(
            height: 150,
          ),
          Text(
            "dawn is coming soon",
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontFamily: 'Inter',
            ),
          )
        ],
      ),
    );
  }
}
