import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_application/data/location.dart';
import 'package:weather_application/data/utils.dart';
import 'package:weather_application/data/weather_api_handler.dart';
import 'package:weather_application/models/weather_object.dart';
import 'package:weather_application/screens/search_city_screen.dart';
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
  String cityName = "Уфа";
  LinearGradient backgroundGradient =
      const LinearGradient(colors: [Colors.cyan]);

  @override
  void initState() {
    super.initState();
    weaterForecast = WeatherAPIHandler.getForecast(cityName: cityName);
    backgroundGradient = Utils.getBackgroundGradient();
  }

  void onGetLocateTap() async {
    Position pos = await Location.getPos();
    log('${pos.latitude} - ${pos.longitude}');
    setState(() {
      weaterForecast = WeatherAPIHandler.getForecastByLocation(pos: pos);
    });
  }

  void onSearchCityTap() async {
    var searchedCity = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                SearchCity(backgroundGradient: backgroundGradient)));
    if (searchedCity != null) {
      setState(() {
        weaterForecast = WeatherAPIHandler.getForecast(cityName: searchedCity);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(Utils.dateFormat(DateTime.now()),
            style: const TextStyle(
                fontSize: 21,
                color: Colors.white,
                fontFamily: 'MullerRegular')),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(FontAwesomeIcons.locationArrow, color: Colors.white),
          onPressed: onGetLocateTap,
        ),
        actions: [
          IconButton(
            icon: const Icon(FontAwesomeIcons.city, color: Colors.white),
            onPressed: onSearchCityTap,
          ),
          const SizedBox(width: 10)
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: backgroundGradient,
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
                      WeatherToday(snapshot: snapshot),
                      const SizedBox(height: 55),
                      WeatherDetail(snapshot: snapshot),
                      const SizedBox(height: 55),
                      WeekForecast(snapshot: snapshot),
                    ],
                  );
                } else {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      SizedBox(height: 325),
                      SpinKitChasingDots(
                        color: Colors.white,
                      ),
                    ],
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
