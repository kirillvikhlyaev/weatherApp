import 'package:flutter/material.dart';
import 'package:weather_application/data/utils.dart';
import 'package:weather_application/models/weather_object.dart';

class WeatherToday extends StatelessWidget {
  final AsyncSnapshot<WeatherForecast> snapshot;
  const WeatherToday({Key? key, required this.snapshot}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int? temp = (snapshot.data!.list![0].main!.temp)!.round();
    String? city = snapshot.data!.city!.name;
    String? country = snapshot.data!.city!.country;
    String? wb_description = snapshot.data!.list![0].weather![0].description;

    return Container(
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '$city',
            style: const TextStyle(
                fontSize: 31, color: Colors.white, fontFamily: 'MullerRegular'),
          ),
          Text(
            '$wb_description',
            style: const TextStyle(
                fontSize: 21, color: Colors.white, fontFamily: 'MullerLight'),
          ),
          const SizedBox(height: 20),
          Icon(Utils.getIcon(snapshot, 0), color: Colors.white, size: 200),
          const SizedBox(height: 20),
          Text(
            '$temp°',
            style: const TextStyle(
                fontSize: 65, color: Colors.white, fontFamily: 'MullerLight'),
          ),
        ],
      ),
    );
  }
}
