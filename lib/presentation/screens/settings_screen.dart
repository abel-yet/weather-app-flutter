import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:umbrella/blocs/settings_bloc/settings_bloc.dart';
import 'package:umbrella/core/constants/app_colors.dart';
import 'package:umbrella/core/extensions.dart';

class SettingsScreen extends StatelessWidget {
  static const String routeName = 'Settings';

  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: context.width * .05, vertical: context.width * .05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: context.width * .05,
          children: [
            Text(
              'Settings',
              style: context.textTheme.headlineSmall?.copyWith(fontFamily: "Russo One"),
            ),

            // Default location

            Card(
              color: context.theme.colorScheme.secondaryContainer,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: context.width * .05, vertical: context.width * .05),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: context.width * .02,
                  children: [
                    Text(
                      'Default Location',
                      style: context.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    Row(
                      spacing: context.width * .02,
                      children: [
                        Expanded(
                          child: BlocBuilder<SettingsBloc, SettingsState>(
                            builder: (context, state) {
                              return Text(
                                state.defaultLocation ?? "No Location",
                                style: context.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              );
                            },
                          ),
                        ),
                        OutlinedButton(
                            onPressed: () {
                              _showDefaultLocationDialog(context);
                            },
                            child: Text("Change")),
                      ],
                    )
                  ],
                ),
              ),
            ),

            // Units

            Card(
              color: context.theme.colorScheme.secondaryContainer,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: context.width * .05, vertical: context.width * .05),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: context.width * .05,
                  children: [
                    Text(
                      'Units',
                      style: context.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
                    ),

                    // Tempreature

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Tempreature",
                          style: context.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColors.secondary),
                            borderRadius: BorderRadius.circular(9),
                          ),
                          child: BlocBuilder<SettingsBloc, SettingsState>(
                            builder: (context, state) {
                              return Row(
                                spacing: context.width * .02,
                                children: [
                                  GestureDetector(
                                    onTap: () => context.read<SettingsBloc>().add(SetTempUnit(tempUnit: "Celsius")),
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: context.width * .02,
                                        vertical: context.width * .02,
                                      ),
                                      decoration: BoxDecoration(
                                        color: state.tempUnit == "Celsius" ? Colors.white : null,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Text(
                                        "Celsius",
                                        style: TextStyle(color: state.tempUnit == "Celsius" ? Colors.black : null),
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () => context.read<SettingsBloc>().add(SetTempUnit(tempUnit: "Fahrenheit")),
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: context.width * .02,
                                        vertical: context.width * .02,
                                      ),
                                      decoration: BoxDecoration(
                                        color: state.tempUnit == "Fahrenheit" ? Colors.white : null,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Text(
                                        "Fahrenheit",
                                        style: TextStyle(color: state.tempUnit == "Fahrenheit" ? Colors.black : null),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        )
                      ],
                    ),

                    // Wind speed

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Wind Speed",
                          style: context.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColors.secondary),
                            borderRadius: BorderRadius.circular(9),
                          ),
                          child: BlocBuilder<SettingsBloc, SettingsState>(
                            builder: (context, state) {
                              return Row(
                                spacing: context.width * .02,
                                children: [
                                  GestureDetector(
                                    onTap: () => context.read<SettingsBloc>().add(SetWindSpeedUnit(windSpeedUnit: "km/h")),
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: context.width * .02,
                                        vertical: context.width * .02,
                                      ),
                                      decoration: BoxDecoration(
                                        color: state.windSpeedUnit == "km/h" ? Colors.white : null,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Text(
                                        "km/h",
                                        style: TextStyle(color: state.windSpeedUnit == "km/h" ? Colors.black : null),
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () => context.read<SettingsBloc>().add(SetWindSpeedUnit(windSpeedUnit: "m/h")),
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: context.width * .02,
                                        vertical: context.width * .02,
                                      ),
                                      decoration: BoxDecoration(
                                        color: state.windSpeedUnit == "m/h" ? Colors.white : null,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Text(
                                        "m/h",
                                        style: TextStyle(color: state.windSpeedUnit == "m/h" ? Colors.black : null),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        )
                      ],
                    ),

                    // Precipitation

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Precipitation",
                          style: context.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColors.secondary),
                            borderRadius: BorderRadius.circular(9),
                          ),
                          child: BlocBuilder<SettingsBloc, SettingsState>(
                            builder: (context, state) {
                              return Row(
                                spacing: context.width * .02,
                                children: [
                                  GestureDetector(
                                    onTap: () => context.read<SettingsBloc>().add(SetPrecipitationUnit(precipitationUnit: "mm")),
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: context.width * .02,
                                        vertical: context.width * .02,
                                      ),
                                      decoration: BoxDecoration(
                                        color: state.precipitationUnit == "mm" ? Colors.white : null,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Text(
                                        "mm",
                                        style: TextStyle(color: state.precipitationUnit == "mm" ? Colors.black : null),
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () => context.read<SettingsBloc>().add(SetPrecipitationUnit(precipitationUnit: "in")),
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: context.width * .02,
                                        vertical: context.width * .02,
                                      ),
                                      decoration: BoxDecoration(
                                        color: state.precipitationUnit == "in" ? Colors.white : null,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Text(
                                        "in",
                                        style: TextStyle(color: state.precipitationUnit == "in" ? Colors.black : null),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        )
                      ],
                    ),

                    // Visibility

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Visibility",
                          style: context.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColors.secondary),
                            borderRadius: BorderRadius.circular(9),
                          ),
                          child: BlocBuilder<SettingsBloc, SettingsState>(
                            builder: (context, state) {
                              return Row(
                                spacing: context.width * .02,
                                children: [
                                  GestureDetector(
                                    onTap: () => context.read<SettingsBloc>().add(SetVisibilityUnit(visibilityUnit: "km")),
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: context.width * .02,
                                        vertical: context.width * .02,
                                      ),
                                      decoration: BoxDecoration(
                                        color: state.visibilityUnit == "km" ? Colors.white : null,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Text(
                                        "km",
                                        style: TextStyle(color: state.visibilityUnit == "km" ? Colors.black : null),
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () => context.read<SettingsBloc>().add(SetVisibilityUnit(visibilityUnit: "m")),
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: context.width * .02,
                                        vertical: context.width * .02,
                                      ),
                                      decoration: BoxDecoration(
                                        color: state.visibilityUnit == "m" ? Colors.white : null,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Text(
                                        "m",
                                        style: TextStyle(color: state.visibilityUnit == "m" ? Colors.black : null),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _showDefaultLocationDialog(BuildContext context) {
    String location = "";
    showDialog(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          title: Text('Default Location'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                autofocus: true,
                decoration: InputDecoration(hintText: "Enter City"),
                textCapitalization: TextCapitalization.words,
                onChanged: (value) {
                  location = value;
                },
                onSubmitted: (value) {
                  if (value.isNotEmpty) {
                    context.read<SettingsBloc>().add(SetDefaultLocation(defaultLocation: value));
                  }
                  Navigator.pop(ctx);
                },
              )
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(ctx);
              },
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                if (location.isNotEmpty) {
                  context.read<SettingsBloc>().add(SetDefaultLocation(defaultLocation: location));
                }
                Navigator.pop(ctx);
              },
              child: Text("Set"),
            ),
          ],
        );
      },
    );
  }
}
