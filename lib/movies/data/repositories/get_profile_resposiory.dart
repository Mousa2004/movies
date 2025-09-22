import 'package:movies/movies/data/data_sources/api/get_profile_api_data_sources.dart';
import 'package:movies/movies/data/models/profile_response.dart';
import 'package:movies/shared/view/widget/app_exception.dart';

class GetProfileResposiory {
  final GetProfileApiDataSources getProfileApiDataSources;
  GetProfileResposiory(this.getProfileApiDataSources);
  Future<ProfileResponse> getProfile() async {
    try {
      return await getProfileApiDataSources.getProfile();
    } catch (exception) {
      throw RepositoryException(message: exception.toString());
    }
  }
}
