class ResetPasswordResponse {
  String? message;
  String? data;

  ResetPasswordResponse({this.message, this.data});

  factory ResetPasswordResponse.fromJson(Map<String, dynamic> json) {
    return ResetPasswordResponse(
      message: json['message'] as String?,
      data: json['data'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {'message': message, 'data': data};
}
