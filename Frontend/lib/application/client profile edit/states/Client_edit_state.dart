part of '../bloc/Client_edit_profile_bloc.dart';

abstract class ClientState extends Equatable {
  const ClientState();

  @override
  List<Object> get props => [];
}

class Idles extends ClientState {}

class updatingClient extends ClientState {}

class loadingClient extends ClientState {}

class updateSuccess extends ClientState {
  updateSuccess();

  @override
  List<Object> get props => [];
}

class updateFailed extends ClientState {
  final String message;
  updateFailed(this.message);

  @override
  List<Object> get props => [message];
}

class deletingClient extends ClientState {}

class deleteSuccess extends ClientState {
  deleteSuccess();

  @override
  List<Object> get props => [];
}

class deleteFailed extends ClientState {
  final String message;
  deleteFailed(this.message);

  @override
  List<Object> get props => [message];
}

class loadClientSuccess extends ClientState {
  final Client client;
  const loadClientSuccess({required this.client});

  @override
  List<Object> get props => [client];
}

class loadClientFailed extends ClientState {
  final String message;
  loadClientFailed(this.message);

  @override
  List<Object> get props => [message];
}
