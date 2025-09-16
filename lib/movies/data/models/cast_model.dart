class CastModel {
  String? name;
  String? characterName;
  String? urlSmallImage;

  CastModel({this.name, this.characterName, this.urlSmallImage});

  factory CastModel.fromJson(Map<String, dynamic> json) => CastModel(
    name: json['name'] as String?,
    characterName: json['character_name'] as String?,
    urlSmallImage: json['url_small_image'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'name': name,
    'character_name': characterName,
    'url_small_image': urlSmallImage,
  };
}
