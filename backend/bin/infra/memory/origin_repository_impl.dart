import '../../domain/model/origin_model.dart';
import '../../domain/port/output/origin_repository.dart';

import 'fakeDB.dart';

class OriginRepositoryIpml implements OriginRepository {
  @override
  Future<List<OriginModel>> findAllOrigin() async {
    return fakeDB.map((e) => OriginModel.fromMap(e)).toList();
  }
}
