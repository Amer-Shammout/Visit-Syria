part of 'delete_save_cubit.dart';

sealed class DeleteSaveState extends Equatable {
  const DeleteSaveState();

  @override
  List<Object> get props => [];
}

final class DeleteSaveInitial extends DeleteSaveState {}

final class DeleteSaveLoading extends DeleteSaveState {}

final class DeleteSaveSuccess extends DeleteSaveState {}

final class DeleteSaveFailure extends DeleteSaveState {
  final String errMessage;

  const DeleteSaveFailure({required this.errMessage});
}
