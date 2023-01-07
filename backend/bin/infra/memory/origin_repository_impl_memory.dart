import '../../domain/model/origin_model.dart';
import '../../domain/port/output/repository.dart';

import 'fakeDB.dart';

class OriginRepositoryIpmlMemory implements Repository<OriginModel> {
  @override
  Future<List<OriginModel>> findAllOrigin() async {
    return fakeDB.map((e) => OriginModel.fromMap(e)).toList();
  }
}
