import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:umbrella/blocs/search_history/search_history_bloc.dart';
import 'package:umbrella/blocs/weather_bloc/weather_bloc.dart';
import 'package:umbrella/core/constants/app_colors.dart';
import 'package:umbrella/core/extensions.dart';
import 'package:umbrella/core/utils/helper_functions.dart';
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              spacing: context.width * .05,
              children: [
                // Search Field

                Expanded(
                  child: TextField(
                    autofocus: true,
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
                          context.read<SearchHistoryBloc>().add(SearchHistoryAdded(text: _textEditingController.text));
                          _textEditingController.clear();
                          context.goNamed(WeatherScreen.routeName);
                        },
                        child: Icon(FontAwesomeIcons.magnifyingGlass),
                      ),
                    ),
                    onTapOutside: (event) {
                      FocusManager.instance.primaryFocus?.unfocus();
                    },
                    textInputAction: TextInputAction.search,
                    textCapitalization: TextCapitalization.words,
                    onSubmitted: (value) {
                      if (_textEditingController.text.isEmpty) {
                        return;
                      }
                      context.read<WeatherBloc>().add(WeatherFetchedByCityName(cityName: value));
                      context.read<SearchHistoryBloc>().add(SearchHistoryAdded(text: _textEditingController.text));
                      _textEditingController.clear();
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
            ),

            addVerticalSpace(context.width * .07),

            // Search history

            Text("Search History"),

            addVerticalSpace(context.width * .05),

            BlocConsumer<SearchHistoryBloc, SearchHistoryState>(
              listener: (context, state) {},
              builder: (context, state) {
                if (state is SearchHistoryLoading) {
                  return SpinKitThreeBounce(
                    size: context.width * .1,
                    color: AppColors.secondary,
                  );
                }

                if (state is SearchHistoryError) {
                  return Expanded(child: _buildErrorUI(state));
                }

                if (state is SearchHistoryFetch) {
                  return Expanded(
                    child: _buildSearchHistoryUI(context, state),
                  );
                }

                return Container();
              },
            )
          ],
        ),
      ),
    );
  }

  _buildSearchHistoryUI(BuildContext context, SearchHistoryFetch state) {
    if (state.history.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: context.width * .04,
          children: [
            FaIcon(
              FontAwesomeIcons.file,
              size: context.width * .2,
            ),
            Text("No Search History")
          ],
        ),
      );
    }

    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: state.history.length,
      itemBuilder: (context, index) {
        return Card(
          margin: EdgeInsets.only(bottom: context.width * .04),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: context.width * .05, vertical: context.width * .04),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              spacing: context.width * .02,
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      context.read<WeatherBloc>().add(WeatherFetchedByCityName(cityName: state.history[index]));
                      context.goNamed(WeatherScreen.routeName);
                    },
                    child: Text(
                      state.history[index],
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => context.read<SearchHistoryBloc>().add(SearchHistoryRemoved(text: state.history[index])),
                  child: FaIcon(
                    FontAwesomeIcons.x,
                    size: context.width * .05,
                    color: Colors.grey,
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildErrorUI(SearchHistoryError state) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: context.width * .02,
        children: [
          Text(
            state.errorMessage,
            style: TextStyle(fontSize: 18),
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            "Please try again",
            style: TextStyle(fontSize: 18),
          ),
          addVerticalSpace(context.width * .02),
          GestureDetector(
            onTap: () => context.read<SearchHistoryBloc>().add(SearchHistoryFetched(isFirstTime: true)),
            child: FaIcon(FontAwesomeIcons.arrowRotateRight),
          )
        ],
      ),
    );
  }
}
