import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:umbrella/blocs/weather_bloc/weather_bloc.dart';
import 'package:umbrella/core/constants/app_colors.dart';
import 'package:umbrella/core/extensions.dart';
import 'package:umbrella/core/utils/helper_functions.dart';
import 'package:umbrella/presentation/widgets/hourly_forecast.dart';
import 'package:umbrella/presentation/widgets/weather_detail_card.dart';

class WeatherScreen extends StatelessWidget {
  static const String routeName = "Weather";

  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocConsumer<WeatherBloc, WeatherState>(
        listener: (context, state) {
          if (state is WeatherError) {
            ScaffoldMessenger.of(context).showSnackBar(buildSanckBar(message: state.errorMessage, isError: true));
          }
        },
        builder: (context, state) {
          if (state is WeatherLoading) {
            return Center(
              child: SpinKitThreeBounce(
                size: context.width * .2,
                color: AppColors.secondary,
              ),
            );
          }

          if (state is WeatherFetched) {
            return _buildWeatherUI(context, state);
          }

          return Container();
        },
      ),
    );
  }

  Widget _buildWeatherUI(BuildContext context, WeatherFetched state) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          addVerticalSpace(context.width * .05),

          // Location and date

          Padding(
            padding: EdgeInsets.symmetric(horizontal: context.width * .05),
            child: Text(
              "${state.weather.location.name}, ${state.weather.location.country}",
              style: context.textTheme.bodyLarge?.copyWith(fontFamily: "Russo One", fontWeight: FontWeight.bold),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: context.width * .05),
            child: Text(
              DateTime.fromMillisecondsSinceEpoch(state.weather.location.localtimeEpoch * 1000).getFormattedDate,
              style: context.textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w400, color: Colors.grey),
            ),
          ),

          addVerticalSpace(context.width * .05),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: context.width * .05),
            child: Row(
              spacing: context.width * .1,
              children: [
                // Temprature and condition

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "${(state.weather.current.tempC).toInt()}°",
                        style: context.textTheme.displayLarge?.copyWith(
                          fontFamily: "Russo One",
                        ),
                      ),
                      Text(
                        state.weather.current.condition.text,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: Colors.grey),
                      )
                    ],
                  ),
                ),

                // Weather icon

                Expanded(
                  child: Image.network(
                    state.weather.current.condition.iconUrl,
                    width: context.width * .4,
                    height: context.width * .35,
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            ),
          ),

          addVerticalSpace(context.width * .05),

          // Weather details

          Padding(
            padding: EdgeInsets.symmetric(horizontal: context.width * .05),
            child: WeatherDetailCard(current: state.weather.current),
          ),

          addVerticalSpace(context.width * .05),

          // Hourly forecast

          SizedBox(
            height: 160,
            child: HourlyForecast(days: state.weather.forecast.forecastdays),
          ),

          addVerticalSpace(context.width * .05),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: context.width * .05),
            child: Row(
              spacing: context.width * .08,
              children: [
                // Feels like

                Expanded(
                  child: Card(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: context.width * .05, vertical: context.height * .025),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: context.width * .04,
                        children: [
                          Row(
                            spacing: context.width * .02,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              FaIcon(
                                FontAwesomeIcons.temperatureHigh,
                              ),
                              Text(
                                "Feels like",
                              ),
                            ],
                          ),
                          Text(
                            "${state.weather.current.feelslikeC.toInt()}°",
                            style: TextStyle(
                              fontSize: 24,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),

                // Visibility

                Expanded(
                  child: Card(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: context.width * .05, vertical: context.height * .025),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: context.width * .04,
                        children: [
                          Row(
                            spacing: context.width * .02,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              FaIcon(
                                FontAwesomeIcons.solidEye,
                                size: context.width * .05,
                              ),
                              Text(
                                "Visibility",
                              ),
                            ],
                          ),
                          Text(
                            "${state.weather.current.visKm.toInt()} Km",
                            style: TextStyle(
                              fontSize: 24,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
