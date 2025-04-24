part of 'auth_cubit.dart';

@immutable
abstract class AuthState {
  final bool isPasswordHidden;
  const AuthState({this.isPasswordHidden = true});
}

class AuthInitialState extends AuthState {
  AuthInitialState() : super(isPasswordHidden: true);
}

class AuthLoadingState extends AuthState {}

class AuthSuccessState extends AuthState {
  final User user;

  AuthSuccessState(this.user);
}

class AuthErrorState extends AuthState {
  final String error;

  AuthErrorState({required this.error});
}

class AuthPasswordVisibilityChangedState extends AuthState {
  AuthPasswordVisibilityChangedState({required bool isPasswordHidden})
      : super(isPasswordHidden: isPasswordHidden);
}
