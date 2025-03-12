import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:umbrella/blocs/weather_bloc/weather_bloc.dart';
import 'package:umbrella/core/extensions.dart';
import 'package:umbrella/core/utils/helper_functions.dart';

class OnboardingScreen extends StatelessWidget {
  static const String routeName = "Onboarding";

  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: context.width * .06, vertical: context.width * .06),
        child: Center(
          child: Column(
            spacing: context.width * .03,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                "assets/icons/weather_icon.png",
                width: context.width * .5,
              ),
              addHorizontalSpace(context.width * .05),
              Text(
                "Discover the weather in your city",
                style: TextStyle(
                  fontSize: 32,
                ),
                textAlign: TextAlign.center,
              ),
              addHorizontalSpace(context.width * .05),
              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: () {
                    context.read<WeatherBloc>().add(WeatherFetchedByLocation());
                  },
                  child: Text("Find Me"),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: () {},
                  child: Text("Search"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
