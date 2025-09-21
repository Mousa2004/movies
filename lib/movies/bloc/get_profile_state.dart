import 'package:movies/movies/data/models/profile_response.dart';

abstract class GetProfileState {}

class InialGetProfile extends GetProfileState {}

class GetProfileLoading extends GetProfileState {}

class GetProfileSuccess extends GetProfileState {
  final ProfileResponse profile;

  GetProfileSuccess({required this.profile});
}

class GetProfileError extends GetProfileState {
  final String message;

  GetProfileError({required this.message});
}
