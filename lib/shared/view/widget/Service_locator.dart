import 'package:movies/auth/data/data_sources/remote/google_signin_datasource.dart';
import 'package:movies/auth/data/data_sources/remote/login_api_data_sources.dart';
import 'package:movies/auth/data/data_sources/remote/register_api_data_sources.dart';
import 'package:movies/home/data/data_sources/reset_password_api_data_sources.dart';
import 'package:movies/home/data/data_sources/delete_profile_api_data_sources.dart';
import 'package:movies/home/data/data_sources/update_profile_api_data_sources.dart';
import 'package:movies/movies/data/data_sources/api/get_profile_api_data_sources.dart';
import 'package:movies/movies/data/data_sources/api/history_data_sources.dart';
import 'package:movies/movies/data/data_sources/api/watch_list_data_sources.dart';

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
  static GoogleSigninDatasource googleSigninDatasource =
      GoogleSigninDatasource();

  static WatchListDataSources watchListDataSources = WatchListDataSources();
  static HistoryDataSources historyDataSources = HistoryDataSources();
  static GetProfileApiDataSources getProfileApiDataSources =
      GetProfileApiDataSources();
}
