part of '../bloc/requestbloc.dart';

abstract class requestEvent extends Equatable {
  const requestEvent();
}

class loadRequest extends requestEvent {
  const loadRequest();
  @override
  List<Object> get props => [];
}

class makeRequest extends requestEvent {
  final Request request;
  const makeRequest(this.request);

  @override
  List<Object> get props => [request];

  @override
  String toString() => 'Request Created {request Id: ${request.requestId}}';
}

class updateRequest extends requestEvent {
  final int requestId;
  final String status;

  const updateRequest(this.status, this.requestId);
  @override
  List<Object> get props => [requestId, status];

  @override
  String toString() => 'Request Updated {request Id: $requestId}';
}

class DeleteRequest extends requestEvent {
  final int requestId;
  const DeleteRequest(this.requestId);

  @override
  List<Object> get props => [requestId];

  @override
  String toString() => 'Request Deleted {request Id: $requestId}';

  @override
  bool? get stringify => true;
}
