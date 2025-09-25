import 'package:movies/home/data/data_sources/reset_password_api_data_sources.dart';
import 'package:movies/home/data/models/reset_password_request.dart';
import 'package:movies/home/data/models/reset_password_response.dart';
import 'package:movies/shared/view/widget/app_exception.dart';

class ResetPasswordRepository {
  ResetPasswordApiDataSources resetPasswordApiDataSources;
  ResetPasswordRepository(this.resetPasswordApiDataSources);
  Future<ResetPasswordResponse> resetPassword(
    ResetPasswordRequest resetPasswordRequest,
  ) {
    try {
      return resetPasswordApiDataSources.resetPassword(resetPasswordRequest);
    } catch (exception) {
      throw RepositoryException(message: exception.toString());
    }
  }
}
