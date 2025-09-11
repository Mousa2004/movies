import 'package:firebase_auth/firebase_auth.dart';
import 'package:movies/auth/data/data_sources/local/auth_local_data_sources.dart';
import 'package:movies/auth/data/data_sources/local/auth_sharedprefrences_data_sources.dart';
import 'package:movies/auth/data/data_sources/remote/google_signin_datasource.dart';
import 'package:movies/shared/view/widget/app_exception.dart';

AuthLocalDataSources localDataSources = AuthSharedprefrencesDataSources();

class GoogleSigninRepository {
  final GoogleSigninDatasource googleSigninDatasource;
  GoogleSigninRepository(this.googleSigninDatasource);
  Future<UserCredential?> signInWithGoogle() async {
    try {
      final response = await googleSigninDatasource.signInWithGoogle();
      await localDataSources.saveToken(response.user?.uid ?? "");
      return response;
    } catch (exception) {
      throw RepositoryException(message: exception.toString());
    }
  }
}
