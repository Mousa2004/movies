import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/auth/cubit/auth_state.dart';
import 'package:movies/auth/data/models/login_request.dart';
import 'package:movies/auth/data/models/register_request.dart';

import 'package:movies/auth/data/repositories/login_repository.dart';
import 'package:movies/auth/data/repositories/register_repository.dart';
import 'package:movies/shared/view/widget/Service_locator.dart';
import 'package:movies/shared/view/widget/app_exception.dart';

RegisterRepository registerRepository = RegisterRepository(
  ServiceLocator.registerApiDataSources,
);

LoginRepository loginRepository = LoginRepository(
  ServiceLocator.loginApiDataSources,
);

class AuthBloc extends Cubit<AuthState> {
  AuthBloc() : super(InitialState());

  Future<void> register(RegisterRequest reisterRequest) async {
    emit(RegisterLoading());
    try {
      await registerRepository.register(reisterRequest);
      emit(RegisterSuccess());
    } on RemoteException catch (error) {
      emit(RegisterError(message: error.toString()));
    }
  }

  Future<void> login(LoginRequest loginRequest) async {
    emit(LoginLoading());
    try {
      await loginRepository.login(loginRequest);
      emit(LoginSuccess());
    } on RemoteException catch (error) {
      emit(LoginError(message: error.toString()));
    }
  }
}
