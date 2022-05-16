import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather_application/models/weather_object.dart';

class WeatherDetail extends StatelessWidget {
  final AsyncSnapshot<WeatherForecast> snapshot;
  const WeatherDetail({Key? key, required this.snapshot}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mainInfo = snapshot.data!.list![0].main;
    var speedOfWind = snapshot.data!.list![0].wind!.speed;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        DetailColums(
            icon: FontAwesomeIcons.thermometer1,
            value: '${mainInfo!.pressure}',
            measureUnit: 'мм рт. ст.'),
        DetailColums(
            icon: FontAwesomeIcons.cloudRain,
            value: '${mainInfo.humidity}',
            measureUnit: '%'),
        DetailColums(
            icon: FontAwesomeIcons.wind,
            value: '$speedOfWind',
            measureUnit: 'м/c'),
      ],
    );
  }
}

class DetailColums extends StatelessWidget {
  final IconData icon;
  final String value;
  final String measureUnit;
  const DetailColums(
      {Key? key,
      required this.icon,
      required this.value,
      required this.measureUnit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: Colors.white, size: 35),
        const SizedBox(height: 15),
        Text(value,
            style: const TextStyle(
                fontSize: 21,
                color: Colors.white,
                fontFamily: 'MullerRegular')),
        const SizedBox(height: 10),
        Text(measureUnit,
            style: const TextStyle(
                fontSize: 16, color: Colors.white, fontFamily: 'MullerLight')),
      ],
    );
  }
}
