import 'package:flutter/material.dart';
import 'package:weather_application/data/utils.dart';
import 'package:weather_application/models/weather_object.dart';

class DateToday extends StatelessWidget {
  final AsyncSnapshot<WeatherForecast> snapshot;
  const DateToday({Key? key, required this.snapshot}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime date = DateTime.fromMillisecondsSinceEpoch(
        (snapshot.data!.list![0].dt! * 1000));

    return Column(
      children: [
        Text(Utils.dateFormat(date),
            style: const TextStyle(
                fontSize: 21, color: Colors.white, fontFamily: 'MullerRegular'))
      ],
    );
  }
}
