import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:visit_syria/Core/constants/flight_type.dart';
import 'package:visit_syria/Core/services/shared_preferences_singleton.dart';
import 'package:visit_syria/Features/Search/Data/Repos/search_repo.dart';
import 'package:visit_syria/Features/Search/Presentation/Manager/search_cubit/search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this._searchRepo) : super(_initialState());

  final SearchRepo _searchRepo;

  static SearchState _initialState() {
    final history = Prefs.getSearchHistory();
    if (history.isNotEmpty) {
      return SearchHistoryState(history: history);
    }
    return const SearchInitial();
  }

  void setType(SearchTypes type) {
    emit(_initialState());
    final s = state;
    if (s is SearchHistoryState) {
      emit(SearchHistoryState(history: s.history, type: type, query: s.query));
    } else if (s is SearchSuccess) {
      emit(SearchSuccess(results: s.results, type: type, query: s.query));
    } else if (s is SearchNoResults) {
      emit(SearchNoResults(type: type, query: s.query));
    } else if (s is SearchFailure) {
      emit(SearchFailure(errMessage: s.errMessage, type: type, query: s.query));
    } else if (s is SearchLoading) {
      emit(SearchLoading(type: type, query: s.query));
    } else {
      emit(SearchInitial(type: type, query: s.query));
    }
  }

  void setQuery(String query) {
    final s = state;
    if (s is SearchHistoryState) {
      emit(SearchHistoryState(history: s.history, type: s.type, query: query));
    } else if (s is SearchSuccess) {
      emit(SearchSuccess(results: s.results, type: s.type, query: query));
    } else if (s is SearchNoResults) {
      emit(SearchNoResults(type: s.type, query: query));
    } else if (s is SearchFailure) {
      emit(SearchFailure(errMessage: s.errMessage, type: s.type, query: query));
    } else if (s is SearchLoading) {
      emit(SearchLoading(type: s.type, query: query));
    } else {
      emit(SearchInitial(type: s.type, query: query));
    }
  }

  void showHistory() {
    final history = Prefs.getSearchHistory();
    if (history.isNotEmpty) {
      emit(
        SearchHistoryState(
          history: history,
          type: state.type,
          query: state.query,
        ),
      );
    } else {
      emit(SearchInitial(type: state.type, query: state.query));
    }
  }

  Future<void> clearHistory() async {
    await Prefs.clearSearchHistory();
    emit(SearchInitial(type: state.type, query: state.query));
  }

  Future<void> pickFromHistory(String q) async {
    setQuery(q);
    await doSearch();
  }

  void selectTagIndex(int index) {
    switch (index) {
      case 0:
        setType(SearchTypes.event);
        break;
      case 1:
        setType(SearchTypes.trip);
        break;
      case 2:
        setType(SearchTypes.tourist);
        break;
      case 3:
        setType(SearchTypes.restaurant);
        break;
      case 4:
        setType(SearchTypes.hotel);
        break;
      case 5:
        setType(SearchTypes.article);
        break;
      case 6:
        setType(SearchTypes.company);
        break;
      case 7:
        setType(SearchTypes.post);
        break;
      default:
        break;
    }
  }

  Future<void> doSearch() async {
    final t = state.type ?? SearchTypes.event;
    final q = state.query.trim();

    if (q.isEmpty) {
      showHistory();
      return;
    }

    emit(SearchLoading(type: t, query: q));

    final result = await _searchRepo.search(type: t.asQueryParam, sub: q);

    result.fold(
      (failure) => emit(
        SearchFailure(errMessage: failure.errMessage, type: t, query: q),
      ),
      (results) {
        if (results.isEmpty) {
          emit(SearchNoResults(type: t, query: q));
        } else {
          Prefs.addSearchQuery(q);
          emit(SearchSuccess(results: results, type: t, query: q));
        }
      },
    );
  }
}
