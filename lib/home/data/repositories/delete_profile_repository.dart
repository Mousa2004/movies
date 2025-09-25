import 'package:movies/home/data/data_sources/delete_profile_api_data_sources.dart';
import 'package:movies/home/data/models/delete_profile_response.dart';
import 'package:movies/shared/view/widget/app_exception.dart';

class DeleteProfileRepository {
  DeleteProfileApiDataSources deleteProfileApiDataSources;
  DeleteProfileRepository(this.deleteProfileApiDataSources);
  Future<DeleteProfileResponse> deleteProfile() {
    try {
      return deleteProfileApiDataSources.deleteProfile();
    } catch (exception) {
      throw RepositoryException(message: exception.toString());
    }
  }
}
