import 'package:dio/dio.dart';
import 'package:movies/auth/data/data_sources/local/auth_local_data_sources.dart';
import 'package:movies/auth/data/data_sources/local/auth_sharedprefrences_data_sources.dart';
import 'package:movies/movies/data/models/profile_response.dart';
import 'package:movies/shared/const/api_const.dart';
import 'package:movies/shared/view/widget/app_exception.dart';

AuthLocalDataSources localDataSources = AuthSharedprefrencesDataSources();

class GetProfileApiDataSources {
  final _dio = Dio(BaseOptions(baseUrl: ApiConst.baseUrl));
  Future<ProfileResponse> getProfile() async {
    try {
      final token = await localDataSources.getToken();
      print("🔑 Token used for profile request: $token");
      final response = await _dio.get(
        ApiConst.profileEndPoint,
        options: Options(headers: {"Authorization": "Bearer $token"}),
      );
      return ProfileResponse.fromJson(response.data);
    } on DioException catch (exception) {
      String? message = exception.response?.data['message'];
      throw RemoteException(message: message ?? "Failed to get profile");
    }
  }
}
