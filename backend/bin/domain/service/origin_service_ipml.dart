import '../model/origin_model.dart';
import '../port/input/service.dart';
import '../port/output/repository.dart';

class OriginServiceIpml implements Service<OriginModel> {
  final Repository<OriginModel> _originRepository;

  OriginServiceIpml(this._originRepository);
  @override
  Future<List<OriginModel>> getList({int? idUser}) async {
    return await _originRepository.findAll(idUser!);
  }

  @override
  Future<bool> saveItem({int? idUser, required OriginModel item}) async {
    if (item.id != null) {
      return await _originRepository.update(idUser!, item);
    }
    return await _originRepository.create(idUser!, item);
  }

  @override
  Future<bool> deleteItem({int? idUser, required int id}) async {
    return await _originRepository.delete(idUser!, id);
  }
}
