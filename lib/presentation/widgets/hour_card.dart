import 'package:flutter/material.dart';
import 'package:umbrella/core/extensions.dart';
import 'package:umbrella/data/models/weather.dart';

class HourCard extends StatelessWidget {
  final Hour hour;
  const HourCard({super.key, required this.hour});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(right: context.width * .04),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: context.width * .08, vertical: context.width * .02),
        child: Column(
          spacing: context.width * .01,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(DateTime.fromMillisecondsSinceEpoch(hour.timeEpoch * 1000).getTime.toLowerCase()),
            Image.network(
              hour.condition.iconUrl,
              width: context.width * .1,
              height: context.width * .1,
              fit: BoxFit.contain,
            ),
            Text(
              "${hour.tempC.toInt()}°",
              style: TextStyle(fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
