import 'package:flutter/material.dart';

class HumidityName extends StatelessWidget {
  int percent = 0;
  String nameHum = "";

  HumidityName(this.percent) {
    if (percent > 85)
      nameHum = "Высокая влажность";
    else if (percent > 70 && percent <= 85)
      nameHum = "Умеренная влажность";
    else if (percent > 55 && percent <= 70)
      nameHum = "Умеренно сухой воздух";
    else if (percent > 30 && percent <= 55)
      nameHum = "Сухой воздух";
    else
      nameHum = "Очень сухой воздух";
  }

  @override
  Widget build(BuildContext context) {
    return Text(nameHum,
        style: TextStyle(
          color: Colors.white,
          fontSize: 15,
          fontFamily: 'Roboto',
        ),
        overflow: TextOverflow.ellipsis);
  }
}
