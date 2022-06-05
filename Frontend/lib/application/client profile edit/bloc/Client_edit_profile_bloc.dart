import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:special_tests/domain/client/entity/client.dart';
import 'package:special_tests/domain/core/database.dart';
import 'package:special_tests/infrastructure/client/repository/client_repository.dart';
part '../events/Client_edit_profile_event.dart';
part '../states/Client_edit_state.dart';

class ClientBloc extends Bloc<ClientEvent, ClientState> {
  ClientRepository clientRepository;
  ClientBloc({required this.clientRepository}) : super(Idles()) {
    on<loadClient>((loadClient event, Emitter emit) async {
      emit(loadingClient());
      try {
        Client client = await AppsDatabase.instance.getClient();
        emit(loadClientSuccess(client: client));
      } catch (e) {
        emit(loadClientFailed(e.toString()));
      }
    });

    on<updateClient>((event, emit) async {
      try {
        emit(updatingClient());
        await clientRepository.update(event.clientId, event.client);
        emit(updateSuccess());
      } catch (error) {
        emit(updateFailed("Update Failed"));
      }
    });

    on<DeleteClient>((event, emit) async {
      try {
        emit(deletingClient());
        await clientRepository.delete(event.clientId);
        emit(deleteSuccess());
      } catch (error) {
        emit(deleteFailed("Unable to Delete"));
      }
    });
  }
}
