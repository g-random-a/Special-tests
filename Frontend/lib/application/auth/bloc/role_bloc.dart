import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part '../events/role_event.dart';
part '../states/role_state.dart';

class RoleBloc extends Bloc<RoleEvent, RoleState> {
  RoleBloc() : super(Idle()) {
    on<clientRole>(_onclient);
    on<hospitalRole>(_onhospital);
  }
  void _onclient(clientRole Event, Emitter emit) {
    emit(clientState());
  }

  void _onhospital(hospitalRole Event, Emitter emit) {
    emit(hospitalState());
  }
}
