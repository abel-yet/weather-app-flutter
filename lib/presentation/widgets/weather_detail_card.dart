import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:umbrella/blocs/settings_bloc/settings_bloc.dart';
import 'package:umbrella/core/extensions.dart';
import 'package:umbrella/data/models/weather.dart';

class WeatherDetailCard extends StatelessWidget {
  final Current current;
  const WeatherDetailCard({super.key, required this.current});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: context.width * .02, vertical: context.width * .05),
        child: Row(
          spacing: context.width * .02,
          children: [
            // Wind speed

            Expanded(
              child: Column(
                spacing: context.width * .02,
                children: [
                  Image.asset("assets/icons/wind.png", width: context.width * .07),
                  BlocBuilder<SettingsBloc, SettingsState>(
                    builder: (context, state) {
                      final windSpeed = state.windSpeedUnit == "km/h" ? "${current.windKph} km/h" : "${current.windMph} m/h";
                      return Text(windSpeed);
                    },
                  ),
                  Text(
                    "Wind",
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
            ),

            // Humidity

            Expanded(
              child: Column(
                spacing: context.width * .02,
                children: [
                  Image.asset("assets/icons/humidity.png", width: context.width * .07),
                  Text("${current.humidity.toInt()} %"),
                  Text(
                    "Humidity",
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
            ),

            // Precipitation

            Expanded(
              child: Column(
                spacing: context.width * .02,
                children: [
                  Image.asset("assets/icons/rain.png", width: context.width * .07),
                  BlocBuilder<SettingsBloc, SettingsState>(
                    builder: (context, state) {
                      final precipitation = state.precipitationUnit == 'mm' ? "${current.precipMm} mm" : "${current.precipIn} in";
                      return Text(precipitation);
                    },
                  ),
                  Text(
                    "Precipitation",
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
