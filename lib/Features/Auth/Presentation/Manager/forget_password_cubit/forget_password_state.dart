part of 'forget_password_cubit.dart';

abstract class ForgetPasswordState extends Equatable {
  const ForgetPasswordState();
  @override
  List<Object?> get props => [];
}

class ForgetPasswordInitial extends ForgetPasswordState {}
class ForgetPasswordLoading extends ForgetPasswordState {}
class ForgetPasswordSuccess extends ForgetPasswordState {
  final String message;
  const ForgetPasswordSuccess({required this.message});
  @override
  List<Object?> get props => [message];
}
class ForgetPasswordFailure extends ForgetPasswordState {
  final String errMessage;
  const ForgetPasswordFailure({required this.errMessage});
  @override
  List<Object?> get props => [errMessage];
}