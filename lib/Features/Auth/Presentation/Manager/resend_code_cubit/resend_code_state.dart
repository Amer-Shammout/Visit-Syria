part of 'resend_code_cubit.dart';

abstract class ResendCodeState extends Equatable {
  const ResendCodeState();
  @override
  List<Object?> get props => [];
}

class ResendCodeInitial extends ResendCodeState {}
class ResendCodeLoading extends ResendCodeState {}
class ResendCodeSuccess extends ResendCodeState {}
class ResendCodeFailure extends ResendCodeState {
  final String errMessage;
  const ResendCodeFailure({required this.errMessage});
  @override
  List<Object?> get props => [errMessage];
}