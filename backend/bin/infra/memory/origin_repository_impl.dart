import '../../domain/model/origin_model.dart';
import '../../domain/port/output/origin_repository.dart';
import '../origin_mapper.dart';
import 'fakeDB.dart';

class OriginRepositoryIpml implements OriginRepository {
  @override
  List<OriginModel> findAllOrigin() {
    return fakeDB.map((e) => OriginMapper().toDomain(e)).toList();
  }
}
