import 'profile_request.dart';

class ProfileResponse {
  String? message;
  ProfileRequest? profileRequest;

  ProfileResponse({this.message, this.profileRequest});

  factory ProfileResponse.fromJson(Map<String, dynamic> json) {
    return ProfileResponse(
      message: json['message'] as String?,
      profileRequest: json['data'] == null
          ? null
          : ProfileRequest.fromJson(json['data'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
    'message': message,
    'data': profileRequest?.toJson(),
  };
}
