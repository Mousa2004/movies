class Data {
  String? email;
  String? password;
  String? name;
  String? phone;
  int? avaterId;
  String? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  Data({
    this.email,
    this.password,
    this.name,
    this.phone,
    this.avaterId,
    this.id,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    email: json['email'] as String?,
    password: json['password'] as String?,
    name: json['name'] as String?,
    phone: json['phone'] as String?,
    avaterId: json['avaterId'] as int?,
    id: json['_id'] as String?,
    createdAt: json['createdAt'] == null
        ? null
        : DateTime.parse(json['createdAt'] as String),
    updatedAt: json['updatedAt'] == null
        ? null
        : DateTime.parse(json['updatedAt'] as String),
    v: json['__v'] as int?,
  );

  Map<String, dynamic> toJson() => {
    'email': email,
    'password': password,
    'name': name,
    'phone': phone,
    'avaterId': avaterId,
    '_id': id,
    'createdAt': createdAt?.toIso8601String(),
    'updatedAt': updatedAt?.toIso8601String(),
    '__v': v,
  };
}
