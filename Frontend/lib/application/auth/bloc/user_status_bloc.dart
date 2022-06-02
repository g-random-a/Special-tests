// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:special_tests/application/auth/events/status_events.dart';
import 'package:special_tests/application/auth/states/status_state.dart';
import 'package:special_tests/infrastructure/auth/repository/auth_repository.dart';

class AuthStatusBloc extends Bloc<AuthStatusEvent, AuthStatusState> {
  final AuthRepository authRepository;
  AuthStatusBloc(this.authRepository) : super(AppInitState()) {
    on<CheckAuthenticationEvent>(
        (CheckAuthenticationEvent event, Emitter emit) async {
      try {
        final user = await authRepository.checkUser();
        if (user == null) {
          emit(UnAuthenticatedState());
        } else {
          emit(AuthenticatedState(user));
        }
      } catch (e) {
        emit(UnAuthenticatedState());
        print("error");
      }
    });
  }
}
