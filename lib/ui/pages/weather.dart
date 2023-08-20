import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_here/bloc/weather/weather_bloc.dart';
import 'package:weather_here/bloc/weather/weather_event.dart';
import 'package:weather_here/bloc/weather/weather_state.dart';
import 'package:weather_here/data/services/weather_service.dart';
import 'package:weather_here/domain/models/location.dart';
import 'package:weather_here/ui/common/widgets/humidity_name.dart';
import 'package:weather_here/ui/common/widgets/icon_weather.dart';
import 'package:weather_here/ui/common/widgets/icon_weather_big.dart';
import 'package:weather_here/ui/common/widgets/wind_direction.dart';

class Weather extends StatelessWidget {
  Weather({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<WeatherBloc>().add(WeatherLoadEvent());
    return Scaffold(
      body: Container(
          padding: const EdgeInsets.all(24),
          clipBehavior: Clip.antiAlias,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment(0.21, -0.98),
                  end: Alignment(-0.21, 0.98),
                  // colors: [Color(0xff131180), Colors.black],
                  // stops: <double>[0.5, 1]))),
                  colors: [Color(0xff110f80), Colors.black],
                  stops: <double>[0.5, 1])),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Image.asset("assets/icons/ellipse.png"),
                  ),
                  // ElevatedButton(
                  //     onPressed: () =>
                  //         context.read<WeatherBloc>().add(WeatherLoadEvent()),
                  //     child: Text("B")),
                ],
              ),
              BlocBuilder<WeatherBloc, WeatherState>(
                builder: ((context, state) {
                  if (state is WeatherGeoState ||
                      state is WeatherLoadingState) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (state is WeatherLoadedState) {
                    return SingleChildScrollView(
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 40,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.place_outlined,
                                color: Colors.white,
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Text(
                                state.weath.city ?? "",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.white,
                                    fontFamily: 'Roboto'),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Container(
                            height: 180,
                            child: IconWeatherBig(state.weath.mainWeath),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Text(
                            "${state.weath.temp}º",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 64,
                                fontFamily: 'Ubuntu'),
                          ),
                          Text(
                            state.weath.description,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                                fontFamily: 'Roboto'),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            "Макс.: ${state.weath.tempMax}º Мин.: ${state.weath.tempMin}º",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                                fontFamily: 'Roboto'),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            //padding: const EdgeInsets.all(24),
                            clipBehavior: Clip.antiAlias,
                            //color: Colors.white.withOpacity(0.20000000298023224),
                            width: 375,
                            height: 230,
                            decoration: ShapeDecoration(
                              color:
                                  Colors.white.withOpacity(0.20000000298023224),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(16),
                                  width: double.infinity,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Сегодня',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 17,
                                          fontFamily: 'Roboto',
                                        ),
                                      ),
                                      Text(
                                        "${state.weath.dt.day} ${nameMonth[state.weath.dt.month - 1]}",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontFamily: 'Roboto',
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Divider(
                                  color: Colors.white,
                                  thickness: 1,
                                ),
                                Expanded(
                                    child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 30, vertical: 25),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: state.weathList.map((item) {
                                      return Container(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Text(
                                              "${item.dt.hour}:${item.dt.minute}0",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 15,
                                                  fontFamily: 'Roboto'),
                                            ),
                                            IconWeather(item.mainWeath),
                                            Text(
                                              "${item.temp}º",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 17,
                                                  fontFamily: 'Roboto'),
                                            )
                                          ],
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                ))
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 24,
                          ),
                          Container(
                            width: double.infinity,
                            height: 96,
                            padding: const EdgeInsets.all(16),
                            decoration: ShapeDecoration(
                              color:
                                  Colors.white.withOpacity(0.20000000298023224),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      child:
                                          Image.asset("assets/icons/wind.png"),
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    SizedBox(
                                      width: 50,
                                      child: Text(
                                        "${state.weath.wind} м/с",
                                        style: TextStyle(
                                            color: Color(0x33FFFFFF),
                                            fontSize: 15,
                                            fontFamily: 'Roboto'),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 24,
                                    ),
                                    Expanded(
                                        child:
                                            WindDirection(state.weath.windDeg))
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                      child:
                                          Image.asset("assets/icons/drop.png"),
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    SizedBox(
                                      width: 50,
                                      child: Text("${state.weath.humidity}%",
                                          style: TextStyle(
                                              color: Color(0x33FFFFFF),
                                              fontSize: 15,
                                              fontFamily: 'Roboto')),
                                    ),
                                    const SizedBox(
                                      width: 24,
                                    ),
                                    Expanded(
                                        child:
                                            HumidityName(state.weath.humidity)),
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  }
                  if (state is WeatherErrorState) {
                    return Text("error");
                  }
                  return SizedBox();
                }),
              ),
            ],
          )),
    );
  }

  static Widget create() => BlocProvider(
        create: (BuildContext context) => WeatherBloc(WeatherGeoState()),
        child: Weather(),
      );

  List<String> nameMonth = [
    "января",
    "февраля",
    "марта",
    "апреля",
    "мая",
    "июня",
    "июля",
    "августа",
    "сентября",
    "октября",
    "ноября",
    "декабря",
  ];
}
