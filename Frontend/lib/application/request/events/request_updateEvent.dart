part of '../bloc/request_updateBloc.dart';

abstract class requestUpdateEvent extends Equatable {
  const requestUpdateEvent();
}

class requestupdateRequest extends requestUpdateEvent {
  final int requestId;
  final String status;

  const requestupdateRequest({required this.status, required this.requestId});
  @override
  List<Object> get props => [requestId, status];

  @override
  String toString() => 'Request Updated {request Id: $requestId}';
}

class requestDeleteRequest extends requestUpdateEvent {
  final int requestId;
  const requestDeleteRequest(this.requestId);

  @override
  List<Object> get props => [requestId];

  @override
  String toString() => 'Request Deleted {request Id: $requestId}';

  @override
  bool? get stringify => true;
}
