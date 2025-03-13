import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import 'package:umbrella/blocs/weather_bloc/weather_bloc.dart';
import 'package:umbrella/core/constants/app_colors.dart';
import 'package:umbrella/core/extensions.dart';
import 'package:umbrella/core/utils/helper_functions.dart';
import 'package:umbrella/presentation/screens/weather_screen.dart';

class OnboardingScreen extends StatelessWidget {
  static const String routeName = "Onboarding";

  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: context.width * .06, vertical: context.width * .06),
        child: Center(
          child: BlocConsumer<WeatherBloc, WeatherState>(
            listener: (context, state) {
              if (state is WeatherFetched) {
                context.goNamed(WeatherScreen.routeName);
              }

              if (state is WeatherError) {
                ScaffoldMessenger.of(context).showSnackBar(buildSanckBar(message: state.errorMessage, isError: true));
              }
            },
            builder: (context, state) {
              return Column(
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
                      onPressed: state is WeatherLoading
                          ? () {}
                          : () {
                              context.read<WeatherBloc>().add(WeatherFetchedByLocation());
                            },
                      child: state is WeatherLoading
                          ? SpinKitThreeBounce(
                              color: AppColors.primary,
                              size: context.width * .05,
                            )
                          : Text("Find Me"),
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
              );
            },
          ),
        ),
      ),
    );
  }
}
