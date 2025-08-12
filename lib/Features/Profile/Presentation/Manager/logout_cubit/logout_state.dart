part of 'logout_cubit.dart';

abstract class LogoutState extends Equatable {
  const LogoutState();

  @override
  List<Object?> get props => [];
}

class LogoutInitial extends LogoutState {}

class LogoutLoading extends LogoutState {}

class LogoutSuccess extends LogoutState {}

class LogoutFailure extends LogoutState {
  final String errMessage;
  const LogoutFailure({required this.errMessage});

  @override
  List<Object?> get props => [errMessage];
}
