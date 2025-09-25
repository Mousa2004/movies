import 'package:movies/auth/data/data_sources/local/auth_local_data_sources.dart';
import 'package:movies/auth/data/data_sources/local/auth_sharedprefrences_data_sources.dart';
import 'package:movies/auth/data/data_sources/remote/login_api_data_sources.dart';
import 'package:movies/auth/data/models/login_request.dart';
import 'package:movies/auth/data/models/login_response.dart';

import 'package:movies/shared/view/widget/app_exception.dart';

class LoginRepository {
  AuthLocalDataSources localDataSources = AuthSharedprefrencesDataSources();
  LoginApiDataSources loginApiDataSources;
  LoginRepository(this.loginApiDataSources);

  Future<LoginResponse> login(LoginRequest loginRequest) async {
    try {
      final response = await loginApiDataSources.login(loginRequest);
      await localDataSources.saveToken(response.data!);
      return response;
    } catch (exception) {
      throw RepositoryException(message: exception.toString());
    }
  }
}
