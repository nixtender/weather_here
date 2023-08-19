import 'package:flutter/material.dart';

class Weather extends StatelessWidget {
  const Weather({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        clipBehavior: Clip.antiAlias,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment(0.21, -0.98),
                end: Alignment(-0.21, 0.98),
                // colors: [Color(0xff131180), Colors.black],
                // stops: <double>[0.5, 1]))),
                colors: [Color(0xff110f80), Colors.black],
                stops: <double>[0.5, 1])),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 80,
            ),
            Align(
              alignment: Alignment.center,
              child: Image.asset("assets/icons/ellipse.png"),
            )
          ],
        ),
      ),
    );
  }
}
