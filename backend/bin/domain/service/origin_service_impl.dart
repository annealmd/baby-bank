import '../model/origin_model.dart';
import '../port/input/service.dart';
import '../port/output/origin_repository.dart';

class OriginServiceImpl implements Service<OriginModel> {
  final Repository<OriginModel> _originRepository;

  OriginServiceImpl(this._originRepository);
  @override
  Future<List<OriginModel>> getListOrigin() async {
    return await _originRepository.findAllOrigin();
  }
}
