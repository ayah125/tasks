part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

class SignUpLoadingState extends AuthState {}

class SignUpErrorState<T> extends AuthState {
  final T? exception;
  SignUpErrorState({this.exception});
}

class SignUpSuccessState extends AuthState {
  final SignUpResponse? signUpResponse;
  SignUpSuccessState({this.signUpResponse});
}
