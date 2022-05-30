import 'package:special_tests/domain/special_tests/entity/special_tests_model.dart';
import 'package:special_tests/infrastructure/special_test/data_provider/special_test_provider.dart';

class SpecialTestRepository {
  final SpecialTestDataProvider dataProvider;
  SpecialTestRepository({required this.dataProvider});

  Future<bool> create(SpecialTest test) async {
    return dataProvider.create(test);
  }

  Future<SpecialTest?> update(String name, SpecialTest test) async {
    return dataProvider.update(name, test);
  }

  Future<List<SpecialTest>> fetchAll() async {
    return dataProvider.fetchAll();
  }

  Future<void> delete(String id) async {
    dataProvider.delete(id);
  }
}
