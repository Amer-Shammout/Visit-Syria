part of 'set_preferences_cubit.dart';

sealed class SetPreferencesState extends Equatable {
  const SetPreferencesState();

  @override
  List<Object> get props => [];
}

final class SetPreferencesInitial extends SetPreferencesState {}

final class SetPreferencesLoading extends SetPreferencesState {}

final class SetPreferencesFailure extends SetPreferencesState {
  final String errMessage;

  const SetPreferencesFailure({required this.errMessage});
}

final class SetPreferencesSuccess extends SetPreferencesState {
}
