import 'package:movies/home/data/data_sources/update_profile_api_data_sources.dart';
import 'package:movies/home/data/models/update_profile_request.dart';
import 'package:movies/home/data/models/update_profile_response.dart';
import 'package:movies/shared/view/widget/app_exception.dart';

class UpdateProfileRepository {
  UpdateProfileApiDataSources updateProfileApiDataSources;
  UpdateProfileRepository(this.updateProfileApiDataSources);
  Future<UpdateProfileResponse> updateProfile(
    UpdateProfileRequest updateProfileRequest,
  ) {
    try {
      return updateProfileApiDataSources.updateProfile(updateProfileRequest);
    } catch (exception) {
      throw RepositoryException(message: exception.toString());
    }
  }
}
