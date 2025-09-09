class UpdateProfileRequest {
  String? name;
  String? email;
  String? password;
  String? confirmPassword;
  String? phone;
  int? avaterId;

  UpdateProfileRequest({
    this.name,
    this.email,
    this.password,
    this.confirmPassword,
    this.phone,
    this.avaterId,
  });

  UpdateProfileRequest.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    password = json['password'];
    confirmPassword = json['confirmPassword'];
    phone = json['phone'];
    avaterId = json['avaterId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (name != null) data['name'] = name;
    if (email != null) data['email'] = email;
    if (password != null) data['password'] = password;
    if (confirmPassword != null) data['confirmPassword'] = confirmPassword;
    if (phone != null) data['phone'] = phone;
    if (avaterId != null) data['avatarId'] = avaterId;
    return data;
  }
}
