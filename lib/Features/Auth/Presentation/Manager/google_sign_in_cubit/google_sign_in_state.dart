part of 'google_sign_in_cubit.dart';

abstract class GoogleSignInState extends Equatable {
  const GoogleSignInState();

  @override
  List<Object?> get props => [];
}

class GoogleSignInInitial extends GoogleSignInState {}

class GoogleSignInLoading extends GoogleSignInState {}

class GoogleSignInSuccess extends GoogleSignInState {
  final AuthResponseModel authResponse;
  const GoogleSignInSuccess({required this.authResponse});

  @override
  List<Object?> get props => [authResponse];
}

class GoogleSignInFailure extends GoogleSignInState {
  final String errMessage;
  const GoogleSignInFailure({required this.errMessage});

  @override
  List<Object?> get props => [errMessage];
}
