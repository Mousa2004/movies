import 'package:dio/dio.dart';
import 'package:movies/auth/data/models/register_request.dart';
import 'package:movies/auth/data/models/register_response.dart';
import 'package:movies/shared/const/api_const.dart';
import 'package:movies/shared/view/widget/app_exception.dart';

Dio _dio = Dio(BaseOptions(baseUrl: ApiConst.baseUrl));

class RegisterApiDataSources {
  Future<RegisterResponse> register(RegisterRequest registerRequest) async {
    try {
      final response = await _dio.post(
        ApiConst.registerEndPoint,
        data: registerRequest.toJson(),
      );
      return RegisterResponse.fromJson(response.data);
    } on DioException catch (exception) {
      String? message;

      message = exception.response?.data['message'];
      throw RemoteException(message: message ?? "Faild to register");
    }
  }
}
