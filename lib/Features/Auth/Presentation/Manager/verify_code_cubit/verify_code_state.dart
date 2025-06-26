part of 'verify_code_cubit.dart';

abstract class VerifyCodeState extends Equatable {
  const VerifyCodeState();
  @override
  List<Object?> get props => [];
}

class VerifyCodeInitial extends VerifyCodeState {}
class VerifyCodeLoading extends VerifyCodeState {}
class VerifyCodeSuccess extends VerifyCodeState {
  final VerificationModel verificationModel;
  const VerifyCodeSuccess({required this.verificationModel});
}
class VerifyCodeFailure extends VerifyCodeState {
  final String errMessage;
  const VerifyCodeFailure({required this.errMessage});
  @override
  List<Object?> get props => [errMessage];
}