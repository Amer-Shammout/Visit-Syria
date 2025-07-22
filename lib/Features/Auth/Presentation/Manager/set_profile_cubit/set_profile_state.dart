part of 'set_profile_cubit.dart';

sealed class SetProfileState extends Equatable {
  const SetProfileState();

  @override
  List<Object> get props => [];
}

final class SetProfileInitial extends SetProfileState {}

class SetProfileLoading extends SetProfileState {}

class SetProfileSuccess extends SetProfileState {
  final ProfileModel profileModel;
  const SetProfileSuccess({required this.profileModel});
}

class SetProfileFailure extends SetProfileState {
  final String errMessage;
  const SetProfileFailure({required this.errMessage});
}
