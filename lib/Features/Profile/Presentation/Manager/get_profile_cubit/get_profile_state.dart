part of 'get_profile_cubit.dart';

sealed class GetProfileState extends Equatable {
  const GetProfileState();

  @override
  List<Object> get props => [];
}

final class GetProfileInitial extends GetProfileState {}

final class GetProfileLoading extends GetProfileState {}

final class GetProfileSuccess extends GetProfileState {}

final class GetProfileFailure extends GetProfileState {
  final String errMessage;

  const GetProfileFailure({required this.errMessage});
}
