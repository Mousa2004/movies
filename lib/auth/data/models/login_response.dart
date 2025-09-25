class LoginResponse {
  String? message;
  String? data;

  LoginResponse({this.message, this.data});

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
    message: json['message'] as String?,
    data: json['data'] as String?,
  );

  Map<String, dynamic> toJson() => {'message': message, 'data': data};
}
