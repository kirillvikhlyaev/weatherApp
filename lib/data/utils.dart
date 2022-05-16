import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:weather_application/models/weather_object.dart';

abstract class Utils {
  static String dateFormat(DateTime date) {
    return DateFormat("EEEE, d'th' MMMM").format(date);
  }

  static String dayOfMounth(DateTime date) {
    return DateFormat("d'th' MMMM").format(date);
  }

  static String timeFormat(DateTime date) {
    return DateFormat("HH':'mm").format(date);
  }

  static String dayOfWeek(DateTime date) {
    return DateFormat("EEEE").format(date);
  }

  static IconData getIcon(AsyncSnapshot<WeatherForecast> snapshot, int index) {
    String? typeOfWeather = snapshot.data!.list![index].weather![0].main;
    DateTime date = DateTime.fromMillisecondsSinceEpoch(
        (snapshot.data!.list![index].dt! * 1000));

    switch (typeOfWeather) {
      case "Clouds":
        return FontAwesomeIcons.cloud;
      case "Rain":
        if (int.parse(DateFormat('H').format(date)) >= 18 ||
            int.parse(DateFormat('H').format(date)) <= 5) {
          return FontAwesomeIcons.cloudMoonRain;
        } else {
          return FontAwesomeIcons.cloudSunRain;
        }
      case "Sun":
        return FontAwesomeIcons.sun;
      case "Snow":
        return FontAwesomeIcons.cloudMeatball;
      case "Clear":
        if (int.parse(DateFormat('H').format(date)) >= 18 ||
            int.parse(DateFormat('H').format(date)) <= 5) {
          return FontAwesomeIcons.moon;
        } else {
          return FontAwesomeIcons.sun;
        }
      default:
        if (int.parse(DateFormat('H').format(date)) >= 18 ||
            int.parse(DateFormat('H').format(date)) <= 5) {
          return FontAwesomeIcons.cloudMoon;
        } else {
          return FontAwesomeIcons.cloudSun;
        }
    }
  }
}
