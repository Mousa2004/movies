import 'package:dio/dio.dart';
import 'package:movies/home/data/models/reset_password_request.dart';
import 'package:movies/home/data/models/reset_password_response.dart';
import 'package:movies/shared/const/api_const.dart';
import 'package:movies/shared/view/widget/app_exception.dart';
import 'package:movies/auth/data/data_sources/local/auth_sharedprefrences_data_sources.dart';
import 'package:movies/auth/data/data_sources/local/auth_local_data_sources.dart';

Dio _dio = Dio(BaseOptions(baseUrl: ApiConst.baseUrl));

class ResetPasswordApiDataSources {
  AuthLocalDataSources localDataSources = AuthSharedprefrencesDataSources();

  Future<ResetPasswordResponse> resetPassword(
    ResetPasswordRequest resetPasswordRequest,
  ) async {
    try {
      final token = await localDataSources.getToken();
      final response = await _dio.patch(
        ApiConst.resetPasswordEndPoint,
        data: resetPasswordRequest.toJson(),
        options: Options(headers: {"Authorization": "Bearer $token"}),
      );

      return ResetPasswordResponse.fromJson(response.data);
    } on DioException catch (exception) {
      String? message = exception.response?.data['message'];
      throw RemoteException(message: message ?? "Failed to reset password");
    }
  }
}
