import '../../domain/model/origin_model.dart';
import '../../domain/port/output/repository.dart';

import 'fakeDB.dart';

class Memory implements Repository<OriginModel> {
  @override
  Future<List<OriginModel>> findAll() async {
    return fakeDB.map((e) => OriginModel.fromMap(e)).toList();
  }

  @override
  Future<bool> create(OriginModel item) {
    // TODO: implement create
    throw UnimplementedError();
  }

  @override
  Future<bool> delete(int id) {
    // TODO: implement delete
    throw UnimplementedError();
  }
}
