import 'package:movies/auth/data/models/data.dart';
import 'package:movies/movies/data/models/meta.dart';



class MovieResponse {
  String? status;
  String? statusMessage;
  Data? data;
  Meta? meta;

  MovieResponse({this.status, this.statusMessage, this.data, this.meta});

  factory MovieResponse.fromJson(Map<String, dynamic> json) => MovieResponse(
    status: json['status'] as String?,
    statusMessage: json['status_message'] as String?,
    data: json['data'] == null
        ? null
        : Data.fromJson(json['data'] as Map<String, dynamic>),
    meta: json['@meta'] == null
        ? null
        : Meta.fromJson(json['@meta'] as Map<String, dynamic>),
  );

  Map<String, dynamic> toJson() => {
    'status': status,
    'status_message': statusMessage,
    'data': data?.toJson(),
    '@meta': meta?.toJson(),
  };
}
