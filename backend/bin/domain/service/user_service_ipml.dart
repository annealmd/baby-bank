import '../model/user_model.dart';
import '../port/input/service.dart';
import '../port/output/repository.dart';

class UserServiceIpml implements Service {
  final Repository<UserModel> _userRepository;

  UserServiceIpml(this._userRepository);

  @override
  Future<bool> addItem({int? idUser, required UserModel item}) async {
    // TODO: implement addItem
    throw UnimplementedError();
  }

  @override
  Future<bool> deleteItem({int? idUser, required int id}) async {
    return await _userRepository.delete(idUser, id);
  }

  @override
  Future<List<UserModel>> getList({int? idUser}) async {
    return await _userRepository.findAll(idUser);
  }
}
