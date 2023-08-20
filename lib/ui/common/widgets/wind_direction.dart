import 'package:flutter/material.dart';

class WindDirection extends StatelessWidget {
  int angle = 0;
  String direct = "";

  WindDirection(this.angle) {
    if (angle == 0) {
      direct = "Ветер северный";
    } else if (angle > 0 && angle < 90) {
      direct = "Ветер северо-восточный";
    } else if (angle == 90) {
      direct = "Ветер восточный";
    } else if (angle > 90 && angle < 180) {
      direct = "Ветер юго-восточный";
    } else if (angle == 180) {
      direct = "Ветер южный";
    } else if (angle > 180 && angle < 270) {
      direct = "Ветер юго-западный";
    } else if (angle == 270) {
      direct = "Ветер западный";
    } else {
      direct = "Ветер северо-западный";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      direct,
      style: TextStyle(
        color: Colors.white,
        fontSize: 15,
        fontFamily: 'Roboto',
      ),
      overflow: TextOverflow.ellipsis,
    );
  }
}
