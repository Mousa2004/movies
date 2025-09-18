import 'package:movies/auth/data/data_sources/remote/register_api_data_sources.dart';
import 'package:movies/auth/data/models/register_request.dart';
import 'package:movies/auth/data/models/register_response.dart';
import 'package:movies/shared/view/widget/app_exception.dart';

class RegisterRepository {
  RegisterApiDataSources registerApiDataSources;
  RegisterRepository(this.registerApiDataSources);

  Future<RegisterResponse> register(RegisterRequest registerRequest) {
    try {
      return registerApiDataSources.register(registerRequest);
    } catch (exception) {
      throw RepositoryException(message: exception.toString());
    }
  }
}
