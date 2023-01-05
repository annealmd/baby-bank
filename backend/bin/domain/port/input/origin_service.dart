import '../../model/origin_model.dart';

abstract class OriginService {
  Future<List<OriginModel>> getListOrigin();
}
