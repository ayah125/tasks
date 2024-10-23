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

final class ForgetPasswordLoading extends AuthState {}

final class ForgetPasswordSuccess extends AuthState {
  final ForgetPasswordResponse forgetPasswordResponse;
  ForgetPasswordSuccess({required this.forgetPasswordResponse});
}

final class ForgetPasswordError<T> extends AuthState {
  T exception;
  ForgetPasswordError({required this.exception});
}

final class VerifyEmailLoading extends AuthState {}

final class VerifyEmailSuccess extends AuthState {
  final EmailVerificationResponse emailVerificationResponse;
  VerifyEmailSuccess({required this.emailVerificationResponse});
}

class VerifyEmailError<T> extends AuthState {
  T exception;
  VerifyEmailError({required this.exception});
}
