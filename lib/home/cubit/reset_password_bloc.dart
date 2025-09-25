import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/home/cubit/reset_password_state.dart';
import 'package:movies/home/data/models/reset_password_request.dart';
import 'package:movies/home/data/repositories/reset_password_repository.dart';
import 'package:movies/shared/view/widget/Service_locator.dart';
import 'package:movies/shared/view/widget/app_exception.dart';

ResetPasswordRepository resetPasswordRepository = ResetPasswordRepository(
  ServiceLocator.resetPasswordApiDataSources,
);

class ResetPasswordBloc extends Cubit<ResetPasswordState> {
  ResetPasswordBloc() : super(InitialState());

  Future<void> resetPassword(ResetPasswordRequest resetPasswordRequest) async {
    emit(ResetPasswordLoading());
    try {
      await resetPasswordRepository.resetPassword(resetPasswordRequest);
      emit(ResetPasswordSuccess());
    } on RemoteException catch (error) {
      emit(ResetPasswordError(message: error.toString()));
    }
  }
}
