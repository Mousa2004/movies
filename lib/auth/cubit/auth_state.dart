abstract class AuthState {}

class InitialState extends AuthState {}

class RegisterLoading extends AuthState {}

class RegisterSuccess extends AuthState {}

class RegisterError extends AuthState {
  final String message;
  RegisterError({required this.message});
}
