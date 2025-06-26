part of 'forget_password_cubit.dart';

abstract class ForgetPasswordState extends Equatable {
  const ForgetPasswordState();
  @override
  List<Object?> get props => [];
}

class ForgetPasswordInitial extends ForgetPasswordState {}
class ForgetPasswordLoading extends ForgetPasswordState {}
class ForgetPasswordSuccess extends ForgetPasswordState {
  final String email;
  const ForgetPasswordSuccess({required this.email});
}
class ForgetPasswordFailure extends ForgetPasswordState {
  final String errMessage;
  const ForgetPasswordFailure({required this.errMessage});
  @override
  List<Object?> get props => [errMessage];
}