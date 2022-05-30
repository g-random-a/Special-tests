import 'package:special_tests/domain/request/entity/request.dart';
import 'package:special_tests/infrastructure/request/data_provider/request_provider.dart';

class RequestRepository {
  final RequestDataProvider dataProvider;
  
  RequestRepository({required this.dataProvider});

  Future<bool> create(Request request) async {
    return dataProvider.makeRequest(request);
  }

  Future<Request?> update(String status, int id) async {
    return dataProvider.updateRequest(status, id);
  }

  Future<List<Request>> fetchAll() async {
    return dataProvider.fetchAllRequests();
  }

  Future<void> delete(int id) async {
    dataProvider.deleteRequest(id);
  }
}
