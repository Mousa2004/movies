abstract class DeleteProfileState {}

class InitialState extends DeleteProfileState {}

class DeleteProfileLoading extends DeleteProfileState {}

class DeleteProfileSuccess extends DeleteProfileState {}

class DeleteProfileError extends DeleteProfileState {
  final String message;
  DeleteProfileError({required this.message});
}
