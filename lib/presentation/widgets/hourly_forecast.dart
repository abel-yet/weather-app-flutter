import 'package:flutter/material.dart';
import 'package:umbrella/core/extensions.dart';
import 'package:umbrella/core/utils/helper_functions.dart';
import 'package:umbrella/data/models/weather.dart';
import 'package:umbrella/presentation/widgets/hour_card.dart';

class HourlyForecast extends StatefulWidget {
  final List<Forecastday> days;
  const HourlyForecast({super.key, required this.days});

  @override
  State<HourlyForecast> createState() => _HourlyForecastState();
}

class _HourlyForecastState extends State<HourlyForecast> {
  int _selectedDayIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Days

        SizedBox(
          height: 40,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: context.width * .05),
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: widget.days.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedDayIndex = index;
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.only(right: context.width * .05),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          widget.days[index].date.getNameOfDay,
                          style: TextStyle(
                            color: _selectedDayIndex == index ? null : Colors.grey,
                            fontWeight: _selectedDayIndex == index ? FontWeight.bold : null,
                          ),
                        ),
                        if (_selectedDayIndex == index)
                          Text(
                            '.',
                            style: TextStyle(
                              fontFamily: "Russo One",
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),

        addVerticalSpace(10),

        // Hourly forecast

        Expanded(
          child: Padding(
            padding: EdgeInsets.only(left: context.width * .05),
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: widget.days[_selectedDayIndex].hour.length,
              itemBuilder: (context, index) {
                return HourCard(hour: widget.days[_selectedDayIndex].hour[index]);
              },
            ),
          ),
        )
      ],
    );
  }
}
