part of 'create_support_note_cubit.dart';

sealed class CreateSupportNoteState extends Equatable {
  const CreateSupportNoteState();

  @override
  List<Object> get props => [];
}

final class CreateSupportNoteInitial extends CreateSupportNoteState {}

final class CreateSupportNoteLoading extends CreateSupportNoteState {}

final class CreateSupportNoteSuccess extends CreateSupportNoteState {}

final class CreateSupportNoteFailure extends CreateSupportNoteState {
  final String errMessage;

  const CreateSupportNoteFailure({required this.errMessage});
}
