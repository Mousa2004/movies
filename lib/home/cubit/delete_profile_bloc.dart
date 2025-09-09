import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/home/cubit/delete_profile_state.dart';
import 'package:movies/home/data/repositories/delete_profile_repository.dart';
import 'package:movies/shared/view/widget/Service_locator.dart';
import 'package:movies/shared/view/widget/app_exception.dart';

DeleteProfileRepository deleteProfileRepository = DeleteProfileRepository(
  ServiceLocator.deleteProfileApiDataSources,
);

class DeleteProfileBloc extends Cubit<DeleteProfileState> {
  DeleteProfileBloc() : super(InitialState());

  Future<void> deleteProfile() async {
    emit(DeleteProfileLoading());
    try {
      await deleteProfileRepository.deleteProfile();
      emit(DeleteProfileSuccess());
    } on RemoteException catch (error) {
      emit(DeleteProfileError(message: error.toString()));
    }
  }
}
