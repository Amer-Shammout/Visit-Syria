part of 'register_cubit.dart';

sealed class RegisterState extends Equatable {
  const RegisterState();

  @override
  List<Object> get props => [];
}

final class RegisterInitial extends RegisterState {}

final class RegisterLoading extends RegisterState {}

final class RegisterSuccess extends RegisterState {
  final AuthRequestModel authRequestModel;

  const RegisterSuccess({required this.authRequestModel});
}

final class RegisterFailure extends RegisterState {
  final String errMessage;

  const RegisterFailure({required this.errMessage});
}
