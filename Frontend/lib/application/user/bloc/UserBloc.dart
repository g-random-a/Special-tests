import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:special_tests/domain/auth/entity/auth_model.dart';
import 'package:special_tests/infrastructure/user/repository/user_repository.dart';
part '../events/UserEvent.dart';
part '../states/UserState.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserRepository userRepository;
  UserBloc({required this.userRepository}) : super(IdleUser()) {
    on<updateUser>((event, emit) async {
      try {
        emit(updatingUser());
        await userRepository.update(event.userId, event.user);
        emit(updateUserSuccess());
      } catch (error) {
        emit(updateUserFailed("Update Failed"));
      }
    });

  }
}
