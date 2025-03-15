import 'package:umbrella/data/data_providers/database_helper.dart';

class SearchHistoryRepository {

  final DatabaseHelper databaseHelper;

  SearchHistoryRepository({required this.databaseHelper});


  Future<List<String>> getHistory() async {
    final rawData = await databaseHelper.getHistory();
    final List<String> history = rawData.isNotEmpty ? rawData.map((m) => m["text"] as String).toList() : [];
    return history;
  }

  Future<int> addHistory(String text) async {
    return await databaseHelper.addHistory(text);
  }

  Future<int> removeHistory(String text) async {
    return await databaseHelper.removeHistory(text);
  }

}