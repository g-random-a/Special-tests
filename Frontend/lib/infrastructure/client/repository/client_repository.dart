import 'package:special_tests/domain/client/entity/client.dart';
import 'package:special_tests/infrastructure/client/data_provider/client_provider.dart';

class ClientRepository {
  final ClientDataProvider dataProvider;
  ClientRepository({required this.dataProvider});

  Future<Client?> create(Client client) async {
    return dataProvider.create(client);
  }

  Future<Client> update(String id, Client client) async {
    return dataProvider.update(id, client);
  }
  
  Future<void> delete(String id) async {
    dataProvider.delete(id);
  }
}
