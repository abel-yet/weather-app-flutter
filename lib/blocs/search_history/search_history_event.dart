part of 'search_history_bloc.dart';

sealed class SearchHistoryEvent {}

class SearchHistoryFetched extends SearchHistoryEvent {
  final bool isFirstTime;

  SearchHistoryFetched({this.isFirstTime = false});
}

class SearchHistoryAdded extends SearchHistoryEvent {
  final String text;

  SearchHistoryAdded({required this.text});
}

class SearchHistoryRemoved extends SearchHistoryEvent {
  final String text;

  SearchHistoryRemoved({required this.text});
}