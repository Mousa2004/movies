class UpdateProfileResponse {
  String? message;
  String? data;

  UpdateProfileResponse({this.message, this.data});

  factory UpdateProfileResponse.fromJson(Map<String, dynamic> json) {
    return UpdateProfileResponse(
      message: json['message'] as String?,
      data: json['data'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {'message': message, 'data': data};
}
