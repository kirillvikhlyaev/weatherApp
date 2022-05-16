import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:weather_application/data/utils.dart';
import 'package:weather_application/models/weather_object.dart';

class WeekForecast extends StatelessWidget {
  final AsyncSnapshot<WeatherForecast> snapshot;
  const WeekForecast({Key? key, required this.snapshot}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List? days = snapshot.data!.list;

    log('${days!.length}');
    return Column(
      children: [
        SizedBox(
          height: 130,
          child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              scrollDirection: Axis.horizontal,
              itemBuilder: ((context, index) => DayOfWeekCard(
                    snapshot: snapshot,
                    index: index,
                  )),
              separatorBuilder: (context, index) => const SizedBox(width: 10),
              itemCount: days.length),
        )
      ],
    );
  }
}

class DayOfWeekCard extends StatelessWidget {
  final AsyncSnapshot<WeatherForecast> snapshot;
  final int index;
  const DayOfWeekCard({Key? key, required this.snapshot, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    int? temp = (snapshot.data!.list![index].main!.temp)!.round();
    DateTime date = DateTime.fromMillisecondsSinceEpoch(
        (snapshot.data!.list![index].dt! * 1000));
    return SizedBox(
      height: 130,
      width: 150,
      child: Card(
        color: Color.fromARGB(255, 104, 72, 247),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                Utils.getIcon(snapshot, index),
                color: Colors.white,
                size: 40,
              ),
              SizedBox(height: 5),
              Text('$temp°',
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      fontFamily: 'MullerRegular')),
              SizedBox(height: 5),
              Text(Utils.dayOfMounth(date),
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: 'MullerLight')),
              Text(Utils.timeFormat(date),
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: 'MullerLight')),
            ],
          ),
        ),
      ),
    );
  }
}
