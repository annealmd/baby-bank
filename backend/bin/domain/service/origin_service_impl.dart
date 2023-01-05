import '../model/origin_model.dart';
import '../port/input/origin_service.dart';
import '../port/output/origin_repository.dart';

class OriginServiceImpl implements OriginService {
  final OriginRepository _originRepository;

  OriginServiceImpl(this._originRepository);
  @override
  Future<List<OriginModel>> getListOrigin() async {
    return await _originRepository.findAllOrigin();
  }
}
