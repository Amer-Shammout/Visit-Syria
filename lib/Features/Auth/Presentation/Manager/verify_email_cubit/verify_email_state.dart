part of 'verify_email_cubit.dart';

abstract class VerifyEmailState extends Equatable {
  const VerifyEmailState();
  @override
  List<Object?> get props => [];
}

class VerifyEmailInitial extends VerifyEmailState {}
class VerifyEmailLoading extends VerifyEmailState {}
class VerifyEmailSuccess extends VerifyEmailState {
  final AuthResponseModel authResponse;
  const VerifyEmailSuccess({required this.authResponse});
  @override
  List<Object?> get props => [authResponse];
}
class VerifyEmailFailure extends VerifyEmailState {
  final String errMessage;
  const VerifyEmailFailure({required this.errMessage});
  @override
  List<Object?> get props => [errMessage];
}