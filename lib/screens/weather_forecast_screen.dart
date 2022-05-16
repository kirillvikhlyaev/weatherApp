import 'package:flutter/material.dart';
import 'package:weather_application/data/weather_api_handler.dart';
import 'package:weather_application/models/weather_object.dart';
import 'package:weather_application/widgets/date_today.dart';
import 'package:weather_application/widgets/weather_detail.dart';
import 'package:weather_application/widgets/weather_today.dart';
import 'package:weather_application/widgets/week_forecast.dart';

class WeatherForecastScreen extends StatefulWidget {
  const WeatherForecastScreen({Key? key}) : super(key: key);

  @override
  State<WeatherForecastScreen> createState() => _WeatherForecastScreenState();
}

class _WeatherForecastScreenState extends State<WeatherForecastScreen> {
  Future<WeatherForecast>? weaterForecast;
  String cityName = "Санкт-Петербург";

  @override
  void initState() {
    super.initState();
    weaterForecast = WeatherAPIHandler.getForecast(cityName: cityName);
  }

  // background: linear-gradient(90deg, #1f005c, #280471, #300b87, #39139d, #401cb5, #4824cd, #4e2de6, #5436ff);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment(0.8, 1),
            colors: <Color>[
              Color(0xff1f005c),
              Color(0xff280471),
              Color(0xff300b87),
              Color(0xff39139d),
              Color(0xff401cb5),
              Color(0xff4824cd),
              Color(0xff4e2de6),
              Color(0xff5436ff),
            ], // Gradient from https://learnui.design/tools/gradient-generator.html
            tileMode: TileMode.mirror,
          ),
        ),
        child: ListView(
          children: [
            FutureBuilder<WeatherForecast>(
              future: weaterForecast,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    children: [
                      const SizedBox(height: 30),
                      DateToday(snapshot: snapshot),
                      const SizedBox(height: 30),
                      WeatherToday(snapshot: snapshot),
                      const SizedBox(height: 35),
                      WeatherDetail(snapshot: snapshot),
                      const SizedBox(height: 35),
                      WeekForecast(snapshot: snapshot),
                    ],
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
