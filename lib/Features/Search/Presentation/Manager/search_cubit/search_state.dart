import 'package:equatable/equatable.dart';
import 'package:visit_syria/Core/constants/flight_type.dart';

sealed class SearchState extends Equatable {
  final SearchTypes? type;
  final String query;

  const SearchState({this.type, this.query = ""});

  @override
  List<Object?> get props => [type, query];
}

final class SearchInitial extends SearchState {
  const SearchInitial({super.type, super.query});
}

final class SearchHistoryState extends SearchState {
  final List<String> history;
  const SearchHistoryState({required this.history, super.type, super.query});

  @override
  List<Object?> get props => [type, query, history];
}

final class SearchLoading extends SearchState {
  const SearchLoading({super.type, super.query});
}

final class SearchNoResults extends SearchState {
  const SearchNoResults({super.type, super.query});
}

final class SearchSuccess extends SearchState {
  final List<dynamic> results;
  const SearchSuccess({required this.results, super.type, super.query});

  @override
  List<Object?> get props => [type, query, results];
}

final class SearchFailure extends SearchState {
  final String errMessage;
  const SearchFailure({required this.errMessage, super.type, super.query});

  @override
  List<Object?> get props => [type, query, errMessage];
}
