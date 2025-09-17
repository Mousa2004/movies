class GenreModel {
    final int id;
    final String name;

    GenreModel({
        required this.id,
        required this.name
    });

    // من JSON → Object
    factory GenreModel.fromJson(Map<String, dynamic> json) {
        return GenreModel(
            id: json['id'] ?? 0,
            name: json['name'] ?? ''
        );
    }

    // من Object → JSON
    Map<String, dynamic> toJson() {
        return {
            'id': id,
            'name': name
        };
    }
}
