import '../model/origin_model.dart';
import '../port/input/service.dart';
import '../port/output/repository.dart';

class OriginServiceIpml implements Service<OriginModel> {
  final Repository<OriginModel> _originRepository;

  OriginServiceIpml(this._originRepository);
  @override
  Future<List<OriginModel>> getList(int userId) async {
    return await _originRepository.findAll(userId);
  }

  @override
  Future<bool> addItem(OriginModel item, int userId) async {
    return await _originRepository.create(item, userId);
  }

  @override
  Future<bool> deleteItem(int id) async {
    return await _originRepository.delete(id);
  }
}
