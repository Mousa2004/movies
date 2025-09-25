import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/movies/bloc/get_profile_state.dart';
import 'package:movies/movies/data/repositories/get_profile_resposiory.dart';
import 'package:movies/shared/view/widget/Service_locator.dart';
import 'package:movies/shared/view/widget/app_exception.dart';

final getProfileResposiory = GetProfileResposiory(
  ServiceLocator.getProfileApiDataSources,
);

class GetProfileBloc extends Cubit<GetProfileState> {
  GetProfileBloc() : super(InialGetProfile());
  Future<void> getProfile() async {
    emit(GetProfileLoading());
    try {
      final profile = await getProfileResposiory.getProfile();
      emit(GetProfileSuccess(profile: profile));
    } on RemoteException catch (error) {
      emit(GetProfileError(message: error.toString()));
    }
  }
}
