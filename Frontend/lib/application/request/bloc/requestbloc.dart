import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:special_tests/domain/request/entity/request.dart';
import 'package:special_tests/infrastructure/request/repository/request_repository.dart';
part '../events/requestEvent.dart';
part '../states/requestState.dart';

class requestbloc extends Bloc<requestEvent, requestState> {
  final RequestRepository requestRepository;

  requestbloc({required this.requestRepository}) : super(requestLoading()) {
    on<makeRequest>((event, emit) async {
      try {
        await requestRepository.create(event.request);

        emit(requestOperationSuccess());
      } catch (error) {
        emit(requestOperationFailure(error));
      }
    });
  }
}
