import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:umbrella/blocs/weather_bloc/weather_bloc.dart';
import 'package:umbrella/core/extensions.dart';
import 'package:umbrella/presentation/screens/weather_screen.dart';

class SearchScreen extends StatefulWidget {
  static const String routeName = "Search";

  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late TextEditingController _textEditingController;

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.fromLTRB(
          context.width * .05,
          context.height * .04,
          context.width * .05,
          0,
        ),
        child: Column(
          children: [
            Row(
              spacing: context.width * .05,
              children: [
                // Search Field

                Expanded(
                  child: TextField(
                    controller: _textEditingController,
                    decoration: InputDecoration(
                      hintText: "Enter city name",
                      suffixIcon: GestureDetector(
                        onTap: () {
                          if (_textEditingController.text.isEmpty) {
                            return;
                          }
                          FocusManager.instance.primaryFocus?.unfocus();
                          context.read<WeatherBloc>().add(WeatherFetchedByCityName(cityName: _textEditingController.text));
                          context.goNamed(WeatherScreen.routeName);
                        },
                        child: Icon(FontAwesomeIcons.magnifyingGlass),
                      ),
                    ),
                    onTapOutside: (event) {
                      FocusManager.instance.primaryFocus?.unfocus();
                    },
                    textInputAction: TextInputAction.search,
                    onSubmitted: (value) {
                      if (_textEditingController.text.isEmpty) {
                        return;
                      }
                      context.read<WeatherBloc>().add(WeatherFetchedByCityName(cityName: value));
                      context.goNamed(WeatherScreen.routeName);
                    },
                  ),
                ),

                // locate me
                GestureDetector(
                  onTap: () {
                    context.read<WeatherBloc>().add(WeatherFetchedByLocation());
                    context.goNamed(WeatherScreen.routeName);
                  },
                  child: FaIcon(FontAwesomeIcons.locationDot),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
