import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/home/cubit/update_profile_state.dart';
import 'package:movies/home/data/models/update_profile_request.dart';
import 'package:movies/home/data/repositories/update_profile_repository.dart';
import 'package:movies/shared/view/widget/Service_locator.dart';
import 'package:movies/shared/view/widget/app_exception.dart';

UpdateProfileRepository updateProfileRepository = UpdateProfileRepository(
  ServiceLocator.updateProfileApiDataSources,
);

class UpdateProfileBloc extends Cubit<UpdateProfileState> {
  UpdateProfileBloc() : super(InitialState());

  Future<void> updateProfile(UpdateProfileRequest updateProfileRequest) async {
    emit(UpdateProfileLoading());
    try {
      await updateProfileRepository.updateProfile(updateProfileRequest);
      emit(UpdateProfileSuccess());
    } on RemoteException catch (error) {
      emit(UpdateProfileError(message: error.toString()));
    }
  }
}
