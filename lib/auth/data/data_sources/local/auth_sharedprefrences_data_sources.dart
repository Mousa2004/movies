import 'package:movies/auth/data/data_sources/local/auth_local_data_sources.dart';
import 'package:movies/shared/const/api_const.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthSharedprefrencesDataSources implements AuthLocalDataSources {
  @override
  Future<String> getToken() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    return sharedPreferences.getString(CacheConstant.tokenKey)!;
  }

  @override
  Future<void> saveToken(String token) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    sharedPreferences.setString(CacheConstant.tokenKey, token);
  }
}
