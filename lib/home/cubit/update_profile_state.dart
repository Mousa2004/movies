abstract class UpdateProfileState {}

class InitialState extends UpdateProfileState {}

class UpdateProfileLoading extends UpdateProfileState {}

class UpdateProfileSuccess extends UpdateProfileState {}

class UpdateProfileError extends UpdateProfileState {
  final String message;
  UpdateProfileError({required this.message});
}
