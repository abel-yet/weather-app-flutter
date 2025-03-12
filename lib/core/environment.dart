import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {

  static String get apiUrl => dotenv.get("API_URL");

  static String get apiKey => dotenv.get("API_KEY");

}