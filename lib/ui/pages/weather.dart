import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_here/bloc/weather/weather_bloc.dart';
import 'package:weather_here/bloc/weather/weather_event.dart';
import 'package:weather_here/bloc/weather/weather_state.dart';
import 'package:weather_here/data/services/weather_service.dart';
import 'package:weather_here/domain/models/location.dart';

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
            ),
            ElevatedButton(
                onPressed: () =>
                    context.read<WeatherBloc>().add(WeatherLoadEvent()),
                child: Text("B")),
            BlocBuilder<WeatherBloc, WeatherState>(
              builder: ((context, state) {
                if (state is WeatherGeoState || state is WeatherLoadingState) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state is WeatherLoadedState) {
                  return Column(
                    children: [
                      Text("lat=${state.loc.lat} lon=${state.loc.lon}"),
                      Text("city = ${state.weath.city}"),
                    ],
                  );
                }
                if (state is WeatherErrorState) {
                  return Text("error");
                }
                return SizedBox();
              }),
            ),
          ],
        ),
      ),
    );
  }

  static Widget create() => BlocProvider(
        create: (BuildContext context) => WeatherBloc(WeatherGeoState()),
        child: Weather(),
      );
}
