part of 'reset_password_cubit.dart';

abstract class ResetPasswordState extends Equatable {
  const ResetPasswordState();
  @override
  List<Object?> get props => [];
}

class ResetPasswordInitial extends ResetPasswordState {}
class ResetPasswordLoading extends ResetPasswordState {}
class ResetPasswordSuccess extends ResetPasswordState {
  final AuthResponseModel authResponse;
  const ResetPasswordSuccess({required this.authResponse});
  @override
  List<Object?> get props => [authResponse];
}
class ResetPasswordFailure extends ResetPasswordState {
  final String errMessage;
  const ResetPasswordFailure({required this.errMessage});
  @override
  List<Object?> get props => [errMessage];
}