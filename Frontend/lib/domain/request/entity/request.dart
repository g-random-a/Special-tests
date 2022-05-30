import 'package:special_tests/domain/client/entity/client.dart';
import 'package:special_tests/domain/hospital/entity/hospital.dart';
import 'package:special_tests/domain/special_tests/entity/special_tests_model.dart';

class Request {
  final String requestId;
  final Hospital to;
  final Client? from;
  final SpecialTest test;
  final String date;
  final String status;

  Request({
    required this.requestId,
    required this.to,
    required this.from,
    required this.test,
    required this.date,
    required this.status,
  });

  factory Request.fromJson(Map<String, dynamic> json) {
    return Request(
      requestId: json['req_id'],
      to: json['to'],
      from: json['from'],
      test: json['test'],
      date: json['date'],
      status: json['status'],
    );
  }
  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['req_id'] = requestId;
    json['to'] = to.hospId;
    json['from'] = from != null ? from!.clientId : "null";
    json['test'] = test.id;
    json['date'] = date;
    json['status'] = status;
    return json;
  }

  @override
  String toString() {
    return "request id: $requestId, status: $status";
  }
}
