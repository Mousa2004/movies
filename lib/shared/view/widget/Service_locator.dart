import 'package:movies/auth/data/data_sources/remote/login_api_data_sources.dart';
import 'package:movies/auth/data/data_sources/remote/register_api_data_sources.dart';
import 'package:movies/home/data/data_sources/reset_password_api_data_sources.dart';
import 'package:movies/home/data/data_sources/delete_profile_api_data_sources.dart';
import 'package:movies/home/data/data_sources/update_profile_api_data_sources.dart';

class ServiceLocator {
  static RegisterApiDataSources registerApiDataSources =
      RegisterApiDataSources();
  static LoginApiDataSources loginApiDataSources = LoginApiDataSources();

  static UpdateProfileApiDataSources updateProfileApiDataSources =
      UpdateProfileApiDataSources();

  static DeleteProfileApiDataSources deleteProfileApiDataSources =
      DeleteProfileApiDataSources();

  static ResetPasswordApiDataSources resetPasswordApiDataSources =
      ResetPasswordApiDataSources();
}
