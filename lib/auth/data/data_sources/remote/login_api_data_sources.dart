import 'package:dio/dio.dart';
import 'package:movies/auth/data/models/login_request.dart';
import 'package:movies/auth/data/models/login_response.dart';
import 'package:movies/shared/const/api_const.dart';
import 'package:movies/shared/view/widget/app_exception.dart';

Dio _dio = Dio(BaseOptions(baseUrl: ApiConst.baseUrl));

class LoginApiDataSources {
  Future<LoginResponse> login(LoginRequest loginRequest) async {
    try {
      final response = await _dio.post(
        ApiConst.loginEndPoint,
        data: loginRequest.toJson(),
      );
      return LoginResponse.fromJson(response.data);
    } on DioException catch (exception) {
      String? message;

      message = exception.response?.data['message'];
      throw RemoteException(message: message ?? "Faild to register");
    }
  }
}
