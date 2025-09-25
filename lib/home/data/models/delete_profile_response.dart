class DeleteProfileResponse {
  String? message;
  String? data;

  DeleteProfileResponse({this.message, this.data});

  factory DeleteProfileResponse.fromJson(Map<String, dynamic> json) {
    return DeleteProfileResponse(
      message: json['message'] as String?,
      data: json['data'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {'message': message, 'data': data};
}
