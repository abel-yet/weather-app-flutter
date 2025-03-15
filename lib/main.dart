import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:umbrella/blocs/search_history/search_history_bloc.dart';
import 'package:umbrella/blocs/weather_bloc/weather_bloc.dart';
import 'package:umbrella/config/route/app_router.dart';
import 'package:umbrella/config/theme/app_theme.dart';
import 'package:umbrella/core/dependency_injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await dotenv.load();
  setupSL();
  runApp(Umbrella());
}

class Umbrella extends StatelessWidget {
  Umbrella({super.key});

  final router = appRouter();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<WeatherBloc>(),
        ),
        BlocProvider(
          create: (context) => sl<SearchHistoryBloc>(),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.theme,
        routerConfig: router,
      ),
    );
  }
}
