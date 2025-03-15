part of 'search_history_bloc.dart';

class SearchHistoryState extends Equatable {
  @override
  List<Object?> get props => [];
}

class SearchHistoryInitial extends SearchHistoryState {}

class SearchHistoryLoading extends SearchHistoryState {}

class SearchHistoryFetch extends SearchHistoryState {
  final List<String> history;

  SearchHistoryFetch({required this.history});

  @override
  List<Object?> get props => [history];
}

class SearchHistoryError extends SearchHistoryState {
  final String errorMessage;

  SearchHistoryError({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}
