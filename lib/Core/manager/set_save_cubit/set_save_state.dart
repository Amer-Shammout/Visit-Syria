part of 'set_save_cubit.dart';

sealed class SetSaveState extends Equatable {
  const SetSaveState();

  @override
  List<Object> get props => [];
}

final class SetSaveInitial extends SetSaveState {}

final class SetSaveLoading extends SetSaveState {}

final class SetSaveFailure extends SetSaveState {
  final String errMessage;

  const SetSaveFailure({required this.errMessage});
}

final class SetSaveSuccess extends SetSaveState {}
