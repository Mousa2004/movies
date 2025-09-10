import 'package:dio/dio.dart';
import 'package:movies/auth/data/data_sources/local/auth_local_data_sources.dart';
import 'package:movies/auth/data/data_sources/local/auth_sharedprefrences_data_sources.dart';
import 'package:movies/home/data/models/delete_profile_response.dart';
import 'package:movies/shared/const/api_const.dart';
import 'package:movies/shared/view/widget/app_exception.dart';

Dio _dio = Dio(BaseOptions(baseUrl: ApiConst.baseUrl));

class DeleteProfileApiDataSources {
  AuthLocalDataSources localDataSources = AuthSharedprefrencesDataSources();
  Future<DeleteProfileResponse> deleteProfile() async {
    try {
      final token = await localDataSources.getToken();
      final response = await _dio.delete(
        ApiConst.updateProfileEndPoint,

        options: Options(headers: {"Authorization": "Bearer $token"}),
      );

      return DeleteProfileResponse.fromJson(response.data);
    } on DioException catch (exception) {
      String? message = exception.response?.data['message'];
      throw RemoteException(message: message ?? "Failed to delete profile");
    }
  }
}
