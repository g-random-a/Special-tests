part of '../bloc/Client_edit_profile_bloc.dart';

abstract class ClientEvent extends Equatable {
  const ClientEvent();
}

class updateClient extends ClientEvent {
  final String clientId;
  final Client client;

  const updateClient(this.clientId, this.client);
  @override
  List<Object> get props => [clientId, client];

  @override
  String toString() => 'Client Updated {Client Id: ${client.clientId}}';
}

class loadClient extends ClientEvent {
  const loadClient();
  @override
  List<Object> get props => [];

  @override
  String toString() => 'Client loading';
}

class DeleteClient extends ClientEvent {
  final String clientId;
  const DeleteClient(this.clientId);

  @override
  List<Object> get props => [clientId];

  @override
  String toString() => 'Client Deleted {Client Id: $clientId}';

  @override
  bool? get stringify => true;
}
