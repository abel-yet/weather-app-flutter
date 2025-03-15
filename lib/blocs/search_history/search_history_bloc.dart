import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:umbrella/data/repositories/search_history_repository.dart';

part 'search_history_event.dart';
part 'search_history_state.dart';

class SearchHistoryBloc extends Bloc<SearchHistoryEvent, SearchHistoryState> {
  final SearchHistoryRepository searchHistoryRepository;

  SearchHistoryBloc({required this.searchHistoryRepository}) : super(SearchHistoryInitial()) {
    on<SearchHistoryFetched>(_searchHistoryFetchedHandler);
    on<SearchHistoryAdded>(_searchHistoryAddedHandler);
    on<SearchHistoryRemoved>(_searchHistoryRemovedHandler);

    add(SearchHistoryFetched(isFirstTime: true));
  }

  Future<void> _searchHistoryFetchedHandler(SearchHistoryFetched event, Emitter<SearchHistoryState> emit) async {
    try {
      if (event.isFirstTime) {
        emit(SearchHistoryLoading());
      }
      final history = await searchHistoryRepository.getHistory();
      emit(SearchHistoryFetch(history: history));
    } catch (e) {
      emit(SearchHistoryError(errorMessage: "Unknown error has occured fetching search history"));
    }
  }

  Future<void> _searchHistoryAddedHandler(SearchHistoryAdded event, Emitter<SearchHistoryState> emit) async {
    try {
      await searchHistoryRepository.addHistory(event.text);
      add(SearchHistoryFetched());
    } catch (e) {
      if (kDebugMode) {
        debugPrint(e.toString());
      }
    }
  }

  Future<void> _searchHistoryRemovedHandler(SearchHistoryRemoved event, Emitter<SearchHistoryState> emit) async {
    try {
      await searchHistoryRepository.removeHistory(event.text);
      add(SearchHistoryFetched());
    } catch (e) {
      if (kDebugMode) {
        debugPrint(e.toString());
      }
    }
  }
}
