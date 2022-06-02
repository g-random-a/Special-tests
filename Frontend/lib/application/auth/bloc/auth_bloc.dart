// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:http/http.dart';
import 'package:special_tests/application/auth/events/auth_events.dart';
import 'package:special_tests/application/auth/states/auth_state.dart';
import 'package:special_tests/domain/auth/entity/auth_model.dart';
import 'package:special_tests/domain/core/database.dart';
import 'package:special_tests/infrastructure/auth/repository/auth_repository.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthRepository authRepository;
  AuthBloc(this.authRepository) : super(InitState()) {
    on<LoginEvent>((LoginEvent event, Emitter emit) async {
      emit(LoggingIn());
      try {
        User user = await authRepository.signIn(event.login);
        emit(LoginSuccess(user: user));
        await AppsDatabase.instance.createUser(user);
      } on ClientException catch (e) {
        emit(LogginError(e.message));
      } catch (e) {
        emit(LogginError(e.toString()));
      }
    });

    on<NextBtnPressedEvent>((NextBtnPressedEvent event, Emitter emit) async {
      emit(NextBtnPressedState(user: event.user));
    });

    on<RegisterclientEvent>((RegisterclientEvent event, Emitter emmit) async {
      emmit(Registering());
      try {
        print('registering user');
        bool res = await authRepository.signUpClient(event.register);
        if (res) {
          print("created successfuly");
          emmit(RegisterSuccess());
        }
      } catch (e) {
        emmit(RegisterError("Register failed}"));
      }
    });

    on<RegisterHospEvent>((RegisterHospEvent event, Emitter emmit) async {
      emmit(Registering());
      try {
        print('registering user');
        bool res = await authRepository.signUpHosp(event.register);
        if (res) {
          print("created successfuly");
          emmit(RegisterSuccess());
        }
      } catch (e) {
        emmit(RegisterError("Register failed"));
      }
    });
  }
}
