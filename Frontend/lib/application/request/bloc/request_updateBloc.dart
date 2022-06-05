import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:special_tests/infrastructure/request/repository/request_repository.dart';
part '../events/request_updateEvent.dart';
part '../states/request_updateState.dart';

class requestUpdatebloc extends Bloc<requestUpdateEvent, requestUpdateState> {
  final RequestRepository requestRepository;

  requestUpdatebloc({required this.requestRepository}) : super(idle()) {
    on<requestupdateRequest>((event, emit) async {
      emit(requestUpdateLoading());
      try {
        await requestRepository.update(event.status, event.requestId);
        emit(requestUpdateOperationSuccess(Status: event.status));
      } catch (error) {
        emit(requestUpdateOperationFailure(error));
      }
    });

    on<requestDeleteRequest>((event, emit) async {
      emit(requestUpdateLoading());
      try {
        await requestRepository.delete(event.requestId);

        final requests = await requestRepository.fetchAll();

        emit(requestUpdateOperationSuccess(Status: "deleted"));
      } catch (error) {
        emit(requestUpdateOperationFailure(error));
      }
    });
  }
}
