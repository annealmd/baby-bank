import '../../model/origin_model.dart';

abstract class OriginRepository {
  Future<List<OriginModel>> findAllOrigin();
}
